import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/conjugation/cubit/conjugation_search/conjugation_state.dart';

import 'package:french_conjugation_learn/presentation/use_case/get_conjugation_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConjugationCubit extends Cubit<ConjugationState> {
  final GetConjugationUseCase _getConjugationUseCase;

  ConjugationCubit(this._getConjugationUseCase)
      : super(const ConjugationState.idle());

  List<Verb> conjugations = [];

  Future<void> getConjugations(String searchParam) async {
    try {
      emit(const ConjugationState.loading());
      conjugations = await _getConjugationUseCase.call(searchParam);
      if (conjugations.isEmpty) {
        emit(const ConjugationState.empty());
      } else {
        _emitLoaded();
      }
    } catch (e, st) {
      logger.e('Error! Failed to get verb conjugations', e, st);
    }
  }

  void _emitLoaded() {
    emit(ConjugationState.loaded(conjugations: conjugations));
  }
}
