import 'package:french_conjugation_learn/domain/course/repository/first_group_repository.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFirstGroupTaskTestUseCase {
  final FirstGroupRepository _firstGroupRepository;

  GetFirstGroupTaskTestUseCase(this._firstGroupRepository);

  Future<List<TaskModel>> call() async {
    return await _firstGroupRepository.getTestTasks();
  }
}
