import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _onboardingCompleteKey = 'terrava_onboarding_complete';

/// Overridden in `main.dart` with a real [SharedPreferences] instance.
final appPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('appPrefsProvider must be overridden in main.dart');
});

final onboardingCompleteProvider =
    NotifierProvider<OnboardingPrefsController, bool>(
  OnboardingPrefsController.new,
);

class OnboardingPrefsController extends Notifier<bool> {
  @override
  bool build() {
    final prefs = ref.watch(appPrefsProvider);
    return prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  Future<void> complete() async {
    final prefs = ref.read(appPrefsProvider);
    await prefs.setBool(_onboardingCompleteKey, true);
    state = true;
  }
}
