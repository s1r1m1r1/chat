// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_channel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListChannelState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListChannelState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChannelState()';
  }
}

/// @nodoc

class $InitialListChannel extends ListChannelState {
  const $InitialListChannel() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $InitialListChannel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChannelState.initial()';
  }
}

/// @nodoc

class $LoadingListChannel extends ListChannelState {
  const $LoadingListChannel() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $LoadingListChannel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChannelState.loading()';
  }
}

/// @nodoc

class $LoadedListChannel extends ListChannelState {
  const $LoadedListChannel(final List<Channel> channel)
      : _channel = channel,
        super._();

  final List<Channel> _channel;
  List<Channel> get channel {
    if (_channel is EqualUnmodifiableListView) return _channel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channel);
  }

  /// Create a copy of ListChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$LoadedListChannelCopyWith<$LoadedListChannel> get copyWith =>
      _$$LoadedListChannelCopyWithImpl<$LoadedListChannel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $LoadedListChannel &&
            const DeepCollectionEquality().equals(other._channel, _channel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channel));

  @override
  String toString() {
    return 'ListChannelState.loaded(channel: $channel)';
  }
}

/// @nodoc
abstract mixin class $$LoadedListChannelCopyWith<$Res> {
  factory $$LoadedListChannelCopyWith(
          $LoadedListChannel value, $Res Function($LoadedListChannel) _then) =
      _$$LoadedListChannelCopyWithImpl;
  @useResult
  $Res call({List<Channel> channel});
}

/// @nodoc
class _$$LoadedListChannelCopyWithImpl<$Res>
    implements $$LoadedListChannelCopyWith<$Res> {
  _$$LoadedListChannelCopyWithImpl(this._self, this._then);

  final $LoadedListChannel _self;
  final $Res Function($LoadedListChannel) _then;

  /// Create a copy of ListChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channel = null,
  }) {
    return _then($LoadedListChannel(
      null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
    ));
  }
}

/// @nodoc

class $FailureListChannel extends ListChannelState {
  const $FailureListChannel() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is $FailureListChannel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChannelState.failure()';
  }
}

// dart format on
