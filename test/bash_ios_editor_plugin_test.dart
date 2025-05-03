import 'package:flutter_test/flutter_test.dart';
import 'package:bash_ios_editor_plugin/bash_ios_editor_plugin.dart';
import 'package:bash_ios_editor_plugin/bash_ios_editor_plugin_platform_interface.dart';
import 'package:bash_ios_editor_plugin/bash_ios_editor_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBashIosEditorPluginPlatform
    with MockPlatformInterfaceMixin
    implements BashIosEditorPluginPlatform {
  @override
  Future<String?> openImageEditor(String path) => Future.value('42');

  @override
  Future<String?> openVideoEditor(String path) => Future.value('42');
}

void main() {
  final BashIosEditorPluginPlatform initialPlatform =
      BashIosEditorPluginPlatform.instance;

  test('$MethodChannelBashIosEditorPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBashIosEditorPlugin>());
  });

  test('getPlatformVersion', () async {
    BashIosEditorPlugin bashIosEditorPlugin = BashIosEditorPlugin();
    MockBashIosEditorPluginPlatform fakePlatform =
        MockBashIosEditorPluginPlatform();
    BashIosEditorPluginPlatform.instance = fakePlatform;

    expect(await bashIosEditorPlugin.openVideoEditor(""), '42');
  });
}
