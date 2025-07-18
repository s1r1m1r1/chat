import 'package:chat_flutter/src/chat/domain/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';
part 'list_chat_controller_cubit.freezed.dart';

@injectable
class ListChatControllerCubit extends Cubit<ListChatControllerState> {
  final ChatRepository _chatRepository;
  ListChatControllerCubit(this._chatRepository)
      : super(ListChatControllerState.initial());

  Future<void> load() async {
    emit(ListChatControllerState.loading());
    try {
      final result = await _chatRepository.getControllers();
      emit(ListChatControllerState.loaded(result));
    } catch (e) {
      addError(e);
      emit(ListChatControllerState.failure());
    }
  }
}

@freezed
sealed class ListChatControllerState with _$ListChatControllerState {
  const ListChatControllerState._();

  const factory ListChatControllerState.initial() = $InitialListChatController;
  const factory ListChatControllerState.loading() = $LoadingListChatController;
  const factory ListChatControllerState.loaded(List<ChatController> result) =
      $LoadedListChatController;
  const factory ListChatControllerState.failure() = $FailureListChatController;
}
