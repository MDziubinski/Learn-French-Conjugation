import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:french_conjugation_learn/data/user/dto/custom_user_dto.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

const Map<String, bool> _progres = {
  "firstGroupIntro": false,
  "firstGroupMainRules": false,
  "firstGroupInflectionalEndings": false,
  "firstGroupFollowVerb": false,
  "firstGroupTest": false,
};

@injectable
class AuthService {
  late GoogleSignInAccount? googleUser;
  late CustomUserDto userDto;

  Future<void> signInWithGoogle() async {
    googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
    final userRF = FirebaseFirestore.instance.collection('users');

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    final currentUser = FirebaseAuth.instance.currentUser;
    await userRF.doc(currentUser?.uid).get().then((doc) {
      final tempMap = doc.data();
      if (tempMap == null) {
        _saveUser();
      }
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User? getGoogleUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void _saveUser() {
    final userRF = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;

    userRF.doc(currentUser?.uid).set({
      'email': currentUser?.email,
      'name': currentUser?.displayName,
      'profilePic': currentUser?.photoURL,
      'progres': _progres,
      'dailyTaskDate': '',
    });
  }

  Future<CustomUserDto> getCustomUser() async {
    final userRF = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;

    await userRF.doc(currentUser?.uid).get().then((doc) {
      final tempMap = doc.data();
      if (tempMap != null) {
        userDto = CustomUserDto.fromJson(tempMap);
      }
    });

    return userDto;
  }

  Future<void> updateProgres(String progresKey) async {
    final userRF = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;
    late CustomUserDto userDto;

    await userRF.doc(currentUser?.uid).get().then((doc) async {
      final tempMap = doc.data();
      if (tempMap != null) {
        userDto = CustomUserDto.fromJson(tempMap);
        userDto.progres[progresKey] = true;
        await userRF.doc(currentUser?.uid).update({'progres': userDto.progres});
      }
    });
  }

  Future<void> updateDate() async {
    final userRF = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;

    final currentTime = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(currentTime);

    await userRF.doc(currentUser?.uid).update({'dailyTaskDate': formattedDate});
  }
}
