// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Verstehe jedes Viertel';

  @override
  String get navHome => 'Start';

  @override
  String get navExplore => 'Entdecken';

  @override
  String get navSaved => 'Gespeichert';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonCreate => 'Erstellen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonContinue => 'Weiter';

  @override
  String get commonTryAgain => 'Erneut versuchen';

  @override
  String get commonDirections => 'Route';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonShare => 'Teilen';

  @override
  String get commonSeeAll => 'Alle anzeigen';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get unitsMetric => 'Metrisch (km)';

  @override
  String get unitsImperial => 'Imperial (mi)';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsAppearance => 'Erscheinungsbild';

  @override
  String get settingsUnits => 'Einheiten';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsCurrency => 'Währung';

  @override
  String get settingsAboutTerrava => 'Über Terrava';

  @override
  String get settingsHelp => 'Hilfe';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get settingsTermsOfService => 'Nutzungsbedingungen';

  @override
  String get notificationsPushTitle => 'Push-Benachrichtigungen';

  @override
  String get notificationsPushSubtitle =>
      'Gespeicherte Orte, Tipps und Kontobenachrichtigungen über Firebase';

  @override
  String get notificationsEnabledTitle => 'Benachrichtigungen aktiviert';

  @override
  String get notificationsEnabledBody =>
      'Terrava kann dich ?ber gespeicherte Orte und Konto-Updates informieren.';

  @override
  String get notificationsPlaceSavedTitle => 'In Terrava gespeichert';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ist in deiner Liste. ?ffne Gespeichert jederzeit, um es erneut anzusehen.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Viertel gespeichert';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ist bereit, wenn du die Bewertungen wieder vergleichen m?chtest.';
  }

  @override
  String get notificationsWelcomeTitle => 'Willkommen bei Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Entdecke Viertel, speichere Orte und erhalte Bewertungseinblicke in deiner N?he.';

  @override
  String get notificationsGenericUpdate => 'Du hast ein neues Update';

  @override
  String get accountDelete => 'Konto löschen';

  @override
  String get accountDeleteQuestion => 'Konto löschen?';

  @override
  String get accountDeleteWarning =>
      'Dadurch werden dein Terrava-Konto und gespeicherte Daten dauerhaft gelöscht.';

  @override
  String get authWelcomeBack => 'Willkommen zurück';

  @override
  String get authSignInSubtitle =>
      'Melde dich an, um Viertel zu speichern und weiter zu entdecken.';

  @override
  String get authEmail => 'E-Mail';

  @override
  String get authPassword => 'Passwort';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authSignIn => 'Anmelden';

  @override
  String get authSignOut => 'Abmelden';

  @override
  String get authContinueGoogle => 'Mit Google fortfahren';

  @override
  String get authContinueApple => 'Mit Apple fortfahren';

  @override
  String get authCreateAccount => 'Konto erstellen';

  @override
  String get authCreateAccountTitle => 'Konto erstellen';

  @override
  String get authSignUpSubtitle =>
      'Tritt Terrava bei, um Orte zu speichern und dein nächstes Viertel zu planen.';

  @override
  String get authDisplayName => 'Anzeigename';

  @override
  String get authSignUp => 'Registrieren';

  @override
  String get authAccountCreated =>
      'Konto erstellt. Du kannst mit dem Entdecken beginnen.';

  @override
  String get authAlreadyHaveAccount => 'Bereits ein Konto? Anmelden';

  @override
  String get authResetPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get authResetPasswordSubtitle =>
      'Gib deine E-Mail ein und wir senden dir einen Reset-Link.';

  @override
  String get authSendResetLink => 'Reset-Link senden';

  @override
  String get authBackToSignIn => 'Zurück zur Anmeldung';

  @override
  String get validationInvalidEmail => 'Gib eine gültige E-Mail ein';

  @override
  String get validationPasswordMinLength => 'Mindestens 6 Zeichen';

  @override
  String get onboardingDiscoverTitle => 'Entdecke jeden Ort';

  @override
  String get onboardingDiscoverBody =>
      'Suche Städte, Straßen, Sehenswürdigkeiten oder Koordinaten und sieh, wie das Leben dort aussieht.';

  @override
  String get onboardingNearbyTitle => 'Wisse, was in der Nähe ist';

  @override
  String get onboardingNearbyBody =>
      'Restaurants, Krankenhäuser, Schulen, Banken, Märkte und das Wesentliche — organisiert für echte Entscheidungen.';

  @override
  String get onboardingPlanTitle => 'Plane mit Klarheit';

  @override
  String get onboardingPlanBody =>
      'Speichere Viertel, vergleiche Gebiete und handle mit Vertrauen — bevor du besuchst oder umziehst.';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingGetStarted => 'Loslegen';

  @override
  String get homeTagline => 'Entdecke, was um jedes Viertel herum liegt';

  @override
  String get homeSearchHint => 'Stadt, Gebiet, Sehenswürdigkeit suchen…';

  @override
  String get homeCategoriesTitle => 'Kategorien';

  @override
  String get homeCategoriesSubtitle => 'Wesentliches in deiner Umgebung';

  @override
  String get homeNearbyTitle => 'In der Nähe';

  @override
  String get homeNearbySubtitle => 'Nah bei dir';

  @override
  String get homeNoNearbyTitle => 'Noch keine Orte in der Nähe';

  @override
  String get homeNoNearbyMessage =>
      'Standort erlauben oder Suche ausprobieren.';

  @override
  String get homeRecentlyViewedTitle => 'Kürzlich angesehen';

  @override
  String get homeRecentlyViewedSubtitle => 'Aus deiner Kontoaktivität';

  @override
  String get homeNoRecentViews => 'Orte, die du öffnest, erscheinen hier.';

  @override
  String get homePopularNearbyTitle => 'Beliebt in der Nähe';

  @override
  String get homePopularNearbySubtitle => 'Hoch bewertet um dich herum';

  @override
  String get locationPermissionNeeded =>
      'Standortberechtigung für Orte in der Nähe erforderlich';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Aktueller Standort wird verwendet';

  @override
  String get locationReadError => 'Standort konnte nicht gelesen werden';

  @override
  String get locationNeighborhood => 'Viertel';

  @override
  String get locationSaveArea => 'Gebiet speichern';

  @override
  String get locationAreaSaved => 'Gebiet gespeichert';

  @override
  String get locationNoRadiusResults => 'Keine Ergebnisse in diesem Radius';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Einblicke nicht verfügbar: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Ausstattungsbewertung $score/100';
  }

  @override
  String securityScore(int score) {
    return 'Security signals $score/100';
  }

  @override
  String get securityScoreHint =>
      'Estimate from nearby police/fire, hospitals, and everyday activity — not official crime statistics.';

  @override
  String get placesNetworkError =>
      'Could not load nearby places. Check your connection and try again.';

  @override
  String weatherSummary(
      int temp, String condition, int feelsLike, int humidity) {
    return '$temp°C · $condition · gefühlt $feelsLike°C · Luftfeuchtigkeit $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'FX: 1 $base = $rate $target';
  }

  @override
  String scoreSummary(
      String area,
      int overall,
      String strongest,
      String weakest,
      String radius,
      int essentials,
      int health,
      int food,
      int transport) {
    return '$area erreicht $overall/100 für den Alltagskomfort (Zugang zu Einrichtungen — nicht Kriminalität oder offizielle Lebensqualität). Stärkste: $strongest. Schwächste: $weakest. Innerhalb von $radius km: $essentials Lebensmittel-/Apothekenoptionen, $health gesundheitsbezogene Orte, $food Essensorte, $transport verkehrsbezogene Orte.';
  }

  @override
  String get scoreEssentials => 'Essenzielles';

  @override
  String get scoreHealth => 'Gesundheit';

  @override
  String get scoreFood => 'Essen';

  @override
  String get scoreTransport => 'Verkehr';

  @override
  String get scoreMoney => 'Banken & Geldautomaten';

  @override
  String get scoreEducation => 'Bildung';

  @override
  String get scoreFuel => 'Tankstellen';

  @override
  String get categoryRestaurants => 'Restaurants';

  @override
  String get categoryHotels => 'Hotels';

  @override
  String get categoryHospitals => 'Krankenhäuser';

  @override
  String get categoryBanks => 'Banken';

  @override
  String get categoryPharmacies => 'Apotheken';

  @override
  String get categorySchools => 'Schulen';

  @override
  String get categorySupermarkets => 'Supermärkte';

  @override
  String get categoryMarkets => 'Märkte';

  @override
  String get categoryFuel => 'Tankstellen';

  @override
  String get categoryNoResultsTitle => 'Keine Ergebnisse';

  @override
  String get categoryNoResultsMessage =>
      'Andere Kategorie versuchen oder die Karte verschieben.';

  @override
  String mapClusterPlaces(int count) {
    return '$count Orte';
  }

  @override
  String get mapTapToZoom => 'Tippen zum Zoomen';

  @override
  String get mapSearchArea => 'Diesen Bereich durchsuchen';

  @override
  String get mapMyLocation => 'Mein Standort';

  @override
  String get savedTitle => 'Gespeichert';

  @override
  String get savedSubtitle =>
      'Orte, Viertel und Sammlungen mit deinem Konto synchronisiert.';

  @override
  String get savedCollectionsTitle => 'Sammlungen';

  @override
  String get savedNewCollection => 'Neu';

  @override
  String get savedNoCollections => 'Noch keine Sammlungen.';

  @override
  String get savedNeighborhoodsTitle => 'Viertel';

  @override
  String get savedNoAreas => 'Noch keine gespeicherten Gebiete.';

  @override
  String get savedPlacesTitle => 'Orte';

  @override
  String get savedNoPlacesTitle => 'Keine gespeicherten Orte';

  @override
  String get savedNoPlacesMessage =>
      'Speichere Restaurants, Hotels und mehr in den Details.';

  @override
  String get collectionFallbackName => 'Sammlung';

  @override
  String get collectionNewTitle => 'Neue Sammlung';

  @override
  String get collectionNameHint => 'Name';

  @override
  String get collectionDeleteTooltip => 'Sammlung löschen';

  @override
  String get collectionEmptyTitle => 'Leere Sammlung';

  @override
  String get collectionEmptyMessage =>
      'Orte hinzufügen unter Ortsdetails → Zur Sammlung speichern.';

  @override
  String get collectionSavedArea => 'Gespeichertes Gebiet';

  @override
  String get collectionCreateFirst =>
      'Erstelle zuerst eine Sammlung unter Gespeichert';

  @override
  String get collectionAdded => 'Zur Sammlung hinzugefügt';

  @override
  String get areaFallbackName => 'Gebiet';

  @override
  String get placeFallbackName => 'Ort';

  @override
  String get placeOpenNow => 'Jetzt geöffnet';

  @override
  String get placeClosed => 'Geschlossen';

  @override
  String get placeSaved => 'Ort gespeichert';

  @override
  String get placeCollection => 'Sammlung';

  @override
  String get placeCall => 'Anrufen';

  @override
  String get placeWebsite => 'Website';

  @override
  String get placeHours => 'Öffnungszeiten';

  @override
  String get placeReviews => 'Bewertungen';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileFallbackName => 'Reisender';

  @override
  String get profileChangePhoto => 'Foto ändern';

  @override
  String get profileSettingsSubtitle =>
      'Einheiten, Sprache, Benachrichtigungen, Rechtliches';

  @override
  String get profilePhotoUpdated => 'Profilfoto aktualisiert';

  @override
  String get searchTitle => 'Suche';

  @override
  String get searchHint => 'Land, Stadt, Straße, Sehenswürdigkeit, lat,lng';

  @override
  String get searchNoResults => 'Keine Ergebnisse für diese Suche';

  @override
  String get searchVoiceTooltip => 'Sprachsuche';

  @override
  String get searchVoiceDisabledTooltip => 'Sprachsuche (in .env aktivieren)';

  @override
  String get searchVoiceUnavailable => 'Mikrofon / Sprache nicht verfügbar';

  @override
  String get searchVoiceEnableInstruction =>
      'Setze ENABLE_VOICE_SEARCH=true in .env zum Aktivieren';

  @override
  String get searchRecentTitle => 'Letzte Suchen';

  @override
  String get searchNoRecent => 'Noch keine letzten Suchen.';

  @override
  String get searchPopularTitle => 'Beliebte Suchen';

  @override
  String get searchNoPopular =>
      'Beliebte Suchen erscheinen aus realer Nutzung.';

  @override
  String get searchNoSuggestionsTitle => 'Keine Vorschläge';

  @override
  String get searchNoSuggestionsMessage =>
      'Versuche eine Stadt, Sehenswürdigkeit oder Koordinaten.';

  @override
  String get directionsLocationRequired =>
      'Aktueller Standort für die Route erforderlich';

  @override
  String get directionsNoRoute => 'Keine Route gefunden';

  @override
  String get directionsOriginYou => 'Du';

  @override
  String get directionsDestination => 'Ziel';

  @override
  String get aboutTitle => 'Über';

  @override
  String get aboutDefaultDescription =>
      'Terrava hilft jedem, jedes Viertel zu verstehen, bevor man es besucht, umzieht oder dort lebt.';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get helpTitle => 'Hilfe';

  @override
  String get helpHowItWorksTitle => 'So funktioniert Terrava';

  @override
  String get helpHowItWorksBody =>
      'Suche jeden Ort auf der Erde, erkunde Wesentliches in der Nähe auf der Karte, öffne Vierteldetails für Ausstattungsbewertungen und speichere Orte in deinem Konto.';

  @override
  String get helpScoresTitle => 'Viertelbewertungen';

  @override
  String get helpScoresBody =>
      'Die Bewertungen sind Komfort-/Ausstattungsschätzungen aus Google-Places-Dichte, Bewertungen und Entfernung. Sie sind keine Kriminalitäts-, Schulqualitäts- oder offiziellen Lebensqualitätswerte.';

  @override
  String get privacyBody =>
      'Terrava speichert Ihr Kontoprofil, gespeicherte Orte, Suchverlauf und optionale Push-Token in Supabase mit Sicherheit auf Zeilenebene. Der Standort wird auf dem Gerät verwendet, um Orte in der Nähe über Google-APIs abzurufen. Wir verkaufen keine personenbezogenen Daten. Kontaktieren Sie den Support für Löschanfragen.';

  @override
  String get termsBody =>
      'Terrava bietet Tools zur Nachbarschaftserkundung zu Informationszwecken. Einrichtungsscores sind Schätzungen, keine Garantien für Sicherheit oder Lebensqualität. Kartendaten und Ortsdaten Dritter können unvollständig oder veraltet sein. Nutzen Sie die App gemäß geltendem Recht und den Google Maps-/Places-Bedingungen.';

  @override
  String get errorGenericTitle => 'Etwas ist schiefgelaufen';
}
