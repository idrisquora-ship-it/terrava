// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Comprenez n\'importe quel quartier';

  @override
  String get navHome => 'Accueil';

  @override
  String get navExplore => 'Explorer';

  @override
  String get navSaved => 'Enregistrés';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonCreate => 'Créer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get commonTryAgain => 'Réessayer';

  @override
  String get commonDirections => 'Itinéraire';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonShare => 'Partager';

  @override
  String get commonSeeAll => 'Tout voir';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get unitsMetric => 'Métrique (km)';

  @override
  String get unitsImperial => 'Impérial (mi)';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsUnits => 'Unités';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsCurrency => 'Devise';

  @override
  String get settingsAboutTerrava => 'À propos de Terrava';

  @override
  String get settingsHelp => 'Aide';

  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get settingsTermsOfService => 'Conditions d\'utilisation';

  @override
  String get notificationsPushTitle => 'Notifications push';

  @override
  String get notificationsPushSubtitle =>
      'Lieux enregistrés, conseils et alertes de compte via Firebase';

  @override
  String get notificationsEnabledTitle => 'Notifications activ?es';

  @override
  String get notificationsEnabledBody =>
      'Terrava peut vous alerter au sujet des lieux enregistr?s et des mises ? jour de compte.';

  @override
  String get notificationsPlaceSavedTitle => 'Enregistr? dans Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName est dans votre liste. Ouvrez Enregistr?s ? tout moment pour le retrouver.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Quartier enregistr?';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName est pr?t lorsque vous voudrez comparer ? nouveau les scores.';
  }

  @override
  String get notificationsWelcomeTitle => 'Bienvenue sur Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Explorez les quartiers, enregistrez des lieux et consultez les scores ? proximit?.';

  @override
  String get notificationsGenericUpdate => 'Vous avez une nouvelle mise ? jour';

  @override
  String get accountDelete => 'Supprimer le compte';

  @override
  String get accountDeleteQuestion => 'Supprimer le compte ?';

  @override
  String get accountDeleteWarning =>
      'Cela supprime définitivement votre compte Terrava et vos données enregistrées.';

  @override
  String get authWelcomeBack => 'Bon retour';

  @override
  String get authSignInSubtitle =>
      'Connectez-vous pour enregistrer des quartiers et continuer à explorer.';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authPassword => 'Mot de passe';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authSignIn => 'Se connecter';

  @override
  String get authSignOut => 'Se déconnecter';

  @override
  String get authContinueGoogle => 'Continuer avec Google';

  @override
  String get authContinueApple => 'Continuer avec Apple';

  @override
  String get authCreateAccount => 'Créer un compte';

  @override
  String get authCreateAccountTitle => 'Créer un compte';

  @override
  String get authSignUpSubtitle =>
      'Rejoignez Terrava pour enregistrer des lieux et planifier votre prochain quartier.';

  @override
  String get authDisplayName => 'Nom d\'affichage';

  @override
  String get authSignUp => 'S\'inscrire';

  @override
  String get authAccountCreated =>
      'Compte créé. Vous pouvez commencer à explorer.';

  @override
  String get authAlreadyHaveAccount =>
      'Vous avez déjà un compte ? Se connecter';

  @override
  String get authResetPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get authResetPasswordSubtitle =>
      'Entrez votre e-mail et nous vous enverrons un lien de réinitialisation.';

  @override
  String get authSendResetLink => 'Envoyer le lien';

  @override
  String get authBackToSignIn => 'Retour à la connexion';

  @override
  String get validationInvalidEmail => 'Entrez une adresse e-mail valide';

  @override
  String get validationPasswordMinLength => 'Minimum 6 caractères';

  @override
  String get onboardingDiscoverTitle => 'Découvrez n\'importe quel lieu';

  @override
  String get onboardingDiscoverBody =>
      'Recherchez des villes, rues, monuments ou coordonnées et voyez à quoi ressemble la vie autour.';

  @override
  String get onboardingNearbyTitle => 'Sachez ce qu\'il y a à proximité';

  @override
  String get onboardingNearbyBody =>
      'Restaurants, hôpitaux, écoles, banques, marchés et essentiels — organisés pour de vraies décisions.';

  @override
  String get onboardingPlanTitle => 'Planifiez en toute clarté';

  @override
  String get onboardingPlanBody =>
      'Enregistrez des quartiers, comparez des zones et avancez en confiance — avant de visiter ou de déménager.';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get homeTagline =>
      'Découvrez ce qui se trouve autour de n\'importe quel quartier';

  @override
  String get homeSearchHint => 'Rechercher une ville, un quartier, un lieu…';

  @override
  String get homeCategoriesTitle => 'Catégories';

  @override
  String get homeCategoriesSubtitle => 'Essentiels autour de vous';

  @override
  String get homeNearbyTitle => 'À proximité';

  @override
  String get homeNearbySubtitle => 'Près de vous';

  @override
  String get homeNoNearbyTitle => 'Aucun lieu à proximité pour le moment';

  @override
  String get homeNoNearbyMessage =>
      'Autorisez la localisation ou essayez la recherche.';

  @override
  String get homeRecentlyViewedTitle => 'Consultés récemment';

  @override
  String get homeRecentlyViewedSubtitle =>
      'D\'après l\'activité de votre compte';

  @override
  String get homeNoRecentViews => 'Les lieux que vous ouvrez apparaîtront ici.';

  @override
  String get homePopularNearbyTitle => 'Populaires à proximité';

  @override
  String get homePopularNearbySubtitle => 'Très bien notés autour de vous';

  @override
  String get locationPermissionNeeded =>
      'Autorisation de localisation nécessaire pour les lieux à proximité';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Utilisation de votre position actuelle';

  @override
  String get locationReadError => 'Impossible de lire la position';

  @override
  String get locationNeighborhood => 'Quartier';

  @override
  String get locationSaveArea => 'Enregistrer la zone';

  @override
  String get locationAreaSaved => 'Zone enregistrée';

  @override
  String get locationNoRadiusResults => 'Aucun résultat dans ce rayon';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Analyses indisponibles : $error';
  }

  @override
  String amenityScore(int score) {
    return 'Score des équipements $score/100';
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
    return '$temp°C · $condition · ressenti $feelsLike°C · humidité $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Change : 1 $base = $rate $target';
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
    return '$area obtient $overall/100 pour le confort du quotidien (accès aux équipements — pas la criminalité ni l\'habitabilité officielle). Plus fort : $strongest. Plus faible : $weakest. Dans un rayon de $radius km : $essentials options d\'épicerie/pharmacie, $health lieux liés à la santé, $food restaurants, $transport lieux liés aux transports.';
  }

  @override
  String get scoreEssentials => 'Essentiels';

  @override
  String get scoreHealth => 'Santé';

  @override
  String get scoreFood => 'Alimentation';

  @override
  String get scoreTransport => 'Transports';

  @override
  String get scoreMoney => 'Banques et distributeurs';

  @override
  String get scoreEducation => 'Éducation';

  @override
  String get scoreFuel => 'Carburant';

  @override
  String get categoryRestaurants => 'Restaurants';

  @override
  String get categoryHotels => 'Hôtels';

  @override
  String get categoryHospitals => 'Hôpitaux';

  @override
  String get categoryBanks => 'Banques';

  @override
  String get categoryPharmacies => 'Pharmacies';

  @override
  String get categorySchools => 'Écoles';

  @override
  String get categorySupermarkets => 'Supermarchés';

  @override
  String get categoryMarkets => 'Marchés';

  @override
  String get categoryFuel => 'Carburant';

  @override
  String get categoryNoResultsTitle => 'Aucun résultat';

  @override
  String get categoryNoResultsMessage =>
      'Essayez une autre catégorie ou déplacez la carte.';

  @override
  String mapClusterPlaces(int count) {
    return '$count lieux';
  }

  @override
  String get mapTapToZoom => 'Appuyez pour zoomer';

  @override
  String get mapSearchArea => 'Rechercher dans cette zone';

  @override
  String get mapMyLocation => 'Ma position';

  @override
  String get savedTitle => 'Enregistrés';

  @override
  String get savedSubtitle =>
      'Lieux, quartiers et collections synchronisés avec votre compte.';

  @override
  String get savedCollectionsTitle => 'Collections';

  @override
  String get savedNewCollection => 'Nouveau';

  @override
  String get savedNoCollections => 'Aucune collection pour le moment.';

  @override
  String get savedNeighborhoodsTitle => 'Quartiers';

  @override
  String get savedNoAreas => 'Aucune zone enregistrée pour le moment.';

  @override
  String get savedPlacesTitle => 'Lieux';

  @override
  String get savedNoPlacesTitle => 'Aucun lieu enregistré';

  @override
  String get savedNoPlacesMessage =>
      'Enregistrez restaurants, hôtels et plus depuis les détails.';

  @override
  String get collectionFallbackName => 'Collection';

  @override
  String get collectionNewTitle => 'Nouvelle collection';

  @override
  String get collectionNameHint => 'Nom';

  @override
  String get collectionDeleteTooltip => 'Supprimer la collection';

  @override
  String get collectionEmptyTitle => 'Collection vide';

  @override
  String get collectionEmptyMessage =>
      'Ajoutez des lieux depuis Détails du lieu → Enregistrer dans une collection.';

  @override
  String get collectionSavedArea => 'Zone enregistrée';

  @override
  String get collectionCreateFirst =>
      'Créez d\'abord une collection dans Enregistrés';

  @override
  String get collectionAdded => 'Ajouté à la collection';

  @override
  String get areaFallbackName => 'Zone';

  @override
  String get placeFallbackName => 'Lieu';

  @override
  String get placeOpenNow => 'Ouvert maintenant';

  @override
  String get placeClosed => 'Fermé';

  @override
  String get placeSaved => 'Lieu enregistré';

  @override
  String get placeCollection => 'Collection';

  @override
  String get placeCall => 'Appeler';

  @override
  String get placeWebsite => 'Site web';

  @override
  String get placeHours => 'Horaires';

  @override
  String get placeReviews => 'Avis';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileFallbackName => 'Voyageur';

  @override
  String get profileChangePhoto => 'Changer la photo';

  @override
  String get profileSettingsSubtitle =>
      'Unités, langue, notifications, mentions légales';

  @override
  String get profilePhotoUpdated => 'Photo de profil mise à jour';

  @override
  String get searchTitle => 'Recherche';

  @override
  String get searchHint => 'Pays, ville, rue, monument, lat,lng';

  @override
  String get searchNoResults => 'Aucun résultat pour cette recherche';

  @override
  String get searchVoiceTooltip => 'Recherche vocale';

  @override
  String get searchVoiceDisabledTooltip =>
      'Recherche vocale (activer dans .env)';

  @override
  String get searchVoiceUnavailable =>
      'Micro / reconnaissance vocale indisponible';

  @override
  String get searchVoiceEnableInstruction =>
      'Définissez ENABLE_VOICE_SEARCH=true dans .env pour activer';

  @override
  String get searchRecentTitle => 'Recherches récentes';

  @override
  String get searchNoRecent => 'Aucune recherche récente pour le moment.';

  @override
  String get searchPopularTitle => 'Recherches populaires';

  @override
  String get searchNoPopular =>
      'Les recherches populaires apparaîtront d\'après l\'usage réel.';

  @override
  String get searchNoSuggestionsTitle => 'Aucune suggestion';

  @override
  String get searchNoSuggestionsMessage =>
      'Essayez une ville, un monument ou des coordonnées.';

  @override
  String get directionsLocationRequired =>
      'Position actuelle requise pour l\'itinéraire';

  @override
  String get directionsNoRoute => 'Aucun itinéraire trouvé';

  @override
  String get directionsOriginYou => 'Vous';

  @override
  String get directionsDestination => 'Destination';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get aboutDefaultDescription =>
      'Terrava aide chacun à comprendre n\'importe quel quartier avant de le visiter, d\'y déménager ou d\'y vivre.';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get helpTitle => 'Aide';

  @override
  String get helpHowItWorksTitle => 'Comment fonctionne Terrava';

  @override
  String get helpHowItWorksBody =>
      'Recherchez n\'importe quel lieu sur Terre, explorez les essentiels à proximité sur la carte, ouvrez les détails du quartier pour les scores d\'équipements, et enregistrez des lieux sur votre compte.';

  @override
  String get helpScoresTitle => 'Scores de quartier';

  @override
  String get helpScoresBody =>
      'Les scores sont des estimations de confort/équipements basées sur la densité Google Places, les notes et la distance. Ce ne sont pas des indicateurs de criminalité, de qualité scolaire ou d\'habitabilité officielle.';

  @override
  String get privacyBody =>
      'Terrava stocke votre profil de compte, vos lieux enregistrés, l\'historique de recherche et les jetons push facultatifs dans Supabase avec une sécurité au niveau des lignes. La localisation est utilisée sur l\'appareil pour récupérer les lieux à proximité via les API Google. Nous ne vendons pas de données personnelles. Contactez le support pour les demandes de suppression.';

  @override
  String get termsBody =>
      'Terrava fournit des outils de découverte de quartiers à titre informatif. Les scores d\'équipements sont des estimations, pas des garanties de sécurité ou de qualité de vie. Les données cartographiques et de lieux de tiers peuvent être incomplètes ou obsolètes. Utilisez l\'application conformément aux lois applicables et aux conditions Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Une erreur s\'est produite';

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
