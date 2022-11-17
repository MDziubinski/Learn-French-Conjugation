import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'conjugation_result_state.freezed.dart';

@freezed
class ConjugationResultState with _$ConjugationResultState {
  @Implements<BuildState>()
  const factory ConjugationResultState.loading() = _Loading;

  @Implements<BuildState>()
  const factory ConjugationResultState.idle({
    required Verb verb,
    required int index,
  }) = _Idle;

  @Implements<BuildState>()
  const factory ConjugationResultState.description({
    required String description,
    required List<String> engExamples,
    required List<String> frExamples,
    required int index,
  }) = _Description;

  @Implements<BuildState>()
  const factory ConjugationResultState.error() = _Error;
}
