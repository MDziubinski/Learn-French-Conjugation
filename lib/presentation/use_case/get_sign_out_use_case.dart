import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSignOutUseCase {
  final UserRepository _userRepository;

  GetSignOutUseCase(this._userRepository);

  Future<void> call() async {
    await _userRepository.signOut();
  }
}
