// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conjugation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConjugationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Verb> conjugations) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConjugationStateLoading value) loading,
    required TResult Function(_ConjugationStateIdle value) idle,
    required TResult Function(_ConjugationStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConjugationStateCopyWith<$Res> {
  factory $ConjugationStateCopyWith(
          ConjugationState value, $Res Function(ConjugationState) then) =
      _$ConjugationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConjugationStateCopyWithImpl<$Res>
    implements $ConjugationStateCopyWith<$Res> {
  _$ConjugationStateCopyWithImpl(this._value, this._then);

  final ConjugationState _value;
  // ignore: unused_field
  final $Res Function(ConjugationState) _then;
}

/// @nodoc
abstract class _$$_ConjugationStateLoadingCopyWith<$Res> {
  factory _$$_ConjugationStateLoadingCopyWith(_$_ConjugationStateLoading value,
          $Res Function(_$_ConjugationStateLoading) then) =
      __$$_ConjugationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConjugationStateLoadingCopyWithImpl<$Res>
    extends _$ConjugationStateCopyWithImpl<$Res>
    implements _$$_ConjugationStateLoadingCopyWith<$Res> {
  __$$_ConjugationStateLoadingCopyWithImpl(_$_ConjugationStateLoading _value,
      $Res Function(_$_ConjugationStateLoading) _then)
      : super(_value, (v) => _then(v as _$_ConjugationStateLoading));

  @override
  _$_ConjugationStateLoading get _value =>
      super._value as _$_ConjugationStateLoading;
}

/// @nodoc

class _$_ConjugationStateLoading implements _ConjugationStateLoading {
  const _$_ConjugationStateLoading();

  @override
  String toString() {
    return 'ConjugationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConjugationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Verb> conjugations) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConjugationStateLoading value) loading,
    required TResult Function(_ConjugationStateIdle value) idle,
    required TResult Function(_ConjugationStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ConjugationStateLoading
    implements ConjugationState, BuildState {
  const factory _ConjugationStateLoading() = _$_ConjugationStateLoading;
}

/// @nodoc
abstract class _$$_ConjugationStateIdleCopyWith<$Res> {
  factory _$$_ConjugationStateIdleCopyWith(_$_ConjugationStateIdle value,
          $Res Function(_$_ConjugationStateIdle) then) =
      __$$_ConjugationStateIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConjugationStateIdleCopyWithImpl<$Res>
    extends _$ConjugationStateCopyWithImpl<$Res>
    implements _$$_ConjugationStateIdleCopyWith<$Res> {
  __$$_ConjugationStateIdleCopyWithImpl(_$_ConjugationStateIdle _value,
      $Res Function(_$_ConjugationStateIdle) _then)
      : super(_value, (v) => _then(v as _$_ConjugationStateIdle));

  @override
  _$_ConjugationStateIdle get _value => super._value as _$_ConjugationStateIdle;
}

/// @nodoc

class _$_ConjugationStateIdle implements _ConjugationStateIdle {
  const _$_ConjugationStateIdle();

  @override
  String toString() {
    return 'ConjugationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConjugationStateIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Verb> conjugations) loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConjugationStateLoading value) loading,
    required TResult Function(_ConjugationStateIdle value) idle,
    required TResult Function(_ConjugationStateLoaded value) loaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _ConjugationStateIdle implements ConjugationState, BuildState {
  const factory _ConjugationStateIdle() = _$_ConjugationStateIdle;
}

/// @nodoc
abstract class _$$_ConjugationStateLoadedCopyWith<$Res> {
  factory _$$_ConjugationStateLoadedCopyWith(_$_ConjugationStateLoaded value,
          $Res Function(_$_ConjugationStateLoaded) then) =
      __$$_ConjugationStateLoadedCopyWithImpl<$Res>;
  $Res call({List<Verb> conjugations});
}

/// @nodoc
class __$$_ConjugationStateLoadedCopyWithImpl<$Res>
    extends _$ConjugationStateCopyWithImpl<$Res>
    implements _$$_ConjugationStateLoadedCopyWith<$Res> {
  __$$_ConjugationStateLoadedCopyWithImpl(_$_ConjugationStateLoaded _value,
      $Res Function(_$_ConjugationStateLoaded) _then)
      : super(_value, (v) => _then(v as _$_ConjugationStateLoaded));

  @override
  _$_ConjugationStateLoaded get _value =>
      super._value as _$_ConjugationStateLoaded;

  @override
  $Res call({
    Object? conjugations = freezed,
  }) {
    return _then(_$_ConjugationStateLoaded(
      conjugations: conjugations == freezed
          ? _value._conjugations
          : conjugations // ignore: cast_nullable_to_non_nullable
              as List<Verb>,
    ));
  }
}

/// @nodoc

class _$_ConjugationStateLoaded implements _ConjugationStateLoaded {
  const _$_ConjugationStateLoaded({required final List<Verb> conjugations})
      : _conjugations = conjugations;

  final List<Verb> _conjugations;
  @override
  List<Verb> get conjugations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conjugations);
  }

  @override
  String toString() {
    return 'ConjugationState.loaded(conjugations: $conjugations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConjugationStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._conjugations, _conjugations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conjugations));

  @JsonKey(ignore: true)
  @override
  _$$_ConjugationStateLoadedCopyWith<_$_ConjugationStateLoaded> get copyWith =>
      __$$_ConjugationStateLoadedCopyWithImpl<_$_ConjugationStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Verb> conjugations) loaded,
  }) {
    return loaded(conjugations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
  }) {
    return loaded?.call(conjugations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Verb> conjugations)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(conjugations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConjugationStateLoading value) loading,
    required TResult Function(_ConjugationStateIdle value) idle,
    required TResult Function(_ConjugationStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConjugationStateLoading value)? loading,
    TResult Function(_ConjugationStateIdle value)? idle,
    TResult Function(_ConjugationStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ConjugationStateLoaded implements ConjugationState, BuildState {
  const factory _ConjugationStateLoaded(
      {required final List<Verb> conjugations}) = _$_ConjugationStateLoaded;

  List<Verb> get conjugations;
  @JsonKey(ignore: true)
  _$$_ConjugationStateLoadedCopyWith<_$_ConjugationStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
