import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetwotkInfoImpl implements NetworkInfo {
  NetwotkInfoImpl(this.connectionChecker);

  final DataConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}