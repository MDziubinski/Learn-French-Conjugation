import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDailyTasksUseCase {
  final UserRepository _userRepository;

  UpdateDailyTasksUseCase(this._userRepository);

  Future<void> call() async {
    return await _userRepository.updateDialyTaskDate();
  }
}
