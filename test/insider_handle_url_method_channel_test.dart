import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insider_handle_url/insider_handle_url_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInsiderHandleUrl platform = MethodChannelInsiderHandleUrl();
  const MethodChannel channel = MethodChannel('insider_handle_url');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
