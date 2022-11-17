import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'main_page_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  @Implements<BuildState>()
  const factory MainPageState.loading() = _Loading;

  @Implements<BuildState>()
  const factory MainPageState.idle({
    required User? currentUser,
    required bool isAvailable,
  }) = _Idle;

  @Implements<BuildState>()
  const factory MainPageState.loggedIn() = _LoggedIn;

  @Implements<BuildState>()
  const factory MainPageState.loggedOut() = _LoggedOut;
}
