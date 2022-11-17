import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/presentation/home/cubit/main_page_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/get_sign_in_use_case.dart';
import 'package:french_conjugation_learn/presentation/use_case/get_sign_out_use_case.dart';
import 'package:french_conjugation_learn/presentation/use_case/user/get_current_user_details.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  final GetSignInUseCase _getSignInUseCase;
  final GetSignOutUseCase _getSignOutUseCase;
  final GetUserDetailsUseCase _getUserDetailsUseCase;

  MainPageCubit(
    this._getSignInUseCase,
    this._getSignOutUseCase,
    this._getUserDetailsUseCase,
  ) : super(const MainPageState.loading());

  User? _currentUser;

  bool isAvailable = false;

  Future<void> init() async {
    _currentUser = _getUserDetailsUseCase.call();

    if (_currentUser != null) {
      emit(const MainPageState.loggedIn());

      isAvailable = true;
    } else {
      emit(const MainPageState.loggedOut());
      isAvailable = false;
    }

    emit(MainPageState.idle(
      currentUser: _currentUser,
      isAvailable: isAvailable,
    ));
  }

  Future<void> singIn() async {
    try {
      await _getSignInUseCase.call();

      init();
    } catch (e, st) {
      if (kDebugMode) {
        print(e);
        print(st);
      }
    }
  }

  Future<void> singOut() async {
    try {
      await _getSignOutUseCase.call();
      init();
    } catch (e, st) {
      if (kDebugMode) {
        print(e);
        print(st);
      }
    }
  }
}
