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
}
