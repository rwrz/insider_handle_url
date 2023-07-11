import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'insider_handle_url_platform_interface.dart';

/// An implementation of [InsiderHandleUrlPlatform] that uses method channels.
class MethodChannelInsiderHandleUrl extends InsiderHandleUrlPlatform {
  MethodChannelInsiderHandleUrl() {
    // // register for events since the beginning and adding it to a behavior subject, so we can listen to it later
    // _eventChannel.receiveBroadcastStream().listen((event) {
    //   try {
    //     Map<String, dynamic> map = jsonDecode(event);
    //     if (map["type"] != null && map["data"] != null) {
    //       callbackEvents.add(map);
    //     }
    //   } catch (err) {
    //     // log error?
    //   }
    // }, onError: (dynamic error) {
    //   // log error?
    // });
  }

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('insider_handle_url');

  /// The method channel used to interact with the native platform. Receiving its async events.
  // final EventChannel _eventChannel = const EventChannel('insider_handle_url/events');

  @override
  Future<void> handleUrl(Uri uri) async {
    await methodChannel.invokeMethod<String>('handleUrl', {'url': uri.toString()});
  }
}
