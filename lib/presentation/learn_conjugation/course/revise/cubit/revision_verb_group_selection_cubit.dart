import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/cubit/revision_verb_group_selection_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/user/get_custom_user_data_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class RevisionVerbGroupSelectionCubit
    extends Cubit<RevisionVerbGroupSelectionState> {
  final GetCustomUserDataUseCase getCustomUserDataUseCase;
  late CustomUser _customUser;

  RevisionVerbGroupSelectionCubit(this.getCustomUserDataUseCase)
      : super(const RevisionVerbGroupSelectionState.initial());

  Future<void> init() async {
    try {
      emit(const RevisionVerbGroupSelectionState.loading());
      _customUser = await getCustomUserDataUseCase.call();
      _emitLoaded();
    } catch (e, st) {
      logger.e('Error! Failed to get custom user data', e, st);
    }
  }

  void _emitLoaded() {
    emit(RevisionVerbGroupSelectionState.idle(
      progres: _customUser.progres,
    ));
  }
}
