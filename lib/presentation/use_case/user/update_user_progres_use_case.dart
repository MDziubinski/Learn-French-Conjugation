import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserProgresUseCase {
  final UserRepository _userRepository;

  UpdateUserProgresUseCase(this._userRepository);

  Future<void> call(String progresKey) =>
      _userRepository.updateProgres(progresKey);
}
