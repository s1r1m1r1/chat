import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

import '../../../main.dart';

abstract class ConnectionRepository {
  Stream<InternetStatus> get internetStatus;
  Stream<ServerStatus> get serverStatus;
  void init();
  Future<void> dispose();

  Future<void> retryConnection();
}

@LazySingleton(as: ConnectionRepository)
class ConnectionRepositoryImpl extends ConnectionRepository {
  ConnectionRepositoryImpl() {
    init();
  }
  final _connectivity = Connectivity();
  final _serverStatusSbj =
      BehaviorSubject<ServerStatus>.seeded(ServerStatus.disconnected);

  @override
  void init() {
    client.addStreamingConnectionStatusListener(_changedConnectionStatus);
    _connect();
  }

  void _changedConnectionStatus() {
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.disconnected) {
      _serverStatusSbj.add(ServerStatus.disconnected);
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.connected) {
      _serverStatusSbj.add(ServerStatus.connected);
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.connecting) {
      _serverStatusSbj.add(ServerStatus.connecting);
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.waitingToRetry) {
      _serverStatusSbj.add(ServerStatus.waitingToRetry);
    }
  }

  Future<void> _connect() async {
    _serverStatusSbj.add(ServerStatus.connecting);
    try {
      // 5 seconds timeous
      // Make sure that the web socket is connected.
      await client.openStreamingConnection();
    } catch (e) {
      _serverStatusSbj.add(ServerStatus.failed);
      debugPrint(e.toString());
    }
  }

  @override
  Stream<InternetStatus> get internetStatus =>
      _connectivity.onConnectivityChanged.map((connectivity) {
        if (connectivity.contains(ConnectivityResult.mobile) ||
            connectivity.contains(ConnectivityResult.wifi) ||
            connectivity.contains(ConnectivityResult.ethernet)) {
          return InternetStatus.available;
        }
        return InternetStatus.noInternet;
      });

  @override
  @disposeMethod
  Future<void> dispose() async {
    _serverStatusSbj.close();
    await client.closeStreamingConnection();
    client.removeStreamingConnectionStatusListener(_changedConnectionStatus);
  }

  @override
  Stream<ServerStatus> get serverStatus => _serverStatusSbj.stream;

  @override
  Future<void> retryConnection() async {
    await dispose();
    init();
  }
}

enum InternetStatus { available, noInternet }

enum ServerStatus {
  connecting,
  waitingToRetry,
  disconnected,
  connected,
  failed
}
