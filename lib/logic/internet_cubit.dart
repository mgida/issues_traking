import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? streamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    monitorConnection();
  }

  StreamSubscription<ConnectivityResult> monitorConnection() {
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
