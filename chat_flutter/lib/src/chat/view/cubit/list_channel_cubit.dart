import 'package:chat_client/chat_client.dart';
import 'package:chat_flutter/src/chat/domain/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'list_channel_cubit.freezed.dart';

@injectable
class ListChannelCubit extends Cubit<ListChannelState> {
  final ChatRepository _chatRepository;
  ListChannelCubit(this._chatRepository)
      : super(const ListChannelState.initial());

  Future<void> loadChannels() async {
    emit(ListChannelState.loading());
    try {
      final channels = await _chatRepository.getChannels();
      emit(ListChannelState.loaded(channels));
    } catch (error, stack) {
      addError(error, stack);
      emit(ListChannelState.failure());
    }
  }
}

@freezed
sealed class ListChannelState with _$ListChannelState {
  const ListChannelState._();
  const factory ListChannelState.initial() = $InitialListChannel;
  const factory ListChannelState.loading() = $LoadingListChannel;

  const factory ListChannelState.loaded(List<Channel> channel) =
      $LoadedListChannel;
  const factory ListChannelState.failure() = $FailureListChannel;
}
