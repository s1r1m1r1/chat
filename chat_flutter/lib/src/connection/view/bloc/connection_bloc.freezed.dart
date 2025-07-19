// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConnectionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectionEvent()';
  }
}

/// @nodoc

class _Subscribe extends ConnectionEvent {
  const _Subscribe() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Subscribe);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectionEvent.subscribe()';
  }
}

/// @nodoc

class _InternetStatusChanged extends ConnectionEvent {
  const _InternetStatusChanged(this.status) : super._();

  final InternetStatus status;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InternetStatusChanged &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'ConnectionEvent.internetStatusChanged(status: $status)';
  }
}

/// @nodoc

class _ServerStatusChanged extends ConnectionEvent {
  const _ServerStatusChanged(this.status) : super._();

  final ServerStatus status;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerStatusChanged &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'ConnectionEvent.serverStatusChanged(status: $status)';
  }
}

/// @nodoc

class _RetryConnection extends ConnectionEvent {
  const _RetryConnection() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RetryConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectionEvent.retryConnection()';
  }
}

/// @nodoc

class _Reconnect extends ConnectionEvent {
  const _Reconnect() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reconnect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConnectionEvent.reconnect()';
  }
}

/// @nodoc
mixin _$ConnectionState {
  InternetStatus get internetStatus;
  ServerStatus get serverStatus;
  bool get isReconnecting;
  int get reconnectAttempt;

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
                other.serverStatus == serverStatus) &&
            (identical(other.isReconnecting, isReconnecting) ||
                other.isReconnecting == isReconnecting) &&
            (identical(other.reconnectAttempt, reconnectAttempt) ||
                other.reconnectAttempt == reconnectAttempt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus,
      isReconnecting, reconnectAttempt);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, reconnectAttempt: $reconnectAttempt)';
  }
}

/// @nodoc
abstract mixin class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) _then) =
      _$ConnectionStateCopyWithImpl;
  @useResult
  $Res call(
      {InternetStatus internetStatus,
      ServerStatus serverStatus,
      bool isReconnecting,
      int reconnectAttempt});
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
    Object? isReconnecting = null,
    Object? reconnectAttempt = null,
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
      isReconnecting: null == isReconnecting
          ? _self.isReconnecting
          : isReconnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      reconnectAttempt: null == reconnectAttempt
          ? _self.reconnectAttempt
          : reconnectAttempt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ConnectionState extends ConnectionState {
  const _ConnectionState(
      {required this.internetStatus,
      required this.serverStatus,
      this.isReconnecting = false,
      this.reconnectAttempt = 0})
      : super._();

  @override
  final InternetStatus internetStatus;
  @override
  final ServerStatus serverStatus;
  @override
  @JsonKey()
  final bool isReconnecting;
  @override
  @JsonKey()
  final int reconnectAttempt;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectionStateCopyWith<_ConnectionState> get copyWith =>
      __$ConnectionStateCopyWithImpl<_ConnectionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConnectionState &&
            (identical(other.internetStatus, internetStatus) ||
                other.internetStatus == internetStatus) &&
            (identical(other.serverStatus, serverStatus) ||
                other.serverStatus == serverStatus) &&
            (identical(other.isReconnecting, isReconnecting) ||
                other.isReconnecting == isReconnecting) &&
            (identical(other.reconnectAttempt, reconnectAttempt) ||
                other.reconnectAttempt == reconnectAttempt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus,
      isReconnecting, reconnectAttempt);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, reconnectAttempt: $reconnectAttempt)';
  }
}

/// @nodoc
abstract mixin class _$ConnectionStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$ConnectionStateCopyWith(
          _ConnectionState value, $Res Function(_ConnectionState) _then) =
      __$ConnectionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {InternetStatus internetStatus,
      ServerStatus serverStatus,
      bool isReconnecting,
      int reconnectAttempt});
}

/// @nodoc
class __$ConnectionStateCopyWithImpl<$Res>
    implements _$ConnectionStateCopyWith<$Res> {
  __$ConnectionStateCopyWithImpl(this._self, this._then);

  final _ConnectionState _self;
  final $Res Function(_ConnectionState) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? internetStatus = null,
    Object? serverStatus = null,
    Object? isReconnecting = null,
    Object? reconnectAttempt = null,
  }) {
    return _then(_ConnectionState(
      internetStatus: null == internetStatus
          ? _self.internetStatus
          : internetStatus // ignore: cast_nullable_to_non_nullable
              as InternetStatus,
      serverStatus: null == serverStatus
          ? _self.serverStatus
          : serverStatus // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
      isReconnecting: null == isReconnecting
          ? _self.isReconnecting
          : isReconnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      reconnectAttempt: null == reconnectAttempt
          ? _self.reconnectAttempt
          : reconnectAttempt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
