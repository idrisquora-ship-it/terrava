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

  @override
  String get roleChooseTitle => 'Choose account type';

  @override
  String get roleChooseSubtitle =>
      'Pick how you will use Terrava. Business owners can list properties and businesses.';

  @override
  String get roleChooseFootnote =>
      'You cannot change this later in the app. Contact support if you chose the wrong type.';

  @override
  String get roleCivilian => 'Civilian';

  @override
  String get roleCivilianHint =>
      'Search neighborhoods, save places, and message listing owners.';

  @override
  String get roleBusinessOwner => 'Business owner / Agent';

  @override
  String get roleBusinessOwnerShort => 'Business';

  @override
  String get roleBusinessOwnerHint =>
      'List houses, restaurants, and other businesses — plus all civilian features.';

  @override
  String get roleSaveFailed => 'Could not save account type. Try again.';

  @override
  String get listingsCreateTitle => 'Create listing';

  @override
  String get listingsMineTitle => 'My listings';

  @override
  String get listingsMineEmptyTitle => 'No listings yet';

  @override
  String get listingsMineEmptyMessage =>
      'Publish a house, shop, or restaurant so people nearby can find you first.';

  @override
  String get listingsKindLabel => 'Listing type';

  @override
  String get listingsKindRental => 'Rent';

  @override
  String get listingsKindSale => 'Sale';

  @override
  String get listingsKindBusiness => 'Business';

  @override
  String get listingsCategoryLabel => 'Category';

  @override
  String get listingsTitleLabel => 'Title';

  @override
  String get listingsDescriptionLabel => 'Description';

  @override
  String get listingsPriceLabel => 'Price (NGN)';

  @override
  String get listingsCityLabel => 'City';

  @override
  String get listingsAreaLabel => 'Area / neighborhood';

  @override
  String get listingsPhoneLabel => 'Phone (optional)';

  @override
  String get listingsRequired => 'Required';

  @override
  String get listingsLocating => 'Getting your location…';

  @override
  String listingsLocationSet(String lat, String lng) {
    return 'Location set: $lat, $lng';
  }

  @override
  String get listingsUseMyLocation => 'Use my current location';

  @override
  String get listingsAddPhoto => 'Add photos';

  @override
  String listingsPhotosCount(int count, int max) {
    return '$count/$max photos';
  }

  @override
  String listingsPhotosMaxReached(int max) {
    return 'Maximum $max photos per listing.';
  }

  @override
  String get listingsManagePhotos => 'Photos';

  @override
  String get listingsPublish => 'Publish listing';

  @override
  String get listingsPublishFailed =>
      'Could not publish listing. Check your connection and role.';

  @override
  String get listingsPhotoFailed => 'Could not upload photo.';

  @override
  String get listingsLoadFailed => 'Could not load listings.';

  @override
  String get listingsNotFound => 'Listing not found';

  @override
  String get listingsListedBadge => 'Listed on Terrava';

  @override
  String get listingsPause => 'Pause / unpause';

  @override
  String get listingsBedrooms => 'Bedrooms';

  @override
  String get listingsBathrooms => 'Bathrooms';

  @override
  String listingsBedroomsValue(int count) {
    return '$count beds';
  }

  @override
  String listingsBathroomsValue(int count) {
    return '$count baths';
  }

  @override
  String get listingsFurnished => 'Furnished';

  @override
  String get listingsUnfurnished => 'Unfurnished';

  @override
  String get listingsAmenities => 'Amenities';

  @override
  String get listingsOpeningHours => 'Opening hours';

  @override
  String get listingsServices => 'Menu / services';

  @override
  String get listingsServicesHint =>
      'What you offer (menu highlights, services…)';

  @override
  String get listingsVerifiedBadge => 'Verified on Terrava';

  @override
  String get listingsVerifiedComingSoon =>
      'Verified badge will be a paid upgrade later. Payment is not enabled yet.';

  @override
  String get listingsSave => 'Save listing';

  @override
  String get listingsUnsave => 'Remove from saved';

  @override
  String get listingsSavedTitle => 'Saved listings';

  @override
  String get listingsSavedEmptyTitle => 'No saved listings';

  @override
  String get listingsSavedEmptyMessage =>
      'Save Terrava listings you like to revisit them later.';

  @override
  String get listingsAlertsTitle => 'Listing alerts';

  @override
  String get listingsAlertsIntro =>
      'Get remembered filters for new houses/businesses in an area. Push alerts come later — your alert is saved now.';

  @override
  String get listingsCreateAlert => 'Save alert';

  @override
  String get listingsAlertSaved => 'Alert saved.';

  @override
  String get listingsAlertFailed => 'Could not save alert.';

  @override
  String get listingsYourAlerts => 'Your alerts';

  @override
  String get listingsNoAlerts => 'No alerts yet.';

  @override
  String get listingsMaxPrice => 'Max price (NGN)';

  @override
  String get listingsDashboardTitle => 'Listing dashboard';

  @override
  String get listingsStatTotal => 'Listings';

  @override
  String get listingsStatActive => 'Active';

  @override
  String get listingsStatViews => 'Views';

  @override
  String get listingsStatMessages => 'Message threads';

  @override
  String get listingsAvailableFrom => 'Available from';

  @override
  String get listingsPickAvailableFrom => 'Pick available date';

  @override
  String get listingsPricePeriod => 'Price type';

  @override
  String get listingsPriceMonthly => 'Monthly';

  @override
  String get listingsPriceYearly => 'Yearly';

  @override
  String get listingsPriceNegotiable => 'Negotiable';

  @override
  String get listingsPriceTotal => 'Total';

  @override
  String get listingsSetCover => 'Set as cover';

  @override
  String get listingsCoverBadge => 'Cover';

  @override
  String get listingsShare => 'Share';

  @override
  String get listingsReport => 'Report listing';

  @override
  String get listingsReportReason => 'Why are you reporting this?';

  @override
  String get listingsReportSpam => 'Spam or scam';

  @override
  String get listingsReportWrongInfo => 'Wrong information';

  @override
  String get listingsReportInappropriate => 'Inappropriate content';

  @override
  String get listingsReportOther => 'Other';

  @override
  String get listingsReportSubmitted => 'Thanks — we received your report.';

  @override
  String get listingsReportFailed => 'Could not submit report.';

  @override
  String get listingsReportAlready => 'You already reported this listing.';

  @override
  String get searchAreaHint => 'Area (e.g. Ayekale, Osogbo)';

  @override
  String get searchListedSection => 'Listed on Terrava';

  @override
  String get searchListedEmpty =>
      'No Terrava listings match yet — try another area or see more places below.';

  @override
  String get searchMorePlacesSection => 'More places nearby';

  @override
  String get chatInboxTitle => 'Messages';

  @override
  String get chatInboxEmptyTitle => 'No conversations yet';

  @override
  String get chatInboxEmptyMessage =>
      'Message a listing owner from a Terrava listing to start chatting.';

  @override
  String get chatThreadTitle => 'Chat';

  @override
  String get chatInputHint => 'Type a message';

  @override
  String get chatNoMessagesYet => 'Say hello to start the conversation.';

  @override
  String get chatMessageSeller => 'Message';

  @override
  String get chatStartFailed => 'Could not start chat.';

  @override
  String get chatSendFailed => 'Could not send message.';

  @override
  String get chatLoadFailed => 'Could not load messages.';

  @override
  String get chatAttachMedia => 'Attach photo or video';

  @override
  String get chatAttachImage => 'Send photo';

  @override
  String get chatAttachVideo => 'Send video';

  @override
  String get chatOpenVideo => 'Open video';

  @override
  String get adminTitle => 'Admin dashboard';

  @override
  String get adminBadge => 'Admin';

  @override
  String get adminAccessDenied => 'You need admin access to open this screen.';

  @override
  String get adminTabUsers => 'Users';

  @override
  String get adminTabVerify => 'Verify';

  @override
  String get adminTabIssues => 'Issues';

  @override
  String get adminTabListingReports => 'Listings';

  @override
  String get adminTabAnnounce => 'Announce';

  @override
  String get adminMakeAdmin => 'Make admin';

  @override
  String get adminRemoveAdmin => 'Remove admin';

  @override
  String get adminSuspend => 'Suspend account';

  @override
  String get adminBlock => 'Block account';

  @override
  String get adminActivate => 'Reactivate account';

  @override
  String get adminDeleteAccount => 'Delete account';

  @override
  String get adminDeleteConfirm =>
      'Soft-delete this account? They will lose access immediately.';

  @override
  String get adminActionDone => 'Done.';

  @override
  String get adminActionFailed => 'That admin action failed.';

  @override
  String get adminLoadFailed => 'Could not load admin data.';

  @override
  String get adminNoPendingVerify => 'No pending verification requests.';

  @override
  String get adminApprove => 'Approve';

  @override
  String get adminReject => 'Reject';

  @override
  String get adminNoIssues => 'No issue reports.';

  @override
  String get adminNoListingReports => 'No listing reports.';

  @override
  String get adminMarkInProgress => 'Mark in progress';

  @override
  String get adminMarkResolved => 'Mark resolved';

  @override
  String get adminMarkDismissed => 'Dismiss';

  @override
  String get adminMarkReviewed => 'Mark reviewed';

  @override
  String get adminRelatedUser => 'Related user';

  @override
  String get adminAnnounceTitle => 'Announcement title';

  @override
  String get adminAnnounceBody => 'Message to all users';

  @override
  String get adminSendAnnounce => 'Publish announcement';

  @override
  String get adminAnnounceSent => 'Announcement published.';

  @override
  String get adminPastAnnouncements => 'Past announcements';

  @override
  String get adminNoAnnouncements => 'No announcements yet.';

  @override
  String get adminActive => 'Active';

  @override
  String get adminInactive => 'Inactive';

  @override
  String get reportIssueTitle => 'Report an issue';

  @override
  String get reportIssueIntro =>
      'Tell admins about a problem with the app, a listing, or another user.';

  @override
  String get reportIssueSubject => 'Subject';

  @override
  String get reportIssueBody => 'Describe the issue';

  @override
  String get reportIssueSubmit => 'Send to admins';

  @override
  String get reportIssueSubmitted => 'Thanks — admins will review your report.';

  @override
  String get reportIssueFailed => 'Could not send report.';

  @override
  String get reportUser => 'Report user';

  @override
  String get reportUserSubject => 'Report a user';

  @override
  String get announcementsTitle => 'Announcements';

  @override
  String get announcementsEmpty => 'No announcements right now.';

  @override
  String get verificationRequest => 'Request verification';

  @override
  String get verificationRequested =>
      'Verification request sent. An admin will review it.';

  @override
  String get verificationPending => 'Verification pending admin approval.';

  @override
  String get verificationRejected =>
      'Verification was rejected. You can request again.';

  @override
  String get verificationFailed => 'Could not request verification.';

  @override
  String get accountRestrictedTitle => 'Account restricted';

  @override
  String get accountRestrictedMessage =>
      'Your account cannot use Terrava right now.';

  @override
  String get accountSuspendedMessage =>
      'Your account is suspended. Contact support if you think this is a mistake.';

  @override
  String get accountBlockedMessage => 'Your account is blocked.';

  @override
  String get accountDeletedMessage => 'This account has been deleted.';

  @override
  String get categoryHouseRent => 'House rent';

  @override
  String get listingsAddressLabel => 'Street address';

  @override
  String get listingsStateLabel => 'State';

  @override
  String get rentalsBrowseTitle => 'Houses for rent';

  @override
  String get rentalsBrowseIntro =>
      'Browse rentals by city and area. Change the city/state anytime to explore a place you want to move to.';

  @override
  String rentalsDetectedLocation(String address) {
    return 'Detected near: $address';
  }

  @override
  String get rentalsSearch => 'Show rentals';

  @override
  String get rentalsUseMyCity => 'Use my detected city';

  @override
  String get rentalsAllAreas => 'All areas';

  @override
  String get rentalsEmptyTitle => 'No rentals here yet';

  @override
  String get rentalsEmptyMessage =>
      'Try another city, state, or area — or list a rental if you are a business owner.';

  @override
  String get rentalsNoAddress => 'Location not set';

  @override
  String get rentalsExploreArea => 'See restaurants, markets & schools nearby';

  @override
  String get searchCityHint => 'City (e.g. Osogbo, Ibadan, Lagos)';

  @override
  String get searchNearMeOnly => 'Near my GPS only';

  @override
  String get listingsExploreArea => 'Explore this neighborhood';

  @override
  String get downloadApkTooltip => 'Download Android APK';
}
