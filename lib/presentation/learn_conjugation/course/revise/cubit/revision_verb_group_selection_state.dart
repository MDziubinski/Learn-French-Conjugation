import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

part 'revision_verb_group_selection_state.freezed.dart';

@freezed
class RevisionVerbGroupSelectionState with _$RevisionVerbGroupSelectionState {
  const factory RevisionVerbGroupSelectionState.initial() = _Initial;
  @Implements<BuildState>()
  const factory RevisionVerbGroupSelectionState.loading() = _Loading;
  @Implements<BuildState>()
  const factory RevisionVerbGroupSelectionState.idle(
      {required Map<String, bool> progres}) = _Idle;
  @Implements<BuildState>()
  const factory RevisionVerbGroupSelectionState.error() = _Error;
}
