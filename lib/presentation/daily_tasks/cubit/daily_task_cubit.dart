import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/cubit/daily_task_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/user/get_custom_user_data_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DailyTaskCubit extends Cubit<DailyTaskState> {
  final GetCustomUserDataUseCase _getCustomUserDataUseCase;
  DailyTaskCubit(this._getCustomUserDataUseCase)
      : super(const DailyTaskState.initial());

  Future<void> init() async {
    try {
      emit(const DailyTaskState.loading());
      final customUserContent = await _getCustomUserDataUseCase.call();
      final currentTime = DateTime.now();
      final formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(currentTime);

      if (customUserContent.dailyTaskDate.isEmpty ||
          customUserContent.dailyTaskDate != formattedDate) {
        emit(const DailyTaskState.notDone());
      } else {
        emit(const DailyTaskState.done());
      }
    } catch (e, st) {
      emit(const DailyTaskState.error());
      logger.e('Error! Failed to get user data.', e, st);
    }
  }
}
