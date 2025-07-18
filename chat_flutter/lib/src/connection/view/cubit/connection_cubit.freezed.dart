// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionState {
  InternetStatus get internetStatus;
  ServerStatus get serverStatus;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      _$ConnectionStateCopyWithImpl<ConnectionState>(
          this as ConnectionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectionState &&
            (identical(other.internetStatus, internetStatus) ||
                other.internetStatus == internetStatus) &&
            (identical(other.serverStatus, serverStatus) ||
                other.serverStatus == serverStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus)';
  }
}

/// @nodoc
abstract mixin class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) _then) =
      _$ConnectionStateCopyWithImpl;
  @useResult
  $Res call({InternetStatus internetStatus, ServerStatus serverStatus});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._self, this._then);

  final ConnectionState _self;
  final $Res Function(ConnectionState) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internetStatus = null,
    Object? serverStatus = null,
  }) {
    return _then(_self.copyWith(
      internetStatus: null == internetStatus
          ? _self.internetStatus
          : internetStatus // ignore: cast_nullable_to_non_nullable
              as InternetStatus,
      serverStatus: null == serverStatus
          ? _self.serverStatus
          : serverStatus // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
    ));
  }
}

/// @nodoc

class $ConnectingState extends ConnectionState {
  const $ConnectingState(this.internetStatus, this.serverStatus) : super._();

  @override
  final InternetStatus internetStatus;
  @override
  final ServerStatus serverStatus;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$ConnectingStateCopyWith<$ConnectingState> get copyWith =>
      _$$ConnectingStateCopyWithImpl<$ConnectingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $ConnectingState &&
            (identical(other.internetStatus, internetStatus) ||
                other.internetStatus == internetStatus) &&
            (identical(other.serverStatus, serverStatus) ||
                other.serverStatus == serverStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus)';
  }
}

/// @nodoc
abstract mixin class $$ConnectingStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory $$ConnectingStateCopyWith(
          $ConnectingState value, $Res Function($ConnectingState) _then) =
      _$$ConnectingStateCopyWithImpl;
  @override
  @useResult
  $Res call({InternetStatus internetStatus, ServerStatus serverStatus});
}

/// @nodoc
class _$$ConnectingStateCopyWithImpl<$Res>
    implements $$ConnectingStateCopyWith<$Res> {
  _$$ConnectingStateCopyWithImpl(this._self, this._then);

  final $ConnectingState _self;
  final $Res Function($ConnectingState) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? internetStatus = null,
    Object? serverStatus = null,
  }) {
    return _then($ConnectingState(
      null == internetStatus
          ? _self.internetStatus
          : internetStatus // ignore: cast_nullable_to_non_nullable
              as InternetStatus,
      null == serverStatus
          ? _self.serverStatus
          : serverStatus // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
    ));
  }
}

// dart format on
