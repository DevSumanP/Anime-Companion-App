import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_1/core/service/network/network.dart';

class NetworkAvailableImpl implements NetworkAvailable {
  final Connectivity connectivity;

  const NetworkAvailableImpl({
    required this.connectivity,
  });

  @override
  Future<bool> get isWifiConnected async {
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }
}
