// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Entenda qualquer bairro';

  @override
  String get navHome => 'Início';

  @override
  String get navExplore => 'Explorar';

  @override
  String get navSaved => 'Salvos';

  @override
  String get navProfile => 'Perfil';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCreate => 'Criar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonTryAgain => 'Tentar novamente';

  @override
  String get commonDirections => 'Direções';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonShare => 'Compartilhar';

  @override
  String get commonSeeAll => 'Ver tudo';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get unitsMetric => 'Métrico (km)';

  @override
  String get unitsImperial => 'Imperial (mi)';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsUnits => 'Unidades';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsCurrency => 'Moeda';

  @override
  String get settingsAboutTerrava => 'Sobre o Terrava';

  @override
  String get settingsHelp => 'Ajuda';

  @override
  String get settingsPrivacyPolicy => 'Política de Privacidade';

  @override
  String get settingsTermsOfService => 'Termos de Serviço';

  @override
  String get notificationsPushTitle => 'Notificações push';

  @override
  String get notificationsPushSubtitle =>
      'Lugares salvos, dicas e alertas da conta via Firebase';

  @override
  String get notificationsEnabledTitle => 'Notifica??es ativadas';

  @override
  String get notificationsEnabledBody =>
      'O Terrava pode alertar voc? sobre lugares salvos e atualiza??es da conta.';

  @override
  String get notificationsPlaceSavedTitle => 'Salvo no Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName est? na sua lista. Abra Salvos quando quiser para visitar de novo.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Bairro salvo';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName estar? pronto quando voc? quiser comparar pontua??es novamente.';
  }

  @override
  String get notificationsWelcomeTitle => 'Bem-vindo ao Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Explore bairros, salve lugares e veja insights de pontua??o por perto.';

  @override
  String get notificationsGenericUpdate => 'Voc? tem uma nova atualiza??o';

  @override
  String get accountDelete => 'Excluir conta';

  @override
  String get accountDeleteQuestion => 'Excluir conta?';

  @override
  String get accountDeleteWarning =>
      'Isso exclui permanentemente sua conta Terrava e os dados salvos.';

  @override
  String get authWelcomeBack => 'Bem-vindo de volta';

  @override
  String get authSignInSubtitle =>
      'Entre para salvar bairros e continuar explorando.';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authPassword => 'Senha';

  @override
  String get authForgotPassword => 'Esqueceu a senha?';

  @override
  String get authSignIn => 'Entrar';

  @override
  String get authSignOut => 'Sair';

  @override
  String get authContinueGoogle => 'Continuar com o Google';

  @override
  String get authContinueApple => 'Continuar com a Apple';

  @override
  String get authCreateAccount => 'Criar uma conta';

  @override
  String get authCreateAccountTitle => 'Criar conta';

  @override
  String get authSignUpSubtitle =>
      'Junte-se ao Terrava para salvar lugares e planejar seu próximo bairro.';

  @override
  String get authDisplayName => 'Nome de exibição';

  @override
  String get authSignUp => 'Cadastrar';

  @override
  String get authAccountCreated =>
      'Conta criada. Você já pode começar a explorar.';

  @override
  String get authAlreadyHaveAccount => 'Já tem uma conta? Entrar';

  @override
  String get authResetPasswordTitle => 'Redefinir senha';

  @override
  String get authResetPasswordSubtitle =>
      'Digite seu e-mail e enviaremos um link de redefinição.';

  @override
  String get authSendResetLink => 'Enviar link de redefinição';

  @override
  String get authBackToSignIn => 'Voltar ao login';

  @override
  String get validationInvalidEmail => 'Digite um e-mail válido';

  @override
  String get validationPasswordMinLength => 'Mínimo de 6 caracteres';

  @override
  String get onboardingDiscoverTitle => 'Descubra qualquer lugar';

  @override
  String get onboardingDiscoverBody =>
      'Pesquise cidades, ruas, pontos de referência ou coordenadas e veja como é a vida ao redor.';

  @override
  String get onboardingNearbyTitle => 'Saiba o que há por perto';

  @override
  String get onboardingNearbyBody =>
      'Restaurantes, hospitais, escolas, bancos, mercados e o essencial — organizados para decisões reais.';

  @override
  String get onboardingPlanTitle => 'Planeje com clareza';

  @override
  String get onboardingPlanBody =>
      'Salve bairros, compare áreas e avance com confiança — antes de visitar ou se mudar.';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get homeTagline => 'Descubra o que há ao redor de qualquer bairro';

  @override
  String get homeSearchHint => 'Pesquisar cidade, área, ponto de referência…';

  @override
  String get homeCategoriesTitle => 'Categorias';

  @override
  String get homeCategoriesSubtitle => 'Essenciais ao seu redor';

  @override
  String get homeNearbyTitle => 'Por perto';

  @override
  String get homeNearbySubtitle => 'Perto de você';

  @override
  String get homeNoNearbyTitle => 'Ainda não há lugares próximos';

  @override
  String get homeNoNearbyMessage => 'Permita a localização ou tente Pesquisar.';

  @override
  String get homeRecentlyViewedTitle => 'Vistos recentemente';

  @override
  String get homeRecentlyViewedSubtitle => 'Da atividade da sua conta';

  @override
  String get homeNoRecentViews => 'Os lugares que você abrir aparecerão aqui.';

  @override
  String get homePopularNearbyTitle => 'Populares por perto';

  @override
  String get homePopularNearbySubtitle => 'Bem avaliados ao seu redor';

  @override
  String get locationPermissionNeeded =>
      'Permissão de localização necessária para lugares próximos';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Usando sua localização atual';

  @override
  String get locationReadError => 'Não foi possível ler a localização';

  @override
  String get locationNeighborhood => 'Bairro';

  @override
  String get locationSaveArea => 'Salvar área';

  @override
  String get locationAreaSaved => 'Área salva';

  @override
  String get locationNoRadiusResults => 'Nenhum resultado neste raio';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Insights indisponíveis: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Pontuação de comodidades $score/100';
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
    return '$temp°C · $condition · sensação $feelsLike°C · umidade $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Câmbio: 1 $base = $rate $target';
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
    return '$area marca $overall/100 em conveniência do dia a dia (acesso a comodidades — não crime nem habitabilidade oficial). Mais forte: $strongest. Mais fraco: $weakest. Em $radius km: $essentials opções de mercado/farmácia, $health locais de saúde, $food locais de comida, $transport locais de transporte.';
  }

  @override
  String get scoreEssentials => 'Essenciais';

  @override
  String get scoreHealth => 'Saúde';

  @override
  String get scoreFood => 'Comida';

  @override
  String get scoreTransport => 'Transporte';

  @override
  String get scoreMoney => 'Bancos e caixas';

  @override
  String get scoreEducation => 'Educação';

  @override
  String get scoreFuel => 'Combustível';

  @override
  String get categoryRestaurants => 'Restaurantes';

  @override
  String get categoryHotels => 'Hotéis';

  @override
  String get categoryHospitals => 'Hospitais';

  @override
  String get categoryBanks => 'Bancos';

  @override
  String get categoryPharmacies => 'Farmácias';

  @override
  String get categorySchools => 'Escolas';

  @override
  String get categorySupermarkets => 'Supermercados';

  @override
  String get categoryMarkets => 'Mercados';

  @override
  String get categoryFuel => 'Combustível';

  @override
  String get categoryNoResultsTitle => 'Sem resultados';

  @override
  String get categoryNoResultsMessage =>
      'Tente outra categoria ou mova o mapa.';

  @override
  String mapClusterPlaces(int count) {
    return '$count lugares';
  }

  @override
  String get mapTapToZoom => 'Toque para ampliar';

  @override
  String get mapSearchArea => 'Pesquisar nesta área';

  @override
  String get mapMyLocation => 'Minha localização';

  @override
  String get savedTitle => 'Salvos';

  @override
  String get savedSubtitle =>
      'Lugares, bairros e coleções sincronizados com sua conta.';

  @override
  String get savedCollectionsTitle => 'Coleções';

  @override
  String get savedNewCollection => 'Nova';

  @override
  String get savedNoCollections => 'Ainda não há coleções.';

  @override
  String get savedNeighborhoodsTitle => 'Bairros';

  @override
  String get savedNoAreas => 'Ainda não há áreas salvas.';

  @override
  String get savedPlacesTitle => 'Lugares';

  @override
  String get savedNoPlacesTitle => 'Nenhum lugar salvo';

  @override
  String get savedNoPlacesMessage =>
      'Salve restaurantes, hotéis e mais nos detalhes.';

  @override
  String get collectionFallbackName => 'Coleção';

  @override
  String get collectionNewTitle => 'Nova coleção';

  @override
  String get collectionNameHint => 'Nome';

  @override
  String get collectionDeleteTooltip => 'Excluir coleção';

  @override
  String get collectionEmptyTitle => 'Coleção vazia';

  @override
  String get collectionEmptyMessage =>
      'Adicione lugares em Detalhes do lugar → Salvar na coleção.';

  @override
  String get collectionSavedArea => 'Área salva';

  @override
  String get collectionCreateFirst => 'Crie primeiro uma coleção em Salvos';

  @override
  String get collectionAdded => 'Adicionado à coleção';

  @override
  String get areaFallbackName => 'Área';

  @override
  String get placeFallbackName => 'Lugar';

  @override
  String get placeOpenNow => 'Aberto agora';

  @override
  String get placeClosed => 'Fechado';

  @override
  String get placeSaved => 'Lugar salvo';

  @override
  String get placeCollection => 'Coleção';

  @override
  String get placeCall => 'Ligar';

  @override
  String get placeWebsite => 'Site';

  @override
  String get placeHours => 'Horário';

  @override
  String get placeReviews => 'Avaliações';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileFallbackName => 'Viajante';

  @override
  String get profileChangePhoto => 'Alterar foto';

  @override
  String get profileSettingsSubtitle =>
      'Unidades, idioma, notificações, jurídico';

  @override
  String get profilePhotoUpdated => 'Foto de perfil atualizada';

  @override
  String get searchTitle => 'Pesquisar';

  @override
  String get searchHint => 'País, cidade, rua, ponto de referência, lat,lng';

  @override
  String get searchNoResults => 'Nenhum resultado para essa pesquisa';

  @override
  String get searchVoiceTooltip => 'Pesquisa por voz';

  @override
  String get searchVoiceDisabledTooltip => 'Pesquisa por voz (ativar em .env)';

  @override
  String get searchVoiceUnavailable => 'Microfone / fala indisponível';

  @override
  String get searchVoiceEnableInstruction =>
      'Defina ENABLE_VOICE_SEARCH=true em .env para ativar';

  @override
  String get searchRecentTitle => 'Pesquisas recentes';

  @override
  String get searchNoRecent => 'Ainda não há pesquisas recentes.';

  @override
  String get searchPopularTitle => 'Pesquisas populares';

  @override
  String get searchNoPopular =>
      'As pesquisas populares aparecerão com o uso real.';

  @override
  String get searchNoSuggestionsTitle => 'Sem sugestões';

  @override
  String get searchNoSuggestionsMessage =>
      'Tente uma cidade, ponto de referência ou coordenadas.';

  @override
  String get directionsLocationRequired =>
      'Localização atual necessária para direções';

  @override
  String get directionsNoRoute => 'Nenhuma rota encontrada';

  @override
  String get directionsOriginYou => 'Você';

  @override
  String get directionsDestination => 'Destino';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String get aboutDefaultDescription =>
      'O Terrava ajuda qualquer pessoa a entender qualquer bairro antes de visitar, mudar ou viver lá.';

  @override
  String aboutVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get helpTitle => 'Ajuda';

  @override
  String get helpHowItWorksTitle => 'Como o Terrava funciona';

  @override
  String get helpHowItWorksBody =>
      'Pesquise qualquer lugar na Terra, explore o essencial por perto no mapa, abra os detalhes do bairro para pontuações de comodidades e salve lugares na sua conta.';

  @override
  String get helpScoresTitle => 'Pontuações do bairro';

  @override
  String get helpScoresBody =>
      'As pontuações são estimativas de conveniência/comodidades com base na densidade do Google Places, avaliações e distância. Não são indicadores de crime, qualidade escolar ou habitabilidade oficial.';

  @override
  String get privacyBody =>
      'O Terrava armazena seu perfil de conta, locais salvos, histórico de pesquisa e tokens push opcionais no Supabase com segurança em nível de linha. A localização é usada no dispositivo para buscar locais próximos nas APIs do Google. Não vendemos dados pessoais. Entre em contato com o suporte para solicitações de exclusão.';

  @override
  String get termsBody =>
      'O Terrava oferece ferramentas de descoberta de bairros para fins informativos. As pontuações de comodidades são estimativas, não garantias de segurança ou habitabilidade. Dados de mapas e lugares de terceiros podem estar incompletos ou desatualizados. Use o app de acordo com as leis aplicáveis e os termos do Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Algo deu errado';

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
