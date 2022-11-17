import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'single_choice_task_state.freezed.dart';

@freezed
class SingleChoiceTaskState with _$SingleChoiceTaskState {
  const factory SingleChoiceTaskState.initial() = _Initial;

  @Implements<BuildState>()
  const factory SingleChoiceTaskState.loading() = _Loading;

  @Implements<BuildState>()
  const factory SingleChoiceTaskState.idle({
    required List<bool> chosenAnswer,
    required List<String> answers,
    required bool isAnswerChosen,
  }) = _Idle;

  @Implements<BuildState>()
  const factory SingleChoiceTaskState.error() = _Error;
}
