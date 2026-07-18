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
}
