
import 'package:rxdart/rxdart.dart';

import 'insider_handle_url_platform_interface.dart';

class InsiderHandleUrl {
  // BehaviorSubject<Map<String, dynamic>> get callbackEvents => InsiderHandleUrlPlatform.instance.callbackEvents;

  Future<void> handleUrl(Uri uri) {
    return InsiderHandleUrlPlatform.instance.handleUrl(uri);
  }
}
