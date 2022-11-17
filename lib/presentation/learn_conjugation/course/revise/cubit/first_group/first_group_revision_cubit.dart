import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/cubit/first_group/first_group_revision_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/revision/get_first_group_verbs_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupRevisionCubit extends Cubit<FirstGroupRevisionState> {
  final GetFirstGroupVerbsUseCase _firstGroupVerbsUseCase;
  FirstGroupRevisionCubit(this._firstGroupVerbsUseCase)
      : super(const FirstGroupRevisionState.initial());

  List<Verb> _conjugations = [];
  int _currentVerbIndex = 0;
  int _verbCount = 0;

  Future<void> init() async {
    try {
      emit(const FirstGroupRevisionState.loading());
      _conjugations = await _firstGroupVerbsUseCase.call();
      _conjugations.shuffle();
      _verbCount = _conjugations.length;
      _emitIdle();
    } catch (e, st) {
      logger.e('Error! Failed to get verb conjugations', e, st);
    }
  }

  void nextVerb() {
    if (_currentVerbIndex < _verbCount) {
      _currentVerbIndex++;
      _emitIdle();
    }
  }

  void _emitIdle() {
    emit(FirstGroupRevisionState.idle(
      currentVerbConjugation: _conjugations[_currentVerbIndex],
      index: _currentVerbIndex,
      verbCount: _verbCount,
    ));
  }
}
