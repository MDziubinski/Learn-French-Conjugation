import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'first_group_follow_verb_page_state.freezed.dart';

@freezed
class FirstGroupFollowVerbPageState with _$FirstGroupFollowVerbPageState {
  @Implements<BuildState>()
  const factory FirstGroupFollowVerbPageState.loading() =
      _FirstGroupFollowVerbPageStateLoading;

  @Implements<BuildState>()
  const factory FirstGroupFollowVerbPageState.idle() =
      _FirstGroupFollowVerbPageStateIdle;

  @Implements<BuildState>()
  const factory FirstGroupFollowVerbPageState.loaded(
      {required Verb followVerb}) = _FirstGroupFollowVerbPageStateLoaded;
}
