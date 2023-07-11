import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rxdart/rxdart.dart';

import 'insider_handle_url_method_channel.dart';

abstract class InsiderHandleUrlPlatform extends PlatformInterface {
  /// Constructs a InsiderHandleUrlPlatform.
  InsiderHandleUrlPlatform() : super(token: _token);

  static final Object _token = Object();

  static InsiderHandleUrlPlatform _instance = MethodChannelInsiderHandleUrl();

  /// The default instance of [InsiderHandleUrlPlatform] to use.
  ///
  /// Defaults to [MethodChannelInsiderHandleUrl].
  static InsiderHandleUrlPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InsiderHandleUrlPlatform] when
  /// they register themselves.
  static set instance(InsiderHandleUrlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> handleUrl(Uri uri) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  // final BehaviorSubject<Map<String, dynamic>> callbackEvents = BehaviorSubject<Map<String, dynamic>>();
}
