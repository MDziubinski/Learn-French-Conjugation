import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_follow_verb_page_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/get_conjugation_use_case.dart';
import 'package:injectable/injectable.dart';

const _firstGroupFollowVerb = 'aimer';

@injectable
class FirstGroupFollowVerbPageCubit
    extends Cubit<FirstGroupFollowVerbPageState> {
  final GetConjugationUseCase _getConjugationUseCase;

  FirstGroupFollowVerbPageCubit(this._getConjugationUseCase)
      : super(const FirstGroupFollowVerbPageState.idle());

  List<Verb> _conjugations = [];
  late Verb _followVerb;

  Future<void> init() async {
    try {
      emit(const FirstGroupFollowVerbPageState.loading());
      _conjugations = await _getConjugationUseCase.call(_firstGroupFollowVerb);
      if (_conjugations.isEmpty) {
        emit(const FirstGroupFollowVerbPageState.idle());
      }
      _followVerb = _conjugations
          .firstWhere((verb) => verb.infinitif == _firstGroupFollowVerb);
      if (_followVerb.infinitif == _firstGroupFollowVerb) _emitLoaded();
    } catch (e, st) {
      logger.e('Error! Failed to get verb conjugations', e, st);
    }
  }

  void _emitLoaded() {
    emit(FirstGroupFollowVerbPageState.loaded(followVerb: _followVerb));
  }
}
