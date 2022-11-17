import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/presentation/conjugation/cubit/conjugation_result/conjugation_result_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConjugationResultCubit extends Cubit<ConjugationResultState> {
  ConjugationResultCubit() : super(const ConjugationResultState.loading());
  late Verb _currentVerb;
  String _description = '';
  List<String> _engExamples = [];
  List<String> _frExamples = [];

  Future<void> init(Verb verb) async {
    _currentVerb = verb;
    _description = verb.description;
    _engExamples = verb.translationExamplesEng;
    _frExamples = verb.translationExamplesF;

    emit(ConjugationResultState.idle(
      verb: _currentVerb,
      index: 0,
    ));
  }

  void changeContent(int index) {
    if (index == 0) {
      emit(ConjugationResultState.idle(
        verb: _currentVerb,
        index: index,
      ));
    } else if (index == 1) {
      emit(ConjugationResultState.description(
        description: _description,
        engExamples: _engExamples,
        frExamples: _frExamples,
        index: index,
      ));
    } else {
      emit(const ConjugationResultState.error());
    }
  }
}
