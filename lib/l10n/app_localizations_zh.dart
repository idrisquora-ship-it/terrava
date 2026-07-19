// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => '了解任何街区';

  @override
  String get navHome => '首页';

  @override
  String get navExplore => '探索';

  @override
  String get navSaved => '已保存';

  @override
  String get navProfile => '个人资料';

  @override
  String get commonCancel => '取消';

  @override
  String get commonCreate => '创建';

  @override
  String get commonDelete => '删除';

  @override
  String get commonContinue => '继续';

  @override
  String get commonTryAgain => '重试';

  @override
  String get commonDirections => '路线';

  @override
  String get commonSave => '保存';

  @override
  String get commonShare => '分享';

  @override
  String get commonSeeAll => '查看全部';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get unitsMetric => '公制（公里）';

  @override
  String get unitsImperial => '英制（英里）';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsUnits => '单位';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsCurrency => '货币';

  @override
  String get settingsAboutTerrava => '关于 Terrava';

  @override
  String get settingsHelp => '帮助';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get settingsTermsOfService => '服务条款';

  @override
  String get notificationsPushTitle => '推送通知';

  @override
  String get notificationsPushSubtitle => '通过 Firebase 接收已保存地点、提示和账户提醒';

  @override
  String get notificationsEnabledTitle => '?????';

  @override
  String get notificationsEnabledBody => 'Terrava ????????????????';

  @override
  String get notificationsPlaceSavedTitle => '???? Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ??????????????????????';
  }

  @override
  String get notificationsAreaSavedTitle => '?????';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ?????????????????';
  }

  @override
  String get notificationsWelcomeTitle => '???? Terrava';

  @override
  String get notificationsWelcomeBody => '?????????????????????';

  @override
  String get notificationsGenericUpdate => '???????';

  @override
  String get accountDelete => '删除账户';

  @override
  String get accountDeleteQuestion => '删除账户？';

  @override
  String get accountDeleteWarning => '这将永久删除您的 Terrava 账户和已保存的数据。';

  @override
  String get authWelcomeBack => '欢迎回来';

  @override
  String get authSignInSubtitle => '登录以保存街区并继续探索。';

  @override
  String get authEmail => '电子邮箱';

  @override
  String get authPassword => '密码';

  @override
  String get authForgotPassword => '忘记密码？';

  @override
  String get authSignIn => '登录';

  @override
  String get authSignOut => '退出登录';

  @override
  String get authContinueGoogle => '使用 Google 继续';

  @override
  String get authContinueApple => '使用 Apple 继续';

  @override
  String get authCreateAccount => '创建账户';

  @override
  String get authCreateAccountTitle => '创建账户';

  @override
  String get authSignUpSubtitle => '加入 Terrava，保存地点并规划您的下一个街区。';

  @override
  String get authDisplayName => '显示名称';

  @override
  String get authSignUp => '注册';

  @override
  String get authAccountCreated => '账户已创建。您可以开始探索了。';

  @override
  String get authAlreadyHaveAccount => '已有账户？登录';

  @override
  String get authResetPasswordTitle => '重置密码';

  @override
  String get authResetPasswordSubtitle => '输入您的电子邮箱，我们将发送重置链接。';

  @override
  String get authSendResetLink => '发送重置链接';

  @override
  String get authBackToSignIn => '返回登录';

  @override
  String get validationInvalidEmail => '请输入有效的电子邮箱';

  @override
  String get validationPasswordMinLength => '至少 6 个字符';

  @override
  String get onboardingDiscoverTitle => '发现任何地方';

  @override
  String get onboardingDiscoverBody => '搜索城市、街道、地标或坐标，了解周边生活面貌。';

  @override
  String get onboardingNearbyTitle => '了解附近有什么';

  @override
  String get onboardingNearbyBody => '餐厅、医院、学校、银行、市场及日常生活必需设施——为真实决策而整理。';

  @override
  String get onboardingPlanTitle => '清晰规划';

  @override
  String get onboardingPlanBody => '保存街区、比较区域，满怀信心地行动——在造访或搬迁之前。';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get homeTagline => '发现任何街区周边的精彩';

  @override
  String get homeSearchHint => '搜索城市、区域、地标…';

  @override
  String get homeCategoriesTitle => '分类';

  @override
  String get homeCategoriesSubtitle => '您周围的生活必需';

  @override
  String get homeNearbyTitle => '附近';

  @override
  String get homeNearbySubtitle => '离您很近';

  @override
  String get homeNoNearbyTitle => '暂无附近地点';

  @override
  String get homeNoNearbyMessage => '请允许定位或尝试搜索。';

  @override
  String get homeRecentlyViewedTitle => '最近查看';

  @override
  String get homeRecentlyViewedSubtitle => '来自您的账户活动';

  @override
  String get homeNoRecentViews => '您打开的地点将显示在这里。';

  @override
  String get homePopularNearbyTitle => '附近热门';

  @override
  String get homePopularNearbySubtitle => '您周围评分很高的地点';

  @override
  String get locationPermissionNeeded => '查看附近地点需要定位权限';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => '正在使用您的当前位置';

  @override
  String get locationReadError => '无法读取位置';

  @override
  String get locationNeighborhood => '街区';

  @override
  String get locationSaveArea => '保存区域';

  @override
  String get locationAreaSaved => '区域已保存';

  @override
  String get locationNoRadiusResults => '此半径内无结果';

  @override
  String locationInsightsUnavailable(String error) {
    return '洞察不可用：$error';
  }

  @override
  String amenityScore(int score) {
    return '便利设施评分 $score/100';
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
    return '$temp°C · $condition · 体感 $feelsLike°C · 湿度 $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return '汇率：1 $base = $rate $target';
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
    return '$area 的日常便利评分为 $overall/100（便利设施可达性——非犯罪率或官方宜居度）。最强：$strongest。最弱：$weakest。在 $radius 公里内：$essentials 个超市/药店选项，$health 个健康相关地点，$food 个餐饮地点，$transport 个交通相关地点。';
  }

  @override
  String get scoreEssentials => '生活必需';

  @override
  String get scoreHealth => '健康';

  @override
  String get scoreFood => '餐饮';

  @override
  String get scoreTransport => '交通';

  @override
  String get scoreMoney => '银行与 ATM';

  @override
  String get scoreEducation => '教育';

  @override
  String get scoreFuel => '加油';

  @override
  String get categoryRestaurants => '餐厅';

  @override
  String get categoryHotels => '酒店';

  @override
  String get categoryHospitals => '医院';

  @override
  String get categoryBanks => '银行';

  @override
  String get categoryPharmacies => '药店';

  @override
  String get categorySchools => '学校';

  @override
  String get categorySupermarkets => '超市';

  @override
  String get categoryMarkets => '市场';

  @override
  String get categoryFuel => '加油';

  @override
  String get categoryNoResultsTitle => '无结果';

  @override
  String get categoryNoResultsMessage => '请尝试其他分类或移动地图。';

  @override
  String mapClusterPlaces(int count) {
    return '$count 个地点';
  }

  @override
  String get mapTapToZoom => '点击放大';

  @override
  String get mapSearchArea => '搜索此区域';

  @override
  String get mapMyLocation => '我的位置';

  @override
  String get savedTitle => '已保存';

  @override
  String get savedSubtitle => '地点、街区和收藏夹已同步到您的账户。';

  @override
  String get savedCollectionsTitle => '收藏夹';

  @override
  String get savedNewCollection => '新建';

  @override
  String get savedNoCollections => '暂无收藏夹。';

  @override
  String get savedNeighborhoodsTitle => '街区';

  @override
  String get savedNoAreas => '暂无已保存区域。';

  @override
  String get savedPlacesTitle => '地点';

  @override
  String get savedNoPlacesTitle => '暂无已保存地点';

  @override
  String get savedNoPlacesMessage => '可在详情页保存餐厅、酒店等。';

  @override
  String get collectionFallbackName => '收藏夹';

  @override
  String get collectionNewTitle => '新建收藏夹';

  @override
  String get collectionNameHint => '名称';

  @override
  String get collectionDeleteTooltip => '删除收藏夹';

  @override
  String get collectionEmptyTitle => '空收藏夹';

  @override
  String get collectionEmptyMessage => '从地点详情 → 保存到收藏夹添加地点。';

  @override
  String get collectionSavedArea => '已保存区域';

  @override
  String get collectionCreateFirst => '请先在已保存中创建收藏夹';

  @override
  String get collectionAdded => '已添加到收藏夹';

  @override
  String get areaFallbackName => '区域';

  @override
  String get placeFallbackName => '地点';

  @override
  String get placeOpenNow => '营业中';

  @override
  String get placeClosed => '已关闭';

  @override
  String get placeSaved => '地点已保存';

  @override
  String get placeCollection => '收藏夹';

  @override
  String get placeCall => '拨打电话';

  @override
  String get placeWebsite => '网站';

  @override
  String get placeHours => '营业时间';

  @override
  String get placeReviews => '评价';

  @override
  String get profileTitle => '个人资料';

  @override
  String get profileFallbackName => '旅行者';

  @override
  String get profileChangePhoto => '更换照片';

  @override
  String get profileSettingsSubtitle => '单位、语言、通知、法律信息';

  @override
  String get profilePhotoUpdated => '个人资料照片已更新';

  @override
  String get searchTitle => '搜索';

  @override
  String get searchHint => '国家、城市、街道、地标、纬度,经度';

  @override
  String get searchNoResults => '该搜索无结果';

  @override
  String get searchVoiceTooltip => '语音搜索';

  @override
  String get searchVoiceDisabledTooltip => '语音搜索（在 .env 中启用）';

  @override
  String get searchVoiceUnavailable => '麦克风 / 语音不可用';

  @override
  String get searchVoiceEnableInstruction =>
      '在 .env 中设置 ENABLE_VOICE_SEARCH=true 以启用';

  @override
  String get searchRecentTitle => '最近搜索';

  @override
  String get searchNoRecent => '暂无最近搜索。';

  @override
  String get searchPopularTitle => '热门搜索';

  @override
  String get searchNoPopular => '热门搜索将根据实际使用情况显示。';

  @override
  String get searchNoSuggestionsTitle => '无建议';

  @override
  String get searchNoSuggestionsMessage => '请尝试城市、地标或坐标。';

  @override
  String get directionsLocationRequired => '导航需要当前位置';

  @override
  String get directionsNoRoute => '未找到路线';

  @override
  String get directionsOriginYou => '您';

  @override
  String get directionsDestination => '目的地';

  @override
  String get aboutTitle => '关于';

  @override
  String get aboutDefaultDescription => 'Terrava 帮助任何人在造访、搬迁或居住之前了解任何街区。';

  @override
  String aboutVersion(String version) {
    return '版本 $version';
  }

  @override
  String get helpTitle => '帮助';

  @override
  String get helpHowItWorksTitle => 'Terrava 如何运作';

  @override
  String get helpHowItWorksBody =>
      '搜索地球上的任何地点，在地图上探索附近必需设施，打开街区详情查看便利设施评分，并将地点保存到您的账户。';

  @override
  String get helpScoresTitle => '街区评分';

  @override
  String get helpScoresBody =>
      '评分是基于 Google Places 密度、评分和距离的便利/设施估算。它们不是犯罪率、学校质量或官方宜居度评级。';

  @override
  String get privacyBody =>
      'Terrava 将您的账户资料、已保存地点、搜索历史和可选推送令牌存储在具有行级安全性的 Supabase 中。位置在设备上用于通过 Google API 获取附近地点。我们不出售个人数据。如需删除请求，请联系支持。';

  @override
  String get termsBody =>
      'Terrava 提供社区发现工具仅供参考。便利设施评分是估算值，并非安全或宜居性的保证。第三方地图和地点数据可能不完整或过时。请按照适用法律以及 Google Maps / Places 条款使用本应用。';

  @override
  String get errorGenericTitle => '出了点问题';
}
