import 'package:flutter/services.dart';

class GmapsAPIKEY {
  static const MethodChannel _methodChannel =
      MethodChannel('com.map_api_key.flutter');

  static Future<void> setGoogleMapApiKey(String mapKey) async {
    /// Map data for passing to native code
    final Map<String, dynamic> requestData = <String, dynamic>{
      'mapKey': mapKey
    };

    // ignore: always_specify_types
    _methodChannel.invokeMethod('setGoogleMapKey', requestData).then((value) {
      assert(value != null);
    });
  }
}
