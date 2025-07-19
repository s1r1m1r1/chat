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

class _Subscribe implements ConnectionEvent {
  const _Subscribe();

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

class _InternetStatusChanged implements ConnectionEvent {
  const _InternetStatusChanged(this.status);

  final InternetStatus status;

  /// Create a copy of ConnectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InternetStatusChangedCopyWith<_InternetStatusChanged> get copyWith =>
      __$InternetStatusChangedCopyWithImpl<_InternetStatusChanged>(
          this, _$identity);

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
abstract mixin class _$InternetStatusChangedCopyWith<$Res> {
  factory _$InternetStatusChangedCopyWith(_InternetStatusChanged value,
          $Res Function(_InternetStatusChanged) _then) =
      __$InternetStatusChangedCopyWithImpl;
  @useResult
  $Res call({InternetStatus status});
}

/// @nodoc
class __$InternetStatusChangedCopyWithImpl<$Res>
    implements _$InternetStatusChangedCopyWith<$Res> {
  __$InternetStatusChangedCopyWithImpl(this._self, this._then);

  final _InternetStatusChanged _self;
  final $Res Function(_InternetStatusChanged) _then;

  /// Create a copy of ConnectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_InternetStatusChanged(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as InternetStatus,
    ));
  }
}

/// @nodoc

class _ServerStatusChanged implements ConnectionEvent {
  const _ServerStatusChanged(this.status);

  final ServerStatus status;

  /// Create a copy of ConnectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerStatusChangedCopyWith<_ServerStatusChanged> get copyWith =>
      __$ServerStatusChangedCopyWithImpl<_ServerStatusChanged>(
          this, _$identity);

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
abstract mixin class _$ServerStatusChangedCopyWith<$Res> {
  factory _$ServerStatusChangedCopyWith(_ServerStatusChanged value,
          $Res Function(_ServerStatusChanged) _then) =
      __$ServerStatusChangedCopyWithImpl;
  @useResult
  $Res call({ServerStatus status});
}

/// @nodoc
class __$ServerStatusChangedCopyWithImpl<$Res>
    implements _$ServerStatusChangedCopyWith<$Res> {
  __$ServerStatusChangedCopyWithImpl(this._self, this._then);

  final _ServerStatusChanged _self;
  final $Res Function(_ServerStatusChanged) _then;

  /// Create a copy of ConnectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_ServerStatusChanged(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
    ));
  }
}

/// @nodoc

class _RetryConnection implements ConnectionEvent {
  const _RetryConnection();

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

class _Reconnect implements ConnectionEvent {
  const _Reconnect();

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
  Duration? get nextRetryDelay;

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
            (identical(other.nextRetryDelay, nextRetryDelay) ||
                other.nextRetryDelay == nextRetryDelay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus,
      isReconnecting, nextRetryDelay);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, nextRetryDelay: $nextRetryDelay)';
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
      Duration? nextRetryDelay});
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
    Object? nextRetryDelay = freezed,
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
      nextRetryDelay: freezed == nextRetryDelay
          ? _self.nextRetryDelay
          : nextRetryDelay // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _ConnectionState extends ConnectionState {
  const _ConnectionState(
      {required this.internetStatus,
      required this.serverStatus,
      this.isReconnecting = false,
      this.nextRetryDelay})
      : super._();

  @override
  final InternetStatus internetStatus;
  @override
  final ServerStatus serverStatus;
  @override
  @JsonKey()
  final bool isReconnecting;
  @override
  final Duration? nextRetryDelay;

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
            (identical(other.nextRetryDelay, nextRetryDelay) ||
                other.nextRetryDelay == nextRetryDelay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, internetStatus, serverStatus,
      isReconnecting, nextRetryDelay);

  @override
  String toString() {
    return 'ConnectionState(internetStatus: $internetStatus, serverStatus: $serverStatus, isReconnecting: $isReconnecting, nextRetryDelay: $nextRetryDelay)';
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
      Duration? nextRetryDelay});
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
    Object? nextRetryDelay = freezed,
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
      nextRetryDelay: freezed == nextRetryDelay
          ? _self.nextRetryDelay
          : nextRetryDelay // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

// dart format on
