import 'package:intl/intl.dart';

/// Formats FX rates and amounts using the user's chosen home currency.
class CurrencyFormatter {
  CurrencyFormatter._();

  static String fxLine({
    required String base,
    required double rate,
    required String target,
    required String Function(String base, String rate, String target) template,
  }) {
    final formattedRate =
        rate >= 1 ? rate.toStringAsFixed(2) : rate.toStringAsFixed(4);
    return template(base, formattedRate, target);
  }

  static String formatAmount({
    required num amount,
    required String currencyCode,
    required String localeCode,
  }) {
    try {
      final format = NumberFormat.simpleCurrency(
        name: currencyCode,
        locale: _intlLocale(currencyCode, localeCode),
      );
      return format.format(amount);
    } catch (_) {
      return '$currencyCode ${amount.toStringAsFixed(2)}';
    }
  }

  static String _intlLocale(String currency, String appLocale) {
    return switch (currency) {
      'EUR' => 'de_DE',
      'GBP' => 'en_GB',
      'NGN' => 'en_NG',
      'AED' => 'ar_AE',
      'JPY' => 'ja_JP',
      'CNY' => 'zh_CN',
      'INR' => 'hi_IN',
      'BRL' => 'pt_BR',
      'MXN' => 'es_MX',
      'TRY' => 'tr_TR',
      _ => appLocale,
    };
  }
}
