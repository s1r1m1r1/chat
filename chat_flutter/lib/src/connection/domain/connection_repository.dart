// connection_repository.dart
import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

import '../../../main.dart'; // Assuming 'client' is accessible via main.dart

abstract class ConnectionRepository {
  Stream<InternetStatus> get internetStatus;
  Stream<ServerStatus> get serverStatus;
  Future<InternetStatus> getCurrentInternetStatus(); // Added for initial sync
  Future<ServerStatus> getCurrentServerStatus(); // Added for initial sync

  // Direct actions to interact with the chat client
  Future<void> openStreamingConnection();
  Future<void> closeStreamingConnection();

  void init(); // Still needed for client listeners and initial setup
  Future<void> dispose();
}

@LazySingleton(as: ConnectionRepository)
class ConnectionRepositoryImpl extends ConnectionRepository {
  ConnectionRepositoryImpl() {
    init(); // Call init immediately on creation
  }

  final _connectivity = Connectivity();
  final _serverStatusSbj = BehaviorSubject<ServerStatus>.seeded(ServerStatus.disconnected);
  final _internetStatusSbj = BehaviorSubject<InternetStatus>.seeded(InternetStatus.noInternet);

  StreamSubscription? _connectivitySubscription;

  @override
  void init() {
    // Only add listeners here. No connection attempts.
    client.addStreamingConnectionStatusListener(_changedConnectionStatus);
    _listenInternetStatus();
  }

  // Maps chat client's status to our ServerStatus enum
  void _changedConnectionStatus() {
    ServerStatus newStatus;
    switch (client.streamingConnectionStatus) {
      case StreamingConnectionStatus.disconnected:
        newStatus = ServerStatus.disconnected;
        break;
      case StreamingConnectionStatus.connected:
        newStatus = ServerStatus.connected;
        break;
      case StreamingConnectionStatus.connecting:
        newStatus = ServerStatus.connecting;
        break;
      case StreamingConnectionStatus.waitingToRetry:
        newStatus = ServerStatus.waitingToRetry;
        break;
    }
    _serverStatusSbj.add(newStatus);
    debugPrint('ConnectionRepository: Client streaming status changed to: $newStatus');
  }

  @override
  Future<void> openStreamingConnection() async {
    if (client.streamingConnectionStatus == StreamingConnectionStatus.disconnected) {
      await client.openStreamingConnection();
    }
  }

  @override
  Future<void> closeStreamingConnection() async {
    await client.closeStreamingConnection();
  }

  @override
  Stream<InternetStatus> get internetStatus => _internetStatusSbj.stream;

  @override
  Future<InternetStatus> getCurrentInternetStatus() async {
    final conResult = await _connectivity.checkConnectivity();
    return InternetStatus.fromConnectivityResult(conResult);
  }

  @override
  Future<ServerStatus> getCurrentServerStatus() async {
    return _serverStatusSbj.value;
  }

  void _listenInternetStatus() async {
    final conResult = await _connectivity.checkConnectivity();
    _internetStatusSbj.value = InternetStatus.fromConnectivityResult(conResult);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.map(InternetStatus.fromConnectivityResult).listen(_internetStatusSbj.add);
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    debugPrint('ConnectionRepositoryImpl disposing.');
    _serverStatusSbj.close();
    _internetStatusSbj.close();
    _connectivitySubscription?.cancel();
    // Ensure client resources are properly released
    client.removeStreamingConnectionStatusListener(_changedConnectionStatus);
    await client.closeStreamingConnection(); // Ensure client is closed on dispose
  }

  @override
  Stream<ServerStatus> get serverStatus => _serverStatusSbj.stream;
}

enum InternetStatus {
  available,
  noInternet;

  static InternetStatus fromConnectivityResult(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return InternetStatus.available;
    }
    return InternetStatus.noInternet;
  }
}

enum ServerStatus {
  connecting,
  waitingToRetry,
  disconnected,
  connected,
}
