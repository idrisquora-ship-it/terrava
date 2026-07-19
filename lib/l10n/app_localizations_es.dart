// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Entiende cualquier barrio';

  @override
  String get navHome => 'Inicio';

  @override
  String get navExplore => 'Explorar';

  @override
  String get navSaved => 'Guardados';

  @override
  String get navProfile => 'Perfil';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCreate => 'Crear';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonTryAgain => 'Reintentar';

  @override
  String get commonDirections => 'Indicaciones';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonShare => 'Compartir';

  @override
  String get commonSeeAll => 'Ver todo';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get unitsMetric => 'Métrico (km)';

  @override
  String get unitsImperial => 'Imperial (mi)';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsUnits => 'Unidades';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsCurrency => 'Moneda';

  @override
  String get settingsAboutTerrava => 'Acerca de Terrava';

  @override
  String get settingsHelp => 'Ayuda';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidad';

  @override
  String get settingsTermsOfService => 'Términos de servicio';

  @override
  String get notificationsPushTitle => 'Notificaciones push';

  @override
  String get notificationsPushSubtitle =>
      'Lugares guardados, consejos y alertas de cuenta vía Firebase';

  @override
  String get notificationsEnabledTitle => 'Notificaciones activadas';

  @override
  String get notificationsEnabledBody =>
      'Terrava puede avisarte sobre lugares guardados y actualizaciones de la cuenta.';

  @override
  String get notificationsPlaceSavedTitle => 'Guardado en Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName est? en tu lista. Abre Guardados cuando quieras para volver a verlo.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Barrio guardado';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName estar? listo cuando quieras comparar puntuaciones de nuevo.';
  }

  @override
  String get notificationsWelcomeTitle => 'Bienvenido a Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Explora barrios, guarda lugares y consulta puntuaciones cercanas.';

  @override
  String get notificationsGenericUpdate => 'Tienes una nueva actualizaci?n';

  @override
  String get accountDelete => 'Eliminar cuenta';

  @override
  String get accountDeleteQuestion => '¿Eliminar cuenta?';

  @override
  String get accountDeleteWarning =>
      'Esto elimina permanentemente tu cuenta de Terrava y los datos guardados.';

  @override
  String get authWelcomeBack => 'Bienvenido de nuevo';

  @override
  String get authSignInSubtitle =>
      'Inicia sesión para guardar barrios y seguir explorando.';

  @override
  String get authEmail => 'Correo electrónico';

  @override
  String get authPassword => 'Contraseña';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authSignIn => 'Iniciar sesión';

  @override
  String get authSignOut => 'Cerrar sesión';

  @override
  String get authContinueGoogle => 'Continuar con Google';

  @override
  String get authContinueApple => 'Continuar con Apple';

  @override
  String get authCreateAccount => 'Crear una cuenta';

  @override
  String get authCreateAccountTitle => 'Crear cuenta';

  @override
  String get authSignUpSubtitle =>
      'Únete a Terrava para guardar lugares y planificar tu próximo barrio.';

  @override
  String get authDisplayName => 'Nombre visible';

  @override
  String get authSignUp => 'Registrarse';

  @override
  String get authAccountCreated =>
      'Cuenta creada. Ya puedes empezar a explorar.';

  @override
  String get authAlreadyHaveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get authResetPasswordTitle => 'Restablecer contraseña';

  @override
  String get authResetPasswordSubtitle =>
      'Introduce tu correo y te enviaremos un enlace de restablecimiento.';

  @override
  String get authSendResetLink => 'Enviar enlace';

  @override
  String get authBackToSignIn => 'Volver a iniciar sesión';

  @override
  String get validationInvalidEmail => 'Introduce un correo válido';

  @override
  String get validationPasswordMinLength => 'Mínimo 6 caracteres';

  @override
  String get onboardingDiscoverTitle => 'Descubre cualquier lugar';

  @override
  String get onboardingDiscoverBody =>
      'Busca ciudades, calles, monumentos o coordenadas y ve cómo es la vida a su alrededor.';

  @override
  String get onboardingNearbyTitle => 'Sabe qué hay cerca';

  @override
  String get onboardingNearbyBody =>
      'Restaurantes, hospitales, escuelas, bancos, mercados y lo esencial — organizados para decisiones reales.';

  @override
  String get onboardingPlanTitle => 'Planifica con claridad';

  @override
  String get onboardingPlanBody =>
      'Guarda barrios, compara zonas y muévete con confianza — antes de visitar o mudarte.';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get homeTagline => 'Descubre qué hay alrededor de cualquier barrio';

  @override
  String get homeSearchHint => 'Buscar ciudad, zona, monumento…';

  @override
  String get homeCategoriesTitle => 'Categorías';

  @override
  String get homeCategoriesSubtitle => 'Lo esencial a tu alrededor';

  @override
  String get homeNearbyTitle => 'Cerca';

  @override
  String get homeNearbySubtitle => 'Cerca de ti';

  @override
  String get homeNoNearbyTitle => 'Aún no hay lugares cercanos';

  @override
  String get homeNoNearbyMessage => 'Permite la ubicación o prueba Buscar.';

  @override
  String get homeRecentlyViewedTitle => 'Vistos recientemente';

  @override
  String get homeRecentlyViewedSubtitle => 'De la actividad de tu cuenta';

  @override
  String get homeNoRecentViews => 'Los lugares que abras aparecerán aquí.';

  @override
  String get homePopularNearbyTitle => 'Populares cerca';

  @override
  String get homePopularNearbySubtitle => 'Muy valorados a tu alrededor';

  @override
  String get locationPermissionNeeded =>
      'Se necesita permiso de ubicación para lugares cercanos';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Usando tu ubicación actual';

  @override
  String get locationReadError => 'No se pudo leer la ubicación';

  @override
  String get locationNeighborhood => 'Barrio';

  @override
  String get locationSaveArea => 'Guardar zona';

  @override
  String get locationAreaSaved => 'Zona guardada';

  @override
  String get locationNoRadiusResults => 'No hay resultados en este radio';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Información no disponible: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Puntuación de servicios $score/100';
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
    return '$temp°C · $condition · sensación $feelsLike°C · humedad $humidity%';
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
    return '$area obtiene $overall/100 en comodidad cotidiana (acceso a servicios — no delincuencia ni habitabilidad oficial). Más fuerte: $strongest. Más débil: $weakest. En $radius km: $essentials opciones de supermercado/farmacia, $health lugares de salud, $food lugares de comida, $transport lugares de transporte.';
  }

  @override
  String get scoreEssentials => 'Esenciales';

  @override
  String get scoreHealth => 'Salud';

  @override
  String get scoreFood => 'Comida';

  @override
  String get scoreTransport => 'Transporte';

  @override
  String get scoreMoney => 'Bancos y cajeros';

  @override
  String get scoreEducation => 'Educación';

  @override
  String get scoreFuel => 'Combustible';

  @override
  String get categoryRestaurants => 'Restaurantes';

  @override
  String get categoryHotels => 'Hoteles';

  @override
  String get categoryHospitals => 'Hospitales';

  @override
  String get categoryBanks => 'Bancos';

  @override
  String get categoryPharmacies => 'Farmacias';

  @override
  String get categorySchools => 'Escuelas';

  @override
  String get categorySupermarkets => 'Supermercados';

  @override
  String get categoryMarkets => 'Mercados';

  @override
  String get categoryFuel => 'Combustible';

  @override
  String get categoryNoResultsTitle => 'Sin resultados';

  @override
  String get categoryNoResultsMessage =>
      'Prueba otra categoría o mueve el mapa.';

  @override
  String mapClusterPlaces(int count) {
    return '$count lugares';
  }

  @override
  String get mapTapToZoom => 'Toca para ampliar';

  @override
  String get mapSearchArea => 'Buscar en esta zona';

  @override
  String get mapMyLocation => 'Mi ubicación';

  @override
  String get savedTitle => 'Guardados';

  @override
  String get savedSubtitle =>
      'Lugares, barrios y colecciones sincronizados con tu cuenta.';

  @override
  String get savedCollectionsTitle => 'Colecciones';

  @override
  String get savedNewCollection => 'Nueva';

  @override
  String get savedNoCollections => 'Aún no hay colecciones.';

  @override
  String get savedNeighborhoodsTitle => 'Barrios';

  @override
  String get savedNoAreas => 'Aún no hay zonas guardadas.';

  @override
  String get savedPlacesTitle => 'Lugares';

  @override
  String get savedNoPlacesTitle => 'No hay lugares guardados';

  @override
  String get savedNoPlacesMessage =>
      'Guarda restaurantes, hoteles y más desde los detalles.';

  @override
  String get collectionFallbackName => 'Colección';

  @override
  String get collectionNewTitle => 'Nueva colección';

  @override
  String get collectionNameHint => 'Nombre';

  @override
  String get collectionDeleteTooltip => 'Eliminar colección';

  @override
  String get collectionEmptyTitle => 'Colección vacía';

  @override
  String get collectionEmptyMessage =>
      'Añade lugares desde Detalles del lugar → Guardar en colección.';

  @override
  String get collectionSavedArea => 'Zona guardada';

  @override
  String get collectionCreateFirst => 'Crea primero una colección en Guardados';

  @override
  String get collectionAdded => 'Añadido a la colección';

  @override
  String get areaFallbackName => 'Zona';

  @override
  String get placeFallbackName => 'Lugar';

  @override
  String get placeOpenNow => 'Abierto ahora';

  @override
  String get placeClosed => 'Cerrado';

  @override
  String get placeSaved => 'Lugar guardado';

  @override
  String get placeCollection => 'Colección';

  @override
  String get placeCall => 'Llamar';

  @override
  String get placeWebsite => 'Sitio web';

  @override
  String get placeHours => 'Horario';

  @override
  String get placeReviews => 'Reseñas';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileFallbackName => 'Viajero';

  @override
  String get profileChangePhoto => 'Cambiar foto';

  @override
  String get profileSettingsSubtitle =>
      'Unidades, idioma, notificaciones, legal';

  @override
  String get profilePhotoUpdated => 'Foto de perfil actualizada';

  @override
  String get searchTitle => 'Buscar';

  @override
  String get searchHint => 'País, ciudad, calle, monumento, lat,lng';

  @override
  String get searchNoResults => 'No hay resultados para esa búsqueda';

  @override
  String get searchVoiceTooltip => 'Búsqueda por voz';

  @override
  String get searchVoiceDisabledTooltip => 'Búsqueda por voz (activar en .env)';

  @override
  String get searchVoiceUnavailable => 'Micrófono / voz no disponible';

  @override
  String get searchVoiceEnableInstruction =>
      'Define ENABLE_VOICE_SEARCH=true en .env para activar';

  @override
  String get searchRecentTitle => 'Búsquedas recientes';

  @override
  String get searchNoRecent => 'Aún no hay búsquedas recientes.';

  @override
  String get searchPopularTitle => 'Búsquedas populares';

  @override
  String get searchNoPopular =>
      'Las búsquedas populares aparecerán según el uso real.';

  @override
  String get searchNoSuggestionsTitle => 'Sin sugerencias';

  @override
  String get searchNoSuggestionsMessage =>
      'Prueba una ciudad, un monumento o coordenadas.';

  @override
  String get directionsLocationRequired =>
      'Se necesita la ubicación actual para las indicaciones';

  @override
  String get directionsNoRoute => 'No se encontró ruta';

  @override
  String get directionsOriginYou => 'Tú';

  @override
  String get directionsDestination => 'Destino';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutDefaultDescription =>
      'Terrava ayuda a cualquiera a entender cualquier barrio antes de visitarlo, mudarse o vivir allí.';

  @override
  String aboutVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get helpTitle => 'Ayuda';

  @override
  String get helpHowItWorksTitle => 'Cómo funciona Terrava';

  @override
  String get helpHowItWorksBody =>
      'Busca cualquier lugar del planeta, explora lo esencial cerca en el mapa, abre los detalles del barrio para ver puntuaciones de servicios y guarda lugares en tu cuenta.';

  @override
  String get helpScoresTitle => 'Puntuaciones de barrio';

  @override
  String get helpScoresBody =>
      'Las puntuaciones son estimaciones de comodidad/servicios a partir de la densidad de Google Places, valoraciones y distancia. No son indicadores de delincuencia, calidad escolar ni habitabilidad oficial.';

  @override
  String get privacyBody =>
      'Terrava almacena tu perfil de cuenta, lugares guardados, historial de búsqueda y tokens push opcionales en Supabase con seguridad a nivel de fila. La ubicación se usa en el dispositivo para obtener lugares cercanos de las APIs de Google. No vendemos datos personales. Contacta con soporte para solicitudes de eliminación.';

  @override
  String get termsBody =>
      'Terrava ofrece herramientas de descubrimiento de barrios con fines informativos. Las puntuaciones de servicios son estimaciones, no garantías de seguridad o habitabilidad. Los datos de mapas y lugares de terceros pueden estar incompletos o desactualizados. Usa la app conforme a las leyes aplicables y a los términos de Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Algo salió mal';

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
}
