// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsConnectionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WsConnectionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WsConnectionEvent()';
  }
}

/// @nodoc

class _Subscribe extends WsConnectionEvent {
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
    return 'WsConnectionEvent.subscribe()';
  }
}

/// @nodoc

class _InternetStatusChanged extends WsConnectionEvent {
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
    return 'WsConnectionEvent.internetStatusChanged(status: $status)';
  }
}

/// @nodoc

class _ServerStatusChanged extends WsConnectionEvent {
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
    return 'WsConnectionEvent.serverStatusChanged(status: $status)';
  }
}

/// @nodoc

class _RetryConnection extends WsConnectionEvent {
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
    return 'WsConnectionEvent.retryConnection()';
  }
}

/// @nodoc

class _Reconnect extends WsConnectionEvent {
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
    return 'WsConnectionEvent.reconnect()';
  }
}

/// @nodoc
mixin _$WsConnectionState {
  InternetStatus get internetStatus;
  ServerStatus get serverStatus;
  bool get isReconnecting;
  int get reconnectAttempt;

  /// Create a copy of WsConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WsConnectionStateCopyWith<WsConnectionState> get copyWith =>
      _$WsConnectionStateCopyWithImpl<WsConnectionState>(
          this as WsConnectionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WsConnectionState &&
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
    return 'WsConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, reconnectAttempt: $reconnectAttempt)';
  }
}

/// @nodoc
abstract mixin class $WsConnectionStateCopyWith<$Res> {
  factory $WsConnectionStateCopyWith(
          WsConnectionState value, $Res Function(WsConnectionState) _then) =
      _$WsConnectionStateCopyWithImpl;
  @useResult
  $Res call(
      {InternetStatus internetStatus,
      ServerStatus serverStatus,
      bool isReconnecting,
      int reconnectAttempt});
}

/// @nodoc
class _$WsConnectionStateCopyWithImpl<$Res>
    implements $WsConnectionStateCopyWith<$Res> {
  _$WsConnectionStateCopyWithImpl(this._self, this._then);

  final WsConnectionState _self;
  final $Res Function(WsConnectionState) _then;

  /// Create a copy of WsConnectionState
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

class _WsConnectionState extends WsConnectionState {
  const _WsConnectionState(
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

  /// Create a copy of WsConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WsConnectionStateCopyWith<_WsConnectionState> get copyWith =>
      __$WsConnectionStateCopyWithImpl<_WsConnectionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WsConnectionState &&
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
    return 'WsConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, reconnectAttempt: $reconnectAttempt)';
  }
}

/// @nodoc
abstract mixin class _$WsConnectionStateCopyWith<$Res>
    implements $WsConnectionStateCopyWith<$Res> {
  factory _$WsConnectionStateCopyWith(
          _WsConnectionState value, $Res Function(_WsConnectionState) _then) =
      __$WsConnectionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {InternetStatus internetStatus,
      ServerStatus serverStatus,
      bool isReconnecting,
      int reconnectAttempt});
}

/// @nodoc
class __$WsConnectionStateCopyWithImpl<$Res>
    implements _$WsConnectionStateCopyWith<$Res> {
  __$WsConnectionStateCopyWithImpl(this._self, this._then);

  final _WsConnectionState _self;
  final $Res Function(_WsConnectionState) _then;

  /// Create a copy of WsConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? internetStatus = null,
    Object? serverStatus = null,
    Object? isReconnecting = null,
    Object? reconnectAttempt = null,
  }) {
    return _then(_WsConnectionState(
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
