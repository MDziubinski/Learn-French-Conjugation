import 'package:firebase_auth/firebase_auth.dart';
import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDetailsUseCase {
  final UserRepository _userRepository;

  GetUserDetailsUseCase(this._userRepository);

  User? call() => _userRepository.getGoogleUserDetails();
}
