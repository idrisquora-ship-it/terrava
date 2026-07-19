// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Comprendi qualsiasi quartiere';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Esplora';

  @override
  String get navSaved => 'Salvati';

  @override
  String get navProfile => 'Profilo';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonCreate => 'Crea';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonContinue => 'Continua';

  @override
  String get commonTryAgain => 'Riprova';

  @override
  String get commonDirections => 'Indicazioni';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonShare => 'Condividi';

  @override
  String get commonSeeAll => 'Vedi tutto';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get unitsMetric => 'Metrico (km)';

  @override
  String get unitsImperial => 'Imperiale (mi)';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsAppearance => 'Aspetto';

  @override
  String get settingsUnits => 'Unità';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsCurrency => 'Valuta';

  @override
  String get settingsAboutTerrava => 'Informazioni su Terrava';

  @override
  String get settingsHelp => 'Aiuto';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get settingsTermsOfService => 'Termini di servizio';

  @override
  String get notificationsPushTitle => 'Notifiche push';

  @override
  String get notificationsPushSubtitle =>
      'Luoghi salvati, consigli e avvisi account tramite Firebase';

  @override
  String get notificationsEnabledTitle => 'Notifiche attive';

  @override
  String get notificationsEnabledBody =>
      'Terrava pu? avvisarti sui luoghi salvati e sugli aggiornamenti dell\'account.';

  @override
  String get notificationsPlaceSavedTitle => 'Salvato in Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ? nella tua lista. Apri Salvati quando vuoi per ritrovarlo.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Quartiere salvato';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ? pronto quando vorrai confrontare di nuovo i punteggi.';
  }

  @override
  String get notificationsWelcomeTitle => 'Benvenuto su Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Esplora quartieri, salva luoghi e ricevi insight sui punteggi nelle vicinanze.';

  @override
  String get notificationsGenericUpdate => 'Hai un nuovo aggiornamento';

  @override
  String get accountDelete => 'Elimina account';

  @override
  String get accountDeleteQuestion => 'Eliminare l\'account?';

  @override
  String get accountDeleteWarning =>
      'Questo elimina definitivamente il tuo account Terrava e i dati salvati.';

  @override
  String get authWelcomeBack => 'Bentornato';

  @override
  String get authSignInSubtitle =>
      'Accedi per salvare quartieri e continuare a esplorare.';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authForgotPassword => 'Password dimenticata?';

  @override
  String get authSignIn => 'Accedi';

  @override
  String get authSignOut => 'Esci';

  @override
  String get authContinueGoogle => 'Continua con Google';

  @override
  String get authContinueApple => 'Continua con Apple';

  @override
  String get authCreateAccount => 'Crea un account';

  @override
  String get authCreateAccountTitle => 'Crea account';

  @override
  String get authSignUpSubtitle =>
      'Unisciti a Terrava per salvare luoghi e pianificare il tuo prossimo quartiere.';

  @override
  String get authDisplayName => 'Nome visualizzato';

  @override
  String get authSignUp => 'Registrati';

  @override
  String get authAccountCreated => 'Account creato. Puoi iniziare a esplorare.';

  @override
  String get authAlreadyHaveAccount => 'Hai già un account? Accedi';

  @override
  String get authResetPasswordTitle => 'Reimposta password';

  @override
  String get authResetPasswordSubtitle =>
      'Inserisci la tua email e ti invieremo un link di reimpostazione.';

  @override
  String get authSendResetLink => 'Invia link di reimpostazione';

  @override
  String get authBackToSignIn => 'Torna all\'accesso';

  @override
  String get validationInvalidEmail => 'Inserisci un\'email valida';

  @override
  String get validationPasswordMinLength => 'Minimo 6 caratteri';

  @override
  String get onboardingDiscoverTitle => 'Scopri qualsiasi luogo';

  @override
  String get onboardingDiscoverBody =>
      'Cerca città, strade, monumenti o coordinate e vedi com\'è la vita intorno a loro.';

  @override
  String get onboardingNearbyTitle => 'Sai cosa c\'è vicino';

  @override
  String get onboardingNearbyBody =>
      'Ristoranti, ospedali, scuole, banche, mercati e l\'essenziale — organizzati per decisioni reali.';

  @override
  String get onboardingPlanTitle => 'Pianifica con chiarezza';

  @override
  String get onboardingPlanBody =>
      'Salva quartieri, confronta aree e muoviti con fiducia — prima di visitare o trasferirti.';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get homeTagline => 'Scopri cosa c\'è intorno a qualsiasi quartiere';

  @override
  String get homeSearchHint => 'Cerca città, zona, monumento…';

  @override
  String get homeCategoriesTitle => 'Categorie';

  @override
  String get homeCategoriesSubtitle => 'L\'essenziale intorno a te';

  @override
  String get homeNearbyTitle => 'Vicino';

  @override
  String get homeNearbySubtitle => 'Vicino a te';

  @override
  String get homeNoNearbyTitle => 'Nessun luogo vicino ancora';

  @override
  String get homeNoNearbyMessage => 'Consenti la posizione o prova Cerca.';

  @override
  String get homeRecentlyViewedTitle => 'Visti di recente';

  @override
  String get homeRecentlyViewedSubtitle => 'Dall\'attività del tuo account';

  @override
  String get homeNoRecentViews => 'I luoghi che apri appariranno qui.';

  @override
  String get homePopularNearbyTitle => 'Popolari nelle vicinanze';

  @override
  String get homePopularNearbySubtitle => 'Ben valutati intorno a te';

  @override
  String get locationPermissionNeeded =>
      'Autorizzazione posizione necessaria per i luoghi vicini';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Utilizzo della posizione attuale';

  @override
  String get locationReadError => 'Impossibile leggere la posizione';

  @override
  String get locationNeighborhood => 'Quartiere';

  @override
  String get locationSaveArea => 'Salva area';

  @override
  String get locationAreaSaved => 'Area salvata';

  @override
  String get locationNoRadiusResults => 'Nessun risultato in questo raggio';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Approfondimenti non disponibili: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Punteggio servizi $score/100';
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
    return '$temp°C · $condition · percepiti $feelsLike°C · umidità $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Cambio: 1 $base = $rate $target';
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
    return '$area ottiene $overall/100 per la comodità quotidiana (accesso ai servizi — non criminalità o vivibilità ufficiale). Più forte: $strongest. Più debole: $weakest. Entro $radius km: $essentials opzioni alimentari/farmacia, $health luoghi legati alla salute, $food luoghi di cibo, $transport luoghi legati ai trasporti.';
  }

  @override
  String get scoreEssentials => 'Essenziali';

  @override
  String get scoreHealth => 'Salute';

  @override
  String get scoreFood => 'Cibo';

  @override
  String get scoreTransport => 'Trasporti';

  @override
  String get scoreMoney => 'Banche e bancomat';

  @override
  String get scoreEducation => 'Istruzione';

  @override
  String get scoreFuel => 'Carburante';

  @override
  String get categoryRestaurants => 'Ristoranti';

  @override
  String get categoryHotels => 'Hotel';

  @override
  String get categoryHospitals => 'Ospedali';

  @override
  String get categoryBanks => 'Banche';

  @override
  String get categoryPharmacies => 'Farmacie';

  @override
  String get categorySchools => 'Scuole';

  @override
  String get categorySupermarkets => 'Supermercati';

  @override
  String get categoryMarkets => 'Mercati';

  @override
  String get categoryFuel => 'Carburante';

  @override
  String get categoryNoResultsTitle => 'Nessun risultato';

  @override
  String get categoryNoResultsMessage =>
      'Prova un\'altra categoria o sposta la mappa.';

  @override
  String mapClusterPlaces(int count) {
    return '$count luoghi';
  }

  @override
  String get mapTapToZoom => 'Tocca per ingrandire';

  @override
  String get mapSearchArea => 'Cerca in quest\'area';

  @override
  String get mapMyLocation => 'La mia posizione';

  @override
  String get savedTitle => 'Salvati';

  @override
  String get savedSubtitle =>
      'Luoghi, quartieri e raccolte sincronizzati con il tuo account.';

  @override
  String get savedCollectionsTitle => 'Raccolte';

  @override
  String get savedNewCollection => 'Nuova';

  @override
  String get savedNoCollections => 'Nessuna raccolta ancora.';

  @override
  String get savedNeighborhoodsTitle => 'Quartieri';

  @override
  String get savedNoAreas => 'Nessuna area salvata ancora.';

  @override
  String get savedPlacesTitle => 'Luoghi';

  @override
  String get savedNoPlacesTitle => 'Nessun luogo salvato';

  @override
  String get savedNoPlacesMessage =>
      'Salva ristoranti, hotel e altro dai dettagli.';

  @override
  String get collectionFallbackName => 'Raccolta';

  @override
  String get collectionNewTitle => 'Nuova raccolta';

  @override
  String get collectionNameHint => 'Nome';

  @override
  String get collectionDeleteTooltip => 'Elimina raccolta';

  @override
  String get collectionEmptyTitle => 'Raccolta vuota';

  @override
  String get collectionEmptyMessage =>
      'Aggiungi luoghi da Dettagli luogo → Salva nella raccolta.';

  @override
  String get collectionSavedArea => 'Area salvata';

  @override
  String get collectionCreateFirst => 'Crea prima una raccolta in Salvati';

  @override
  String get collectionAdded => 'Aggiunto alla raccolta';

  @override
  String get areaFallbackName => 'Area';

  @override
  String get placeFallbackName => 'Luogo';

  @override
  String get placeOpenNow => 'Aperto ora';

  @override
  String get placeClosed => 'Chiuso';

  @override
  String get placeSaved => 'Luogo salvato';

  @override
  String get placeCollection => 'Raccolta';

  @override
  String get placeCall => 'Chiama';

  @override
  String get placeWebsite => 'Sito web';

  @override
  String get placeHours => 'Orari';

  @override
  String get placeReviews => 'Recensioni';

  @override
  String get profileTitle => 'Profilo';

  @override
  String get profileFallbackName => 'Viaggiatore';

  @override
  String get profileChangePhoto => 'Cambia foto';

  @override
  String get profileSettingsSubtitle => 'Unità, lingua, notifiche, legale';

  @override
  String get profilePhotoUpdated => 'Foto del profilo aggiornata';

  @override
  String get searchTitle => 'Cerca';

  @override
  String get searchHint => 'Paese, città, strada, monumento, lat,lng';

  @override
  String get searchNoResults => 'Nessun risultato per questa ricerca';

  @override
  String get searchVoiceTooltip => 'Ricerca vocale';

  @override
  String get searchVoiceDisabledTooltip => 'Ricerca vocale (abilita in .env)';

  @override
  String get searchVoiceUnavailable => 'Microfono / voce non disponibile';

  @override
  String get searchVoiceEnableInstruction =>
      'Imposta ENABLE_VOICE_SEARCH=true in .env per abilitare';

  @override
  String get searchRecentTitle => 'Ricerche recenti';

  @override
  String get searchNoRecent => 'Nessuna ricerca recente ancora.';

  @override
  String get searchPopularTitle => 'Ricerche popolari';

  @override
  String get searchNoPopular =>
      'Le ricerche popolari appariranno dall\'uso reale.';

  @override
  String get searchNoSuggestionsTitle => 'Nessun suggerimento';

  @override
  String get searchNoSuggestionsMessage =>
      'Prova una città, un monumento o coordinate.';

  @override
  String get directionsLocationRequired =>
      'Posizione attuale richiesta per le indicazioni';

  @override
  String get directionsNoRoute => 'Nessun percorso trovato';

  @override
  String get directionsOriginYou => 'Tu';

  @override
  String get directionsDestination => 'Destinazione';

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String get aboutDefaultDescription =>
      'Terrava aiuta chiunque a capire qualsiasi quartiere prima di visitarlo, trasferirsi o viverci.';

  @override
  String aboutVersion(String version) {
    return 'Versione $version';
  }

  @override
  String get helpTitle => 'Aiuto';

  @override
  String get helpHowItWorksTitle => 'Come funziona Terrava';

  @override
  String get helpHowItWorksBody =>
      'Cerca qualsiasi luogo sulla Terra, esplora l\'essenziale nelle vicinanze sulla mappa, apri i dettagli del quartiere per i punteggi dei servizi e salva i luoghi nel tuo account.';

  @override
  String get helpScoresTitle => 'Punteggi del quartiere';

  @override
  String get helpScoresBody =>
      'I punteggi sono stime di comodità/servizi dalla densità di Google Places, valutazioni e distanza. Non sono indicatori di criminalità, qualità scolastica o vivibilità ufficiale.';

  @override
  String get privacyBody =>
      'Terrava memorizza il profilo dell\'account, i luoghi salvati, la cronologia delle ricerche e i token push opzionali in Supabase con sicurezza a livello di riga. La posizione viene usata sul dispositivo per recuperare i luoghi vicini dalle API Google. Non vendiamo dati personali. Contatta l\'assistenza per le richieste di eliminazione.';

  @override
  String get termsBody =>
      'Terrava fornisce strumenti di scoperta dei quartieri a scopo informativo. I punteggi dei servizi sono stime, non garanzie di sicurezza o vivibilità. I dati di mappe e luoghi di terze parti possono essere incompleti o non aggiornati. Usa l\'app in conformità alle leggi applicabili e ai termini di Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Qualcosa è andato storto';

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
