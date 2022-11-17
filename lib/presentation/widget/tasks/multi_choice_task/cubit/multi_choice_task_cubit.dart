import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/multi_choice_task/cubit/multi_choice_task_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MultiChoiceTaskCubit extends Cubit<MultiChoiceTaskState> {
  MultiChoiceTaskCubit() : super(const MultiChoiceTaskState.initial());

  final List<String> _answersList = [];
  final List<bool> _passedTasks = [];
  late TaskModel _taskModel;

  List<bool> _chosenAnswer = [];

  bool _isAnswerChosen = false;

  void init(TaskModel taskModel) {
    _answersList.clear();
    _isAnswerChosen = false;
    _taskModel = taskModel;
    _chosenAnswer =
        List<bool>.generate(taskModel.answers.length, (int index) => false);
    for (final answer in taskModel.answers) {
      _answersList.add('${answer.identifier}. ${answer.answer}');
    }

    _emitIdle();
  }

  bool checkAnswers() {
    for (var i = 0; i < _chosenAnswer.length; i++) {
      if (_chosenAnswer[i]) {
        if (_taskModel.correctAnswers
            .contains(_taskModel.answers[i].identifier)) {
          _passedTasks.add(true);
        } else {
          _passedTasks.add(false);
        }
      }
    }

    if (_passedTasks.every((element) => element == true) &&
        _passedTasks.length == _taskModel.correctAnswers.length) {
      return true;
    } else {
      return false;
    }
  }

  void updateChoosenAnswer(int index) {
    emit(const MultiChoiceTaskState.loading());
    _chosenAnswer[index] = !_chosenAnswer[index];

    _isAnswerChosen = _chosenAnswer.contains(true);
    _emitIdle();
  }

  void _emitIdle() {
    emit(MultiChoiceTaskState.idle(
      answers: _answersList,
      chosenAnswer: _chosenAnswer,
      isAnswerChosen: _isAnswerChosen,
    ));
  }
}
