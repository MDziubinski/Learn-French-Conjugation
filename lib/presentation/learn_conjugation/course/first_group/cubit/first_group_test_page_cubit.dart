import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_test_page_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/course/first_group/get_first_group_test_tasks_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupTestPageCubit extends Cubit<FirstGroupTestPageState> {
  final GetFirstGroupTaskTestUseCase getFirstGroupTaskTestUseCase;

  FirstGroupTestPageCubit({required this.getFirstGroupTaskTestUseCase})
      : super(const FirstGroupTestPageState.initial());

  int _taskIndex = 0;
  List<bool> passedTasks = [];
  bool _isFinal = false;
  bool _passedTest = false;
  List<TaskModel> _tasks = [];

  Future<void> init() async {
    try {
      _tasks = await getFirstGroupTaskTestUseCase.call();
      passedTasks = List<bool>.generate(_tasks.length, (int index) => false);
    } catch (e, st) {
      logger.e('Error! Fail to get test data.', e, st);
    }
    _emitLoaded();
  }

  void nextQuestion(bool passedTask) {
    passedTasks[_taskIndex] = passedTask;
    if (_isFinal) {
      _passedTest = passedTasks.every((task) => task == true);
      emit(FirstGroupTestPageState.finished(
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
      FirstGroupTestPageState.loaded(
        tasks: _tasks,
        taskIndex: _taskIndex,
        isFinal: _isFinal,
      ),
    );
  }
}
