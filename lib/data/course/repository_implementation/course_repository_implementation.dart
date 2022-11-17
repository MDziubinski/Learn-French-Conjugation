import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:french_conjugation_learn/data/course/dtos/course_introduction_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/course_introduction_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';
import 'package:french_conjugation_learn/domain/course/repository/course_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseIntroductionDtoToCourseIntroductionMapper
      _courseIntroductionDtoToCourseIntroductionMapper;

  CourseRepositoryImpl(this._courseIntroductionDtoToCourseIntroductionMapper);

  @override
  Future<CourseIntroduction> getCourseIntroduction() async {
    final db = FirebaseFirestore.instance.collection('course');
    late CourseIntroductionDto tempIntro;

    await db.doc("introduction").get().then((doc) {
      final tempMap = doc.data();
      if (tempMap != null) {
        tempIntro = CourseIntroductionDto.fromJson(doc.data()!);
      }
    });

    return _courseIntroductionDtoToCourseIntroductionMapper.map(tempIntro);
  }
}
