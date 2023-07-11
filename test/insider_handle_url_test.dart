import 'package:flutter_test/flutter_test.dart';
import 'package:insider_handle_url/insider_handle_url.dart';
import 'package:insider_handle_url/insider_handle_url_platform_interface.dart';
import 'package:insider_handle_url/insider_handle_url_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInsiderHandleUrlPlatform
    with MockPlatformInterfaceMixin
    implements InsiderHandleUrlPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InsiderHandleUrlPlatform initialPlatform = InsiderHandleUrlPlatform.instance;

  test('$MethodChannelInsiderHandleUrl is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInsiderHandleUrl>());
  });

  test('getPlatformVersion', () async {
    InsiderHandleUrl insiderHandleUrlPlugin = InsiderHandleUrl();
    MockInsiderHandleUrlPlatform fakePlatform = MockInsiderHandleUrlPlatform();
    InsiderHandleUrlPlatform.instance = fakePlatform;

    expect(await insiderHandleUrlPlugin.getPlatformVersion(), '42');
  });
}
