import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'daily_task_test_state.freezed.dart';

@freezed
class DailyTaskTestState with _$DailyTaskTestState {
  const factory DailyTaskTestState.initial() = _Initial;

  @Implements<BuildState>()
  const factory DailyTaskTestState.loading() = _Loading;

  @Implements<BuildState>()
  const factory DailyTaskTestState.loaded({
    required List<TaskModel> tasks,
    required int taskIndex,
    required bool isFinal,
  }) = _Loaded;

  @Implements<BuildState>()
  const factory DailyTaskTestState.finished({
    required List<bool> passedTasks,
    required List<TaskModel> tasks,
    required bool passedTest,
  }) = _Finished;

  @Implements<BuildState>()
  const factory DailyTaskTestState.error() = _Error;
}
