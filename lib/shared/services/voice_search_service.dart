import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/config/env.dart';

/// Voice search port — ready for enablement via ENABLE_VOICE_SEARCH=true.
abstract class VoiceSearchPort {
  Future<bool> get isAvailable;
  Future<String?> listenOnce();
  Future<void> stop();
}

final voiceSearchProvider = Provider<VoiceSearchPort>((ref) {
  if (!Env.enableVoiceSearch) {
    return const DisabledVoiceSearch();
  }
  return SpeechVoiceSearch();
});

class DisabledVoiceSearch implements VoiceSearchPort {
  const DisabledVoiceSearch();

  @override
  Future<bool> get isAvailable async => false;

  @override
  Future<String?> listenOnce() async => null;

  @override
  Future<void> stop() async {}
}

class SpeechVoiceSearch implements VoiceSearchPort {
  final _speech = SpeechToText();

  @override
  Future<bool> get isAvailable async => _speech.initialize();

  @override
  Future<String?> listenOnce() async {
    final ok = await isAvailable;
    if (!ok) return null;
    var resultText = '';
    await _speech.listen(
      onResult: (result) {
        resultText = result.recognizedWords;
      },
      listenOptions: SpeechListenOptions(
        listenFor: const Duration(seconds: 8),
        pauseFor: const Duration(seconds: 2),
      ),
    );
    await Future<void>.delayed(const Duration(seconds: 8));
    await stop();
    return resultText.trim().isEmpty ? null : resultText.trim();
  }

  @override
  Future<void> stop() => _speech.stop();
}
