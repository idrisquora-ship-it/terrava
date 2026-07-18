import 'package:flutter/material.dart';

/// Languages available in Settings (code → native label).
const kSupportedLanguages = <String, String>{
  'en': 'English',
  'fr': 'Français',
  'es': 'Español',
  'ar': 'العربية',
  'pt': 'Português',
  'de': 'Deutsch',
  'it': 'Italiano',
  'hi': 'हिन्दी',
  'zh': '中文',
  'ja': '日本語',
  'tr': 'Türkçe',
  'nl': 'Nederlands',
  'ru': 'Русский',
};

/// Home / display currencies.
const kSupportedCurrencies = <String, String>{
  'USD': 'USD — US Dollar',
  'EUR': 'EUR — Euro',
  'GBP': 'GBP — British Pound',
  'NGN': 'NGN — Nigerian Naira',
  'AED': 'AED — UAE Dirham',
  'CAD': 'CAD — Canadian Dollar',
  'AUD': 'AUD — Australian Dollar',
  'INR': 'INR — Indian Rupee',
  'JPY': 'JPY — Japanese Yen',
  'CNY': 'CNY — Chinese Yuan',
  'BRL': 'BRL — Brazilian Real',
  'MXN': 'MXN — Mexican Peso',
  'ZAR': 'ZAR — South African Rand',
  'SAR': 'SAR — Saudi Riyal',
  'TRY': 'TRY — Turkish Lira',
};

Locale localeFromCode(String code) {
  final parts = code.split('_');
  if (parts.length == 2) {
    return Locale(parts[0], parts[1]);
  }
  return Locale(code);
}

List<Locale> get supportedFlutterLocales =>
    kSupportedLanguages.keys.map(localeFromCode).toList();

bool isRtlLocale(String code) => code == 'ar';
