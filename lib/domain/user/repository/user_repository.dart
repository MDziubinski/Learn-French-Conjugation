import 'package:firebase_auth/firebase_auth.dart';
import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';

abstract class UserRepository {
  Future<void> signIn();

  Future<void> signOut();

  User? getGoogleUserDetails();

  Future<CustomUser> getCustomUser();

  Future<void> updateProgres(String progresKey);

  Future<void> updateDialyTaskDate();
}
