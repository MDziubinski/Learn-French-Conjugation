import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/single_choice_task/cubit/single_choice_task_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SingleChoiceTaskCubit extends Cubit<SingleChoiceTaskState> {
  SingleChoiceTaskCubit() : super(const SingleChoiceTaskState.initial());

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

  void updateChoosenAnswer(int index) {
    emit(const SingleChoiceTaskState.loading());
    if (_chosenAnswer[index]) {
      _chosenAnswer[index] = !_chosenAnswer[index];
      _isAnswerChosen = false;
    } else {
      _chosenAnswer =
          List<bool>.generate(_answersList.length, (int index) => false);

      _chosenAnswer[index] = true;

      _isAnswerChosen = true;
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
    if (_passedTasks.every((element) => element == true)) {
      return true;
    } else {
      return false;
    }
  }

  void _emitIdle() {
    emit(SingleChoiceTaskState.idle(
      answers: _answersList,
      chosenAnswer: _chosenAnswer,
      isAnswerChosen: _isAnswerChosen,
    ));
  }
}
