// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Begrijp elke buurt';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Ontdekken';

  @override
  String get navSaved => 'Opgeslagen';

  @override
  String get navProfile => 'Profiel';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonCreate => 'Maken';

  @override
  String get commonDelete => 'Verwijderen';

  @override
  String get commonContinue => 'Doorgaan';

  @override
  String get commonTryAgain => 'Opnieuw proberen';

  @override
  String get commonDirections => 'Route';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonShare => 'Delen';

  @override
  String get commonSeeAll => 'Alles zien';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get unitsMetric => 'Metrisch (km)';

  @override
  String get unitsImperial => 'Imperiaal (mi)';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsAppearance => 'Weergave';

  @override
  String get settingsUnits => 'Eenheden';

  @override
  String get settingsLanguage => 'Taal';

  @override
  String get settingsCurrency => 'Valuta';

  @override
  String get settingsAboutTerrava => 'Over Terrava';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsPrivacyPolicy => 'Privacybeleid';

  @override
  String get settingsTermsOfService => 'Servicevoorwaarden';

  @override
  String get notificationsPushTitle => 'Pushmeldingen';

  @override
  String get notificationsPushSubtitle =>
      'Opgeslagen plekken, tips en accountmeldingen via Firebase';

  @override
  String get notificationsEnabledTitle => 'Meldingen ingeschakeld';

  @override
  String get notificationsEnabledBody =>
      'Terrava kan je waarschuwen over opgeslagen plekken en accountupdates.';

  @override
  String get notificationsPlaceSavedTitle => 'Opgeslagen in Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName staat in je lijst. Open Opgeslagen wanneer je het opnieuw wilt bekijken.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Buurt opgeslagen';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName staat klaar wanneer je de scores opnieuw wilt vergelijken.';
  }

  @override
  String get notificationsWelcomeTitle => 'Welkom bij Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Ontdek buurten, sla plekken op en krijg score-inzichten in de buurt.';

  @override
  String get notificationsGenericUpdate => 'Je hebt een nieuwe update';

  @override
  String get accountDelete => 'Account verwijderen';

  @override
  String get accountDeleteQuestion => 'Account verwijderen?';

  @override
  String get accountDeleteWarning =>
      'Dit verwijdert permanent je Terrava-account en opgeslagen gegevens.';

  @override
  String get authWelcomeBack => 'Welkom terug';

  @override
  String get authSignInSubtitle =>
      'Log in om buurten op te slaan en verder te verkennen.';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authPassword => 'Wachtwoord';

  @override
  String get authForgotPassword => 'Wachtwoord vergeten?';

  @override
  String get authSignIn => 'Inloggen';

  @override
  String get authSignOut => 'Uitloggen';

  @override
  String get authContinueGoogle => 'Doorgaan met Google';

  @override
  String get authContinueApple => 'Doorgaan met Apple';

  @override
  String get authCreateAccount => 'Account aanmaken';

  @override
  String get authCreateAccountTitle => 'Account aanmaken';

  @override
  String get authSignUpSubtitle =>
      'Word lid van Terrava om plekken op te slaan en je volgende buurt te plannen.';

  @override
  String get authDisplayName => 'Weergavenaam';

  @override
  String get authSignUp => 'Registreren';

  @override
  String get authAccountCreated =>
      'Account aangemaakt. Je kunt beginnen met verkennen.';

  @override
  String get authAlreadyHaveAccount => 'Heb je al een account? Inloggen';

  @override
  String get authResetPasswordTitle => 'Wachtwoord resetten';

  @override
  String get authResetPasswordSubtitle =>
      'Voer je e-mail in en we sturen een resetlink.';

  @override
  String get authSendResetLink => 'Resetlink versturen';

  @override
  String get authBackToSignIn => 'Terug naar inloggen';

  @override
  String get validationInvalidEmail => 'Voer een geldig e-mailadres in';

  @override
  String get validationPasswordMinLength => 'Min. 6 tekens';

  @override
  String get onboardingDiscoverTitle => 'Ontdek elke plek';

  @override
  String get onboardingDiscoverBody =>
      'Zoek steden, straten, bezienswaardigheden of coördinaten en zie hoe het leven eromheen is.';

  @override
  String get onboardingNearbyTitle => 'Weet wat er in de buurt is';

  @override
  String get onboardingNearbyBody =>
      'Restaurants, ziekenhuizen, scholen, banken, markten en essentials — georganiseerd voor echte beslissingen.';

  @override
  String get onboardingPlanTitle => 'Plan met duidelijkheid';

  @override
  String get onboardingPlanBody =>
      'Sla buurten op, vergelijk gebieden en ga met vertrouwen verder — voordat je bezoekt of verhuist.';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingGetStarted => 'Aan de slag';

  @override
  String get homeTagline => 'Ontdek wat er rond elke buurt is';

  @override
  String get homeSearchHint => 'Zoek stad, gebied, bezienswaardigheid…';

  @override
  String get homeCategoriesTitle => 'Categorieën';

  @override
  String get homeCategoriesSubtitle => 'Essentials om je heen';

  @override
  String get homeNearbyTitle => 'In de buurt';

  @override
  String get homeNearbySubtitle => 'Dicht bij jou';

  @override
  String get homeNoNearbyTitle => 'Nog geen plekken in de buurt';

  @override
  String get homeNoNearbyMessage => 'Sta locatie toe of probeer Zoeken.';

  @override
  String get homeRecentlyViewedTitle => 'Recent bekeken';

  @override
  String get homeRecentlyViewedSubtitle => 'Uit je accountactiviteit';

  @override
  String get homeNoRecentViews => 'Plekken die je opent verschijnen hier.';

  @override
  String get homePopularNearbyTitle => 'Populair in de buurt';

  @override
  String get homePopularNearbySubtitle => 'Hoog gewaardeerd om je heen';

  @override
  String get locationPermissionNeeded =>
      'Locatietoestemming nodig voor plekken in de buurt';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Je huidige locatie wordt gebruikt';

  @override
  String get locationReadError => 'Locatie kan niet worden gelezen';

  @override
  String get locationNeighborhood => 'Buurt';

  @override
  String get locationSaveArea => 'Gebied opslaan';

  @override
  String get locationAreaSaved => 'Gebied opgeslagen';

  @override
  String get locationNoRadiusResults => 'Geen resultaten in deze straal';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Inzichten niet beschikbaar: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Voorzieningenscore $score/100';
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
    return '$temp°C · $condition · gevoel $feelsLike°C · luchtvochtigheid $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Wisselkoers: 1 $base = $rate $target';
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
    return '$area scoort $overall/100 voor dagelijkse gemakkelijkheid (toegang tot voorzieningen — geen criminaliteit of officiële leefbaarheid). Sterkst: $strongest. Zwakst: $weakest. Binnen $radius km: $essentials boodschappen/apotheek-opties, $health gezondheidsgerelateerde plekken, $food eetgelegenheden, $transport vervoersgerelateerde plekken.';
  }

  @override
  String get scoreEssentials => 'Essentials';

  @override
  String get scoreHealth => 'Gezondheid';

  @override
  String get scoreFood => 'Eten';

  @override
  String get scoreTransport => 'Vervoer';

  @override
  String get scoreMoney => 'Banken & geldautomaten';

  @override
  String get scoreEducation => 'Onderwijs';

  @override
  String get scoreFuel => 'Brandstof';

  @override
  String get categoryRestaurants => 'Restaurants';

  @override
  String get categoryHotels => 'Hotels';

  @override
  String get categoryHospitals => 'Ziekenhuizen';

  @override
  String get categoryBanks => 'Banken';

  @override
  String get categoryPharmacies => 'Apotheken';

  @override
  String get categorySchools => 'Scholen';

  @override
  String get categorySupermarkets => 'Supermarkten';

  @override
  String get categoryMarkets => 'Markten';

  @override
  String get categoryFuel => 'Brandstof';

  @override
  String get categoryNoResultsTitle => 'Geen resultaten';

  @override
  String get categoryNoResultsMessage =>
      'Probeer een andere categorie of verplaats de kaart.';

  @override
  String mapClusterPlaces(int count) {
    return '$count plekken';
  }

  @override
  String get mapTapToZoom => 'Tik om te zoomen';

  @override
  String get mapSearchArea => 'Zoek in dit gebied';

  @override
  String get mapMyLocation => 'Mijn locatie';

  @override
  String get savedTitle => 'Opgeslagen';

  @override
  String get savedSubtitle =>
      'Plekken, buurten en collecties gesynchroniseerd met je account.';

  @override
  String get savedCollectionsTitle => 'Collecties';

  @override
  String get savedNewCollection => 'Nieuw';

  @override
  String get savedNoCollections => 'Nog geen collecties.';

  @override
  String get savedNeighborhoodsTitle => 'Buurten';

  @override
  String get savedNoAreas => 'Nog geen opgeslagen gebieden.';

  @override
  String get savedPlacesTitle => 'Plekken';

  @override
  String get savedNoPlacesTitle => 'Geen opgeslagen plekken';

  @override
  String get savedNoPlacesMessage =>
      'Sla restaurants, hotels en meer op vanuit details.';

  @override
  String get collectionFallbackName => 'Collectie';

  @override
  String get collectionNewTitle => 'Nieuwe collectie';

  @override
  String get collectionNameHint => 'Naam';

  @override
  String get collectionDeleteTooltip => 'Collectie verwijderen';

  @override
  String get collectionEmptyTitle => 'Lege collectie';

  @override
  String get collectionEmptyMessage =>
      'Voeg plekken toe via Plekdetails → Opslaan in collectie.';

  @override
  String get collectionSavedArea => 'Opgeslagen gebied';

  @override
  String get collectionCreateFirst => 'Maak eerst een collectie in Opgeslagen';

  @override
  String get collectionAdded => 'Toegevoegd aan collectie';

  @override
  String get areaFallbackName => 'Gebied';

  @override
  String get placeFallbackName => 'Plek';

  @override
  String get placeOpenNow => 'Nu open';

  @override
  String get placeClosed => 'Gesloten';

  @override
  String get placeSaved => 'Plek opgeslagen';

  @override
  String get placeCollection => 'Collectie';

  @override
  String get placeCall => 'Bellen';

  @override
  String get placeWebsite => 'Website';

  @override
  String get placeHours => 'Openingstijden';

  @override
  String get placeReviews => 'Beoordelingen';

  @override
  String get profileTitle => 'Profiel';

  @override
  String get profileFallbackName => 'Reiziger';

  @override
  String get profileChangePhoto => 'Foto wijzigen';

  @override
  String get profileSettingsSubtitle => 'Eenheden, taal, meldingen, juridisch';

  @override
  String get profilePhotoUpdated => 'Profielfoto bijgewerkt';

  @override
  String get searchTitle => 'Zoeken';

  @override
  String get searchHint => 'Land, stad, straat, bezienswaardigheid, lat,lng';

  @override
  String get searchNoResults => 'Geen resultaten voor die zoekopdracht';

  @override
  String get searchVoiceTooltip => 'Spraakzoeken';

  @override
  String get searchVoiceDisabledTooltip => 'Spraakzoeken (inschakelen in .env)';

  @override
  String get searchVoiceUnavailable => 'Microfoon / spraak niet beschikbaar';

  @override
  String get searchVoiceEnableInstruction =>
      'Stel ENABLE_VOICE_SEARCH=true in .env in om in te schakelen';

  @override
  String get searchRecentTitle => 'Recente zoekopdrachten';

  @override
  String get searchNoRecent => 'Nog geen recente zoekopdrachten.';

  @override
  String get searchPopularTitle => 'Populaire zoekopdrachten';

  @override
  String get searchNoPopular =>
      'Populaire zoekopdrachten verschijnen door echt gebruik.';

  @override
  String get searchNoSuggestionsTitle => 'Geen suggesties';

  @override
  String get searchNoSuggestionsMessage =>
      'Probeer een stad, bezienswaardigheid of coördinaten.';

  @override
  String get directionsLocationRequired => 'Huidige locatie vereist voor route';

  @override
  String get directionsNoRoute => 'Geen route gevonden';

  @override
  String get directionsOriginYou => 'Jij';

  @override
  String get directionsDestination => 'Bestemming';

  @override
  String get aboutTitle => 'Over';

  @override
  String get aboutDefaultDescription =>
      'Terrava helpt iedereen elke buurt te begrijpen voordat je er naartoe gaat, naartoe verhuist of er woont.';

  @override
  String aboutVersion(String version) {
    return 'Versie $version';
  }

  @override
  String get helpTitle => 'Help';

  @override
  String get helpHowItWorksTitle => 'Hoe Terrava werkt';

  @override
  String get helpHowItWorksBody =>
      'Zoek elke plek op aarde, verken essentials in de buurt op de kaart, open buurtdetails voor voorzieningenscores en sla plekken op in je account.';

  @override
  String get helpScoresTitle => 'Buurtscores';

  @override
  String get helpScoresBody =>
      'Scores zijn schattingen van gemak/voorzieningen op basis van Google Places-dichtheid, beoordelingen en afstand. Het zijn geen criminaliteits-, schoolkwaliteits- of officiële leefbaarheidsscores.';

  @override
  String get privacyBody =>
      'Terrava bewaart je accountprofiel, opgeslagen plekken, zoekgeschiedenis en optionele push-tokens in Supabase met beveiliging op rijniveau. Locatie wordt op het apparaat gebruikt om plekken in de buurt via Google-API\'s op te halen. We verkopen geen persoonlijke gegevens. Neem contact op met support voor verwijderingsverzoeken.';

  @override
  String get termsBody =>
      'Terrava biedt tools voor buurtontdekking ter informatie. Voorzieningenscores zijn schattingen, geen garanties voor veiligheid of leefbaarheid. Kaart- en plaatsgegevens van derden kunnen onvolledig of verouderd zijn. Gebruik de app in overeenstemming met toepasselijke wetten en de voorwaarden van Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Er is iets misgegaan';

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
