import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bash_ios_editor_plugin/bash_ios_editor_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBashIosEditorPlugin platform =
      MethodChannelBashIosEditorPlugin();
  const MethodChannel channel = MethodChannel('bash_ios_editor_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('bash_ios_editor_plugin', () async {
    expect(await platform.openImageEditor(""), '42');
  });
}
