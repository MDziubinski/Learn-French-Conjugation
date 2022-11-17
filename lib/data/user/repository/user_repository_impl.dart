import 'package:firebase_auth/firebase_auth.dart';

import 'package:french_conjugation_learn/data/google_services/authentication/auth_service.dart';
import 'package:french_conjugation_learn/data/user/mapper/user_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';
import 'package:french_conjugation_learn/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final AuthService _authService;
  final CustomUserDtoMapper _customUserDtoMapper;

  UserRepositoryImpl(
    this._authService,
    this._customUserDtoMapper,
  );

  @override
  Future<void> signIn() async {
    await _authService.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  User? getGoogleUserDetails() => _authService.getGoogleUser();

  @override
  Future<CustomUser> getCustomUser() async {
    final userDto = await _authService.getCustomUser();

    return _customUserDtoMapper.map(userDto);
  }

  @override
  Future<void> updateProgres(String progresKey) async {
    await _authService.updateProgres(progresKey);
  }

  @override
  Future<void> updateDialyTaskDate() async {
    await _authService.updateDate();
  }
}
