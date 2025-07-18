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
import 'dart:async' as _i2;
import 'package:chat_client/src/protocol/channel.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'package:serverpod_chat_client/serverpod_chat_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<_i3.Channel> createChannel({
    required String name,
    required String channel,
  }) =>
      caller.callServerEndpoint<_i3.Channel>(
        'admin',
        'createChannel',
        {
          'name': name,
          'channel': channel,
        },
      );

  _i2.Future<_i3.Channel> deleteChannel(int channelId) =>
      caller.callServerEndpoint<_i3.Channel>(
        'admin',
        'deleteChannel',
        {'channelId': channelId},
      );
}

/// {@category Endpoint}
class EndpointChannels extends _i1.EndpointRef {
  EndpointChannels(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'channels';

  _i2.Future<List<_i3.Channel>> getAllChannels() =>
      caller.callServerEndpoint<List<_i3.Channel>>(
        'channels',
        'getAllChannels',
        {},
      );

  _i2.Future<List<_i3.Channel>> getChannels({required int environmentId}) =>
      caller.callServerEndpoint<List<_i3.Channel>>(
        'channels',
        'getChannels',
        {'environmentId': environmentId},
      );

  _i2.Future<_i3.Channel> createChannel({
    required String name,
    required String channel,
    required int environmentId,
  }) =>
      caller.callServerEndpoint<_i3.Channel>(
        'channels',
        'createChannel',
        {
          'name': name,
          'channel': channel,
          'environmentId': environmentId,
        },
      );
}

/// {@category Endpoint}
class EndpointEnv extends _i1.EndpointRef {
  EndpointEnv(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'env';

  /// return id
  _i2.Future<int> getId() => caller.callServerEndpoint<int>(
        'env',
        'getId',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i4.Caller(client);
    chat = _i5.Caller(client);
  }

  late final _i4.Caller auth;

  late final _i5.Caller chat;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    channels = EndpointChannels(this);
    env = EndpointEnv(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointChannels channels;

  late final EndpointEnv env;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'channels': channels,
        'env': env,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
        'chat': modules.chat,
      };
}
