import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repository/repository.dart';

/// [ConnectivityUtils] checks for the device's internet connection.
/// [ConnectivityUtils] used in [Repository] class.
/// Example: [RepositoryUtils]
class ConnectivityUtils {
  final Connectivity connectivity;

  ConnectivityUtils({required this.connectivity});

  Future<bool> get isDeviceOnline async =>
      ConnectivityResult.none != await connectivity.checkConnectivity();
}
