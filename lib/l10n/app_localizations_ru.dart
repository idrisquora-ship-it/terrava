// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Поймите любой район';

  @override
  String get navHome => 'Главная';

  @override
  String get navExplore => 'Обзор';

  @override
  String get navSaved => 'Сохранённое';

  @override
  String get navProfile => 'Профиль';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonCreate => 'Создать';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonContinue => 'Продолжить';

  @override
  String get commonTryAgain => 'Повторить';

  @override
  String get commonDirections => 'Маршрут';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonShare => 'Поделиться';

  @override
  String get commonSeeAll => 'Смотреть все';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get unitsMetric => 'Метрическая (км)';

  @override
  String get unitsImperial => 'Имперская (мили)';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get settingsUnits => 'Единицы';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsCurrency => 'Валюта';

  @override
  String get settingsAboutTerrava => 'О Terrava';

  @override
  String get settingsHelp => 'Справка';

  @override
  String get settingsPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get settingsTermsOfService => 'Условия использования';

  @override
  String get notificationsPushTitle => 'Push-уведомления';

  @override
  String get notificationsPushSubtitle =>
      'Сохранённые места, советы и оповещения аккаунта через Firebase';

  @override
  String get notificationsEnabledTitle => '??????????? ????????';

  @override
  String get notificationsEnabledBody =>
      'Terrava ????? ?????????? ??? ? ??????????? ?????? ? ??????????? ????????.';

  @override
  String get notificationsPlaceSavedTitle => '????????? ? Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ?????? ? ????? ??????. ???????? ????????????? ? ????? ?????, ????? ????????? ? ????.';
  }

  @override
  String get notificationsAreaSavedTitle => '????? ????????';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ????? ?????, ????? ?? ???????? ????? ???????? ??????.';
  }

  @override
  String get notificationsWelcomeTitle => '????? ?????????? ? Terrava';

  @override
  String get notificationsWelcomeBody =>
      '?????????? ??????, ?????????? ????? ? ????????? ???????? ?? ??????? ?????.';

  @override
  String get notificationsGenericUpdate => '? ??? ????? ??????????';

  @override
  String get accountDelete => 'Удалить аккаунт';

  @override
  String get accountDeleteQuestion => 'Удалить аккаунт?';

  @override
  String get accountDeleteWarning =>
      'Это навсегда удалит ваш аккаунт Terrava и сохранённые данные.';

  @override
  String get authWelcomeBack => 'С возвращением';

  @override
  String get authSignInSubtitle =>
      'Войдите, чтобы сохранять районы и продолжать исследование.';

  @override
  String get authEmail => 'Эл. почта';

  @override
  String get authPassword => 'Пароль';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String get authSignIn => 'Войти';

  @override
  String get authSignOut => 'Выйти';

  @override
  String get authContinueGoogle => 'Продолжить с Google';

  @override
  String get authContinueApple => 'Продолжить с Apple';

  @override
  String get authCreateAccount => 'Создать аккаунт';

  @override
  String get authCreateAccountTitle => 'Создать аккаунт';

  @override
  String get authSignUpSubtitle =>
      'Присоединяйтесь к Terrava, чтобы сохранять места и планировать следующий район.';

  @override
  String get authDisplayName => 'Отображаемое имя';

  @override
  String get authSignUp => 'Зарегистрироваться';

  @override
  String get authAccountCreated =>
      'Аккаунт создан. Можно начинать исследование.';

  @override
  String get authAlreadyHaveAccount => 'Уже есть аккаунт? Войти';

  @override
  String get authResetPasswordTitle => 'Сброс пароля';

  @override
  String get authResetPasswordSubtitle =>
      'Введите эл. почту, и мы отправим ссылку для сброса.';

  @override
  String get authSendResetLink => 'Отправить ссылку';

  @override
  String get authBackToSignIn => 'Назад ко входу';

  @override
  String get validationInvalidEmail => 'Введите корректный адрес эл. почты';

  @override
  String get validationPasswordMinLength => 'Мин. 6 символов';

  @override
  String get onboardingDiscoverTitle => 'Откройте любое место';

  @override
  String get onboardingDiscoverBody =>
      'Ищите города, улицы, достопримечательности или координаты и смотрите, какова жизнь вокруг.';

  @override
  String get onboardingNearbyTitle => 'Узнайте, что рядом';

  @override
  String get onboardingNearbyBody =>
      'Рестораны, больницы, школы, банки, рынки и необходимое — организовано для реальных решений.';

  @override
  String get onboardingPlanTitle => 'Планируйте ясно';

  @override
  String get onboardingPlanBody =>
      'Сохраняйте районы, сравнивайте зоны и действуйте уверенно — до визита или переезда.';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get homeTagline => 'Узнайте, что вокруг любого района';

  @override
  String get homeSearchHint => 'Поиск города, района, достопримечательности…';

  @override
  String get homeCategoriesTitle => 'Категории';

  @override
  String get homeCategoriesSubtitle => 'Необходимое вокруг вас';

  @override
  String get homeNearbyTitle => 'Рядом';

  @override
  String get homeNearbySubtitle => 'Близко к вам';

  @override
  String get homeNoNearbyTitle => 'Пока нет мест поблизости';

  @override
  String get homeNoNearbyMessage =>
      'Разрешите геолокацию или попробуйте Поиск.';

  @override
  String get homeRecentlyViewedTitle => 'Недавно просмотренные';

  @override
  String get homeRecentlyViewedSubtitle => 'Из активности вашего аккаунта';

  @override
  String get homeNoRecentViews => 'Открытые вами места появятся здесь.';

  @override
  String get homePopularNearbyTitle => 'Популярное рядом';

  @override
  String get homePopularNearbySubtitle => 'Высоко оценённые вокруг вас';

  @override
  String get locationPermissionNeeded =>
      'Для мест поблизости нужно разрешение на геолокацию';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Используется ваше текущее местоположение';

  @override
  String get locationReadError => 'Не удалось определить местоположение';

  @override
  String get locationNeighborhood => 'Район';

  @override
  String get locationSaveArea => 'Сохранить зону';

  @override
  String get locationAreaSaved => 'Зона сохранена';

  @override
  String get locationNoRadiusResults => 'Нет результатов в этом радиусе';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Аналитика недоступна: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Оценка удобств $score/100';
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
    return '$temp°C · $condition · ощущается как $feelsLike°C · влажность $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Курс: 1 $base = $rate $target';
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
    return '$area набирает $overall/100 за повседневное удобство (доступ к удобствам — не преступность и не официальная оценка комфортности). Сильнее всего: $strongest. Слабее всего: $weakest. В радиусе $radius км: $essentials вариантов магазинов/аптек, $health мест, связанных со здоровьем, $food мест питания, $transport мест, связанных с транспортом.';
  }

  @override
  String get scoreEssentials => 'Необходимое';

  @override
  String get scoreHealth => 'Здоровье';

  @override
  String get scoreFood => 'Еда';

  @override
  String get scoreTransport => 'Транспорт';

  @override
  String get scoreMoney => 'Банки и банкоматы';

  @override
  String get scoreEducation => 'Образование';

  @override
  String get scoreFuel => 'Топливо';

  @override
  String get categoryRestaurants => 'Рестораны';

  @override
  String get categoryHotels => 'Отели';

  @override
  String get categoryHospitals => 'Больницы';

  @override
  String get categoryBanks => 'Банки';

  @override
  String get categoryPharmacies => 'Аптеки';

  @override
  String get categorySchools => 'Школы';

  @override
  String get categorySupermarkets => 'Супермаркеты';

  @override
  String get categoryMarkets => 'Рынки';

  @override
  String get categoryFuel => 'Топливо';

  @override
  String get categoryNoResultsTitle => 'Нет результатов';

  @override
  String get categoryNoResultsMessage =>
      'Попробуйте другую категорию или переместите карту.';

  @override
  String mapClusterPlaces(int count) {
    return '$count мест';
  }

  @override
  String get mapTapToZoom => 'Нажмите, чтобы увеличить';

  @override
  String get mapSearchArea => 'Искать в этой зоне';

  @override
  String get mapMyLocation => 'Моё местоположение';

  @override
  String get savedTitle => 'Сохранённое';

  @override
  String get savedSubtitle =>
      'Места, районы и коллекции синхронизированы с аккаунтом.';

  @override
  String get savedCollectionsTitle => 'Коллекции';

  @override
  String get savedNewCollection => 'Новая';

  @override
  String get savedNoCollections => 'Пока нет коллекций.';

  @override
  String get savedNeighborhoodsTitle => 'Районы';

  @override
  String get savedNoAreas => 'Пока нет сохранённых зон.';

  @override
  String get savedPlacesTitle => 'Места';

  @override
  String get savedNoPlacesTitle => 'Нет сохранённых мест';

  @override
  String get savedNoPlacesMessage =>
      'Сохраняйте рестораны, отели и другое из подробностей.';

  @override
  String get collectionFallbackName => 'Коллекция';

  @override
  String get collectionNewTitle => 'Новая коллекция';

  @override
  String get collectionNameHint => 'Название';

  @override
  String get collectionDeleteTooltip => 'Удалить коллекцию';

  @override
  String get collectionEmptyTitle => 'Пустая коллекция';

  @override
  String get collectionEmptyMessage =>
      'Добавляйте места из Подробностей места → Сохранить в коллекцию.';

  @override
  String get collectionSavedArea => 'Сохранённая зона';

  @override
  String get collectionCreateFirst =>
      'Сначала создайте коллекцию в Сохранённом';

  @override
  String get collectionAdded => 'Добавлено в коллекцию';

  @override
  String get areaFallbackName => 'Зона';

  @override
  String get placeFallbackName => 'Место';

  @override
  String get placeOpenNow => 'Сейчас открыто';

  @override
  String get placeClosed => 'Закрыто';

  @override
  String get placeSaved => 'Место сохранено';

  @override
  String get placeCollection => 'Коллекция';

  @override
  String get placeCall => 'Позвонить';

  @override
  String get placeWebsite => 'Сайт';

  @override
  String get placeHours => 'Часы работы';

  @override
  String get placeReviews => 'Отзывы';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileFallbackName => 'Путешественник';

  @override
  String get profileChangePhoto => 'Сменить фото';

  @override
  String get profileSettingsSubtitle =>
      'Единицы, язык, уведомления, юридическое';

  @override
  String get profilePhotoUpdated => 'Фото профиля обновлено';

  @override
  String get searchTitle => 'Поиск';

  @override
  String get searchHint =>
      'Страна, город, улица, достопримечательность, шир.,долг.';

  @override
  String get searchNoResults => 'Нет результатов по этому запросу';

  @override
  String get searchVoiceTooltip => 'Голосовой поиск';

  @override
  String get searchVoiceDisabledTooltip => 'Голосовой поиск (включите в .env)';

  @override
  String get searchVoiceUnavailable => 'Микрофон / речь недоступны';

  @override
  String get searchVoiceEnableInstruction =>
      'Установите ENABLE_VOICE_SEARCH=true в .env для включения';

  @override
  String get searchRecentTitle => 'Недавние поиски';

  @override
  String get searchNoRecent => 'Пока нет недавних поисков.';

  @override
  String get searchPopularTitle => 'Популярные поиски';

  @override
  String get searchNoPopular =>
      'Популярные поиски появятся из реального использования.';

  @override
  String get searchNoSuggestionsTitle => 'Нет подсказок';

  @override
  String get searchNoSuggestionsMessage =>
      'Попробуйте город, достопримечательность или координаты.';

  @override
  String get directionsLocationRequired =>
      'Для маршрута нужно текущее местоположение';

  @override
  String get directionsNoRoute => 'Маршрут не найден';

  @override
  String get directionsOriginYou => 'Вы';

  @override
  String get directionsDestination => 'Пункт назначения';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get aboutDefaultDescription =>
      'Terrava помогает понять любой район до визита, переезда или проживания там.';

  @override
  String aboutVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get helpTitle => 'Справка';

  @override
  String get helpHowItWorksTitle => 'Как работает Terrava';

  @override
  String get helpHowItWorksBody =>
      'Ищите любое место на Земле, изучайте необходимое рядом на карте, открывайте подробности района для оценок удобств и сохраняйте места в аккаунт.';

  @override
  String get helpScoresTitle => 'Оценки района';

  @override
  String get helpScoresBody =>
      'Оценки — это оценки удобства/удобств по плотности Google Places, рейтингам и расстоянию. Это не оценки преступности, качества школ или официальной комфортности жизни.';

  @override
  String get privacyBody =>
      'Terrava хранит профиль аккаунта, сохранённые места, историю поиска и необязательные push-токены в Supabase с безопасностью на уровне строк. Геолокация используется на устройстве для получения мест поблизости через Google API. Мы не продаём персональные данные. Обращайтесь в поддержку по запросам на удаление.';

  @override
  String get termsBody =>
      'Terrava предоставляет инструменты для изучения районов в информационных целях. Оценки удобств — это оценки, а не гарантии безопасности или комфортности жизни. Картографические и данные о местах от третьих сторон могут быть неполными или устаревшими. Используйте приложение в соответствии с применимыми законами и условиями Google Maps / Places.';

  @override
  String get errorGenericTitle => 'Что-то пошло не так';

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
