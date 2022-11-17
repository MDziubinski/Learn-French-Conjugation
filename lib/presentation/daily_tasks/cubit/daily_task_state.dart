import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'daily_task_state.freezed.dart';

@freezed
class DailyTaskState with _$DailyTaskState {
  const factory DailyTaskState.initial() = _Initial;

  @Implements<BuildState>()
  const factory DailyTaskState.loading() = _Loading;

  @Implements<BuildState>()
  const factory DailyTaskState.notDone() = _NotDone;

  @Implements<BuildState>()
  const factory DailyTaskState.done() = _Done;

  @Implements<BuildState>()
  const factory DailyTaskState.error() = _Error;
}
