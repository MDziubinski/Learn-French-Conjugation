import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'course_introduction_state.freezed.dart';

@freezed
class CourseIntroductionState with _$CourseIntroductionState {
  const factory CourseIntroductionState.initial() = _Initial;

  @Implements<BuildState>()
  const factory CourseIntroductionState.loading() = _Loading;

  @Implements<BuildState>()
  const factory CourseIntroductionState.loaded(
      {required CourseIntroduction courseIntroduction}) = _Loaded;

  @Implements<BuildState>()
  const factory CourseIntroductionState.error() = _Error;
}
