import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'conjugation_state.freezed.dart';

@freezed
class ConjugationState with _$ConjugationState {
  @Implements<BuildState>()
  const factory ConjugationState.loading() = _ConjugationStateLoading;

  @Implements<BuildState>()
  const factory ConjugationState.idle() = _ConjugationStateIdle;

  @Implements<BuildState>()
  const factory ConjugationState.loaded({required List<Verb> conjugations}) =
      _ConjugationStateLoaded;
}
