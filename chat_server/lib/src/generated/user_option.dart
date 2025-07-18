/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'environment_enum.dart' as _i2;

/// Represents a chat channel.
abstract class UserOption
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = UserOptionTable();

  static const db = UserOptionRepository._();

  @override
  int? id;

  int userId;

  /// The id of the env.
  _i2.EnvironmentEnum byIndexEnv;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'byIndexEnv': byIndexEnv.toJson(),
    };
  }

  static UserOptionInclude include() {
    return UserOptionInclude._();
  }

  static UserOptionIncludeList includeList({
    _i1.WhereExpressionBuilder<UserOptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserOptionTable>? orderByList,
    UserOptionInclude? include,
  }) {
    return UserOptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserOption.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserOption.t),
      include: include,
    );
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

class UserOptionTable extends _i1.Table<int?> {
  UserOptionTable({super.tableRelation}) : super(tableName: 'user_option') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    byIndexEnv = _i1.ColumnEnum(
      'byIndexEnv',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  /// The id of the env.
  late final _i1.ColumnEnum<_i2.EnvironmentEnum> byIndexEnv;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        byIndexEnv,
      ];
}

class UserOptionInclude extends _i1.IncludeObject {
  UserOptionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserOption.t;
}

class UserOptionIncludeList extends _i1.IncludeList {
  UserOptionIncludeList._({
    _i1.WhereExpressionBuilder<UserOptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserOption.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserOption.t;
}

class UserOptionRepository {
  const UserOptionRepository._();

  /// Returns a list of [UserOption]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<UserOption>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserOptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserOptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserOption>(
      where: where?.call(UserOption.t),
      orderBy: orderBy?.call(UserOption.t),
      orderByList: orderByList?.call(UserOption.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserOption] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<UserOption?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserOptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserOptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserOption>(
      where: where?.call(UserOption.t),
      orderBy: orderBy?.call(UserOption.t),
      orderByList: orderByList?.call(UserOption.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserOption] by its [id] or null if no such row exists.
  Future<UserOption?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserOption>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserOption]s in the list and returns the inserted rows.
  ///
  /// The returned [UserOption]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserOption>> insert(
    _i1.Session session,
    List<UserOption> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserOption>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserOption] and returns the inserted row.
  ///
  /// The returned [UserOption] will have its `id` field set.
  Future<UserOption> insertRow(
    _i1.Session session,
    UserOption row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserOption>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserOption]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserOption>> update(
    _i1.Session session,
    List<UserOption> rows, {
    _i1.ColumnSelections<UserOptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserOption>(
      rows,
      columns: columns?.call(UserOption.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserOption]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserOption> updateRow(
    _i1.Session session,
    UserOption row, {
    _i1.ColumnSelections<UserOptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserOption>(
      row,
      columns: columns?.call(UserOption.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserOption]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserOption>> delete(
    _i1.Session session,
    List<UserOption> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserOption>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserOption].
  Future<UserOption> deleteRow(
    _i1.Session session,
    UserOption row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserOption>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserOption>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserOptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserOption>(
      where: where(UserOption.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserOptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserOption>(
      where: where?.call(UserOption.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
