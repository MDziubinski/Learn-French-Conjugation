import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'first_group_test_page_state.freezed.dart';

@freezed
class FirstGroupTestPageState with _$FirstGroupTestPageState {
  const factory FirstGroupTestPageState.initial() = _Initial;

  @Implements<BuildState>()
  const factory FirstGroupTestPageState.loading() = _Loading;

  @Implements<BuildState>()
  const factory FirstGroupTestPageState.loaded({
    required List<TaskModel> tasks,
    required int taskIndex,
    required bool isFinal,
  }) = _Loaded;

  @Implements<BuildState>()
  const factory FirstGroupTestPageState.finished({
    required List<bool> passedTasks,
    required List<TaskModel> tasks,
    required bool passedTest,
  }) = _Finished;

  @Implements<BuildState>()
  const factory FirstGroupTestPageState.error() = _Error;
}
