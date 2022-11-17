import 'package:french_conjugation_learn/domain/enums/task/task_type.dart';
import 'package:french_conjugation_learn/domain/task/model/answer_model.dart';

class TaskModel {
  final TaskType taskType;
  final String question;
  final List<AnswerModel> answers;
  final List<String> correctAnswers;

  TaskModel({
    required this.taskType,
    required this.question,
    required this.answers,
    required this.correctAnswers,
  });
}
