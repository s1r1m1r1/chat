// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_env_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerEnvState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerEnvState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServerEnvState()';
  }
}

/// @nodoc

class $ServerEnvStateInitial extends ServerEnvState {
  const $ServerEnvStateInitial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $ServerEnvStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServerEnvState.initial()';
  }
}

/// @nodoc

class $ServerEnvStateLoading extends ServerEnvState {
  const $ServerEnvStateLoading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $ServerEnvStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServerEnvState.loading()';
  }
}

/// @nodoc

class $ServerEnvStateSuccess extends ServerEnvState {
  const $ServerEnvStateSuccess(this.id) : super._();

  final int id;

  /// Create a copy of ServerEnvState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$ServerEnvStateSuccessCopyWith<$ServerEnvStateSuccess> get copyWith =>
      _$$ServerEnvStateSuccessCopyWithImpl<$ServerEnvStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $ServerEnvStateSuccess &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ServerEnvState.success(id: $id)';
  }
}

/// @nodoc
abstract mixin class $$ServerEnvStateSuccessCopyWith<$Res> {
  factory $$ServerEnvStateSuccessCopyWith($ServerEnvStateSuccess value,
          $Res Function($ServerEnvStateSuccess) _then) =
      _$$ServerEnvStateSuccessCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$$ServerEnvStateSuccessCopyWithImpl<$Res>
    implements $$ServerEnvStateSuccessCopyWith<$Res> {
  _$$ServerEnvStateSuccessCopyWithImpl(this._self, this._then);

  final $ServerEnvStateSuccess _self;
  final $Res Function($ServerEnvStateSuccess) _then;

  /// Create a copy of ServerEnvState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then($ServerEnvStateSuccess(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class $ServerEnvStateFailure extends ServerEnvState {
  const $ServerEnvStateFailure() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $ServerEnvStateFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServerEnvState.failure()';
  }
}

// dart format on
