import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terrava/core/config/env.dart';

void main() {
  setUpAll(() {
    dotenv.testLoad(fileInput: '''
APP_ENV=test
APP_NAME=Terrava
SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_PUBLIC_KEY
GOOGLE_MAPS_API_KEY=test
WEATHER_API_KEY=test
EXCHANGE_RATE_API_KEY=test
''');
  });

  test('Env reads app name from dotenv', () {
    expect(Env.appName, 'Terrava');
    expect(Env.hasValidSupabaseConfig, isFalse);
  });
}
