import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.internetConnectionChecker);

  final InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}

