// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_chat_controller_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListChatControllerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListChatControllerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChatControllerState()';
  }
}

/// @nodoc

class $InitialListChatController extends ListChatControllerState {
  const $InitialListChatController() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $InitialListChatController);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChatControllerState.initial()';
  }
}

/// @nodoc

class $LoadingListChatController extends ListChatControllerState {
  const $LoadingListChatController() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $LoadingListChatController);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChatControllerState.loading()';
  }
}

/// @nodoc

class $LoadedListChatController extends ListChatControllerState {
  const $LoadedListChatController(final Map<String, ChatController> result)
      : _result = result,
        super._();

  final Map<String, ChatController> _result;
  Map<String, ChatController> get result {
    if (_result is EqualUnmodifiableMapView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_result);
  }

  /// Create a copy of ListChatControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$LoadedListChatControllerCopyWith<$LoadedListChatController> get copyWith =>
      _$$LoadedListChatControllerCopyWithImpl<$LoadedListChatController>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $LoadedListChatController &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @override
  String toString() {
    return 'ListChatControllerState.loaded(result: $result)';
  }
}

/// @nodoc
abstract mixin class $$LoadedListChatControllerCopyWith<$Res> {
  factory $$LoadedListChatControllerCopyWith($LoadedListChatController value,
          $Res Function($LoadedListChatController) _then) =
      _$$LoadedListChatControllerCopyWithImpl;
  @useResult
  $Res call({Map<String, ChatController> result});
}

/// @nodoc
class _$$LoadedListChatControllerCopyWithImpl<$Res>
    implements $$LoadedListChatControllerCopyWith<$Res> {
  _$$LoadedListChatControllerCopyWithImpl(this._self, this._then);

  final $LoadedListChatController _self;
  final $Res Function($LoadedListChatController) _then;

  /// Create a copy of ListChatControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then($LoadedListChatController(
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatController>,
    ));
  }
}

/// @nodoc

class $FailureListChatController extends ListChatControllerState {
  const $FailureListChatController() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $FailureListChatController);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListChatControllerState.failure()';
  }
}

// dart format on
