import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'bash_ios_editor_plugin_platform_interface.dart';

/// An implementation of [BashIosEditorPluginPlatform] that uses method channels.
class MethodChannelBashIosEditorPlugin extends BashIosEditorPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bash_ios_editor_plugin');

  @override
  Future<String?> openImageEditor(String imagePath) async {
    final version = await methodChannel.invokeMethod('openEditor', {
      'type': 'image',
      'path': imagePath,
    });
    return version;
  }

  @override
  Future<String?> openVideoEditor(String videoPath) async {
    final version = await methodChannel.invokeMethod('openEditor', {
      'type': 'video',
      'path': videoPath,
    });
    return version;
  }
}

