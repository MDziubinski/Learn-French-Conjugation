import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';
import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCustomUserDataUseCase {
  final UserRepository _userRepository;

  GetCustomUserDataUseCase(this._userRepository);

  Future<CustomUser> call() => _userRepository.getCustomUser();
}
