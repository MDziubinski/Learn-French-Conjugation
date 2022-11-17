import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'first_group_revision_state.freezed.dart';

@freezed
class FirstGroupRevisionState with _$FirstGroupRevisionState {
  const factory FirstGroupRevisionState.initial() = _Initial;

  @Implements<BuildState>()
  const factory FirstGroupRevisionState.loading() = _Loading;

  @Implements<BuildState>()
  const factory FirstGroupRevisionState.idle({
    required Verb currentVerbConjugation,
    required int index,
    required int verbCount,
  }) = _Idle;

  @Implements<BuildState>()
  const factory FirstGroupRevisionState.error() = _Error;
}
