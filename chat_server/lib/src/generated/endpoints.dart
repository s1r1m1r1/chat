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
import '../endpoints/admin.dart' as _i2;
import '../endpoints/channels.dart' as _i3;
import '../endpoints/env.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;
import 'package:serverpod_chat_server/serverpod_chat_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'channels': _i3.ChannelsEndpoint()
        ..initialize(
          server,
          'channels',
          null,
        ),
      'env': _i4.EnvEndpoint()
        ..initialize(
          server,
          'env',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createChannel': _i1.MethodConnector(
          name: 'createChannel',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).createChannel(
            session,
            name: params['name'],
            channel: params['channel'],
          ),
        ),
        'deleteChannel': _i1.MethodConnector(
          name: 'deleteChannel',
          params: {
            'channelId': _i1.ParameterDescription(
              name: 'channelId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).deleteChannel(
            session,
            params['channelId'],
          ),
        ),
      },
    );
    connectors['channels'] = _i1.EndpointConnector(
      name: 'channels',
      endpoint: endpoints['channels']!,
      methodConnectors: {
        'getAllChannels': _i1.MethodConnector(
          name: 'getAllChannels',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['channels'] as _i3.ChannelsEndpoint)
                  .getAllChannels(session),
        ),
        'getChannels': _i1.MethodConnector(
          name: 'getChannels',
          params: {
            'environmentId': _i1.ParameterDescription(
              name: 'environmentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['channels'] as _i3.ChannelsEndpoint).getChannels(
            session,
            environmentId: params['environmentId'],
          ),
        ),
        'createChannel': _i1.MethodConnector(
          name: 'createChannel',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'environmentId': _i1.ParameterDescription(
              name: 'environmentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['channels'] as _i3.ChannelsEndpoint).createChannel(
            session,
            name: params['name'],
            channel: params['channel'],
            environmentId: params['environmentId'],
          ),
        ),
      },
    );
    connectors['env'] = _i1.EndpointConnector(
      name: 'env',
      endpoint: endpoints['env']!,
      methodConnectors: {
        'getId': _i1.MethodConnector(
          name: 'getId',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['env'] as _i4.EnvEndpoint).getId(session),
        )
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
    modules['serverpod_chat'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
