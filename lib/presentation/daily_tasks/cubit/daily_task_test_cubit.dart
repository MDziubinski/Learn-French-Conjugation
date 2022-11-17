import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/daily_task/model/daily_task.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/cubit/daily_task_test_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/daily_task/get_daily_task_use_case.dart';
import 'package:french_conjugation_learn/presentation/use_case/daily_task/update_daily_task_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DailyTaskTestCubit extends Cubit<DailyTaskTestState> {
  final GetDailyTasksUseCase _getDailyTasksUseCase;
  final UpdateDailyTasksUseCase _updateDailyTasksUseCase;

  DailyTaskTestCubit(
    this._getDailyTasksUseCase,
    this._updateDailyTasksUseCase,
  ) : super(const DailyTaskTestState.initial());

  int _taskIndex = 0;
  List<bool> passedTasks = [];
  bool _isFinal = false;
  bool _passedTest = false;
  List<TaskModel> _tasks = [];
  late DailyTask _currentDailyTaskSet;

  Future<void> init() async {
    try {
      _currentDailyTaskSet = await _getDailyTasksUseCase.call();
      _tasks = _currentDailyTaskSet.tasks;

      passedTasks = List<bool>.generate(_tasks.length, (int index) => false);
    } catch (e, st) {
      logger.e('Error! Fail to get test data.', e, st);
    }
    _emitLoaded();
  }

  void updateDailyTaskDate() {
    _updateDailyTasksUseCase.call();
  }

  void nextQuestion(bool passedTask) {
    passedTasks[_taskIndex] = passedTask;
    if (_isFinal) {
      _passedTest = passedTasks.every((task) => task == true);
      emit(DailyTaskTestState.finished(
        passedTasks: passedTasks,
        tasks: _tasks,
        passedTest: _passedTest,
      ));
    } else {
      _taskIndex++;
      if (_taskIndex == _tasks.length - 1) {
        _isFinal = true;
      }
      _emitLoaded();
    }
  }

  void _emitLoaded() {
    emit(
      DailyTaskTestState.loaded(
        tasks: _tasks,
        taskIndex: _taskIndex,
        isFinal: _isFinal,
      ),
    );
  }
}
