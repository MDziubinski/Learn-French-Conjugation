import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'multi_choice_task_state.freezed.dart';

@freezed
class MultiChoiceTaskState with _$MultiChoiceTaskState {
  const factory MultiChoiceTaskState.initial() = _Initial;

  @Implements<BuildState>()
  const factory MultiChoiceTaskState.loading() = _Loading;

  @Implements<BuildState>()
  const factory MultiChoiceTaskState.idle({
    required List<bool> chosenAnswer,
    required List<String> answers,
    required bool isAnswerChosen,
  }) = _Idle;

  @Implements<BuildState>()
  const factory MultiChoiceTaskState.error() = _Error;
}
