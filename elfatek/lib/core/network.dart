import 'dart:io';

class ConnectionStatus {
  static final ConnectionStatus _singleton = ConnectionStatus._internal();
  ConnectionStatus._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatus getInstance() => _singleton;
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
