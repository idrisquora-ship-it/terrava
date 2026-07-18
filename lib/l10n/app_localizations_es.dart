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
}
