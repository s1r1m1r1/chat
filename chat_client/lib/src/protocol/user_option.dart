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
import 'environment_enum.dart' as _i2;

/// Represents a chat channel.
abstract class UserOption implements _i1.SerializableModel {
  UserOption._({
    this.id,
    required this.userId,
    _i2.EnvironmentEnum? byIndexEnv,
  }) : byIndexEnv = byIndexEnv ?? _i2.EnvironmentEnum.dev;

  factory UserOption({
    int? id,
    required int userId,
    _i2.EnvironmentEnum? byIndexEnv,
  }) = _UserOptionImpl;

  factory UserOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserOption(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      byIndexEnv: _i2.EnvironmentEnum.fromJson(
          (jsonSerialization['byIndexEnv'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  /// The id of the env.
  _i2.EnvironmentEnum byIndexEnv;

  /// Returns a shallow copy of this [UserOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserOption copyWith({
    int? id,
    int? userId,
    _i2.EnvironmentEnum? byIndexEnv,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'byIndexEnv': byIndexEnv.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserOptionImpl extends UserOption {
  _UserOptionImpl({
    int? id,
    required int userId,
    _i2.EnvironmentEnum? byIndexEnv,
  }) : super._(
          id: id,
          userId: userId,
          byIndexEnv: byIndexEnv,
        );

  /// Returns a shallow copy of this [UserOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserOption copyWith({
    Object? id = _Undefined,
    int? userId,
    _i2.EnvironmentEnum? byIndexEnv,
  }) {
    return UserOption(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      byIndexEnv: byIndexEnv ?? this.byIndexEnv,
    );
  }
}
