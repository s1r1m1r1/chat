/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'channel.dart' as _i2;
import 'environment_enum.dart' as _i3;
import 'user_option.dart' as _i4;
import 'package:chat_client/src/protocol/channel.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'package:serverpod_chat_client/serverpod_chat_client.dart' as _i7;
export 'channel.dart';
export 'environment_enum.dart';
export 'user_option.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Channel) {
      return _i2.Channel.fromJson(data) as T;
    }
    if (t == _i3.EnvironmentEnum) {
      return _i3.EnvironmentEnum.fromJson(data) as T;
    }
    if (t == _i4.UserOption) {
      return _i4.UserOption.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Channel?>()) {
      return (data != null ? _i2.Channel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.EnvironmentEnum?>()) {
      return (data != null ? _i3.EnvironmentEnum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UserOption?>()) {
      return (data != null ? _i4.UserOption.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Channel>) {
      return (data as List).map((e) => deserialize<_i5.Channel>(e)).toList()
          as T;
    }
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Channel) {
      return 'Channel';
    }
    if (data is _i3.EnvironmentEnum) {
      return 'EnvironmentEnum';
    }
    if (data is _i4.UserOption) {
      return 'UserOption';
    }
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_chat.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Channel') {
      return deserialize<_i2.Channel>(data['data']);
    }
    if (dataClassName == 'EnvironmentEnum') {
      return deserialize<_i3.EnvironmentEnum>(data['data']);
    }
    if (dataClassName == 'UserOption') {
      return deserialize<_i4.UserOption>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i6.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_chat.')) {
      data['className'] = dataClassName.substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
