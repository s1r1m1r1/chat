// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_bloc.freezed.dart';

// @Freezed(
//     map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: true)
// sealed class UserEvent with _$UserEvent {
//   const UserEvent._();

//   const factory UserEvent.create() = _CreateUserEvent;

//   const factory UserEvent.read() = _ReadUserEvent;

//   const factory UserEvent.update() = _UpdateUserEvent;

//   const factory UserEvent.delete() = _DeleteUserEvent;
// }

// @Freezed(
//     map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: true)
// sealed class UserState with _$UserState {
//   const UserState._();

//   const factory UserState.initial() = $InitialUserState;

//   const factory UserState.processing() = $ProcessingUserState;

//   const factory UserState.loaded(List<dynamic> result) = $LoadedUserState;

//   const factory UserState.failure() = $FailureUserState;
// }

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(const $InitialUserState()) {
//     on<UserEvent>(
//       (event, emitter) async {
//         switch (event) {
//           case _CreateUserEvent():
//             await _create(event, emitter);
//           case _ReadUserEvent():
//             await _read(event, emitter);
//           case _UpdateUserEvent():
//             await _update(event, emitter);
//           case _DeleteUserEvent():
//             await _delete(event, emitter);
//         }
//       },
//       transformer: sequential(),
//     );
//   }

//   Future<void> _create(
//       _CreateUserEvent event, Emitter<UserState> emitter) async {
//     // ...
//   }

//   Future<void> _read(_ReadUserEvent event, Emitter<UserState> emitter) async {
//     // ...
//   }

//   Future<void> _update(
//       _UpdateUserEvent event, Emitter<UserState> emitter) async {
//     // ...
//   }

//   Future<void> _delete(
//       _DeleteUserEvent event, Emitter<UserState> emitter) async {
//     // ...
//   }
// }
