import 'package:flutter/material.dart';
import 'package:terrava/l10n/app_localizations.dart';

import '../../core/constants/place_categories.dart';
import '../format/currency_formatter.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension CategoryL10n on PlaceCategory {
  String localizedLabel(AppLocalizations l10n) {
    return switch (id) {
      'restaurants' => l10n.categoryRestaurants,
      'hotels' => l10n.categoryHotels,
      'hospitals' => l10n.categoryHospitals,
      'banks' => l10n.categoryBanks,
      'pharmacies' => l10n.categoryPharmacies,
      'schools' => l10n.categorySchools,
      'supermarkets' => l10n.categorySupermarkets,
      'markets' => l10n.categoryMarkets,
      'fuel' => l10n.categoryFuel,
      _ => label,
    };
  }
}

extension ScoreGroupL10n on String {
  String localizedScoreGroup(AppLocalizations l10n) {
    return switch (this) {
      'essentials' => l10n.scoreEssentials,
      'health' => l10n.scoreHealth,
      'food' => l10n.scoreFood,
      'transport' => l10n.scoreTransport,
      'money' => l10n.scoreMoney,
      'education' => l10n.scoreEducation,
      'fuel' => l10n.scoreFuel,
      _ => this,
    };
  }
}

String localizedScoreSummary({
  required AppLocalizations l10n,
  required String areaName,
  required int overall,
  required String strongestId,
  required String weakestId,
  required double radiusKm,
  required int essentialsCount,
  required int healthCount,
  required int foodCount,
  required int transportCount,
}) {
  return l10n.scoreSummary(
    areaName,
    overall,
    strongestId.localizedScoreGroup(l10n),
    weakestId.localizedScoreGroup(l10n),
    radiusKm.toStringAsFixed(1),
    essentialsCount,
    healthCount,
    foodCount,
    transportCount,
  );
}

String localizedFxLine(
    AppLocalizations l10n, String base, double rate, String target) {
  return CurrencyFormatter.fxLine(
    base: base,
    rate: rate,
    target: target,
    template: l10n.fxRate,
  );
}
