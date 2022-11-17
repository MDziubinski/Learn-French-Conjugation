import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'first_group_introduction_state.freezed.dart';

@freezed
class FirstGroupCourseContentState with _$FirstGroupCourseContentState {
  const factory FirstGroupCourseContentState.initial() = _Initial;

  @Implements<BuildState>()
  const factory FirstGroupCourseContentState.loading() = _Loading;

  @Implements<BuildState>()
  const factory FirstGroupCourseContentState.loaded({
    required FirstGroupCourse firstGroupCourse,
    required Map<String, bool> progres,
  }) = _Loaded;

  @Implements<BuildState>()
  const factory FirstGroupCourseContentState.error() = _Error;
}
