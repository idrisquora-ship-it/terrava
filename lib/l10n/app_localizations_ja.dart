// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'どんな街でも理解できる';

  @override
  String get navHome => 'ホーム';

  @override
  String get navExplore => '探索';

  @override
  String get navSaved => '保存済み';

  @override
  String get navProfile => 'プロフィール';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonCreate => '作成';

  @override
  String get commonDelete => '削除';

  @override
  String get commonContinue => '続ける';

  @override
  String get commonTryAgain => '再試行';

  @override
  String get commonDirections => '経路';

  @override
  String get commonSave => '保存';

  @override
  String get commonShare => '共有';

  @override
  String get commonSeeAll => 'すべて見る';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get unitsMetric => 'メートル法（km）';

  @override
  String get unitsImperial => 'ヤード・ポンド法（mi）';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsAppearance => '外観';

  @override
  String get settingsUnits => '単位';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsCurrency => '通貨';

  @override
  String get settingsAboutTerrava => 'Terravaについて';

  @override
  String get settingsHelp => 'ヘルプ';

  @override
  String get settingsPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get settingsTermsOfService => '利用規約';

  @override
  String get notificationsPushTitle => 'プッシュ通知';

  @override
  String get notificationsPushSubtitle => '保存した場所、ヒント、アカウントのアラート（Firebase経由）';

  @override
  String get notificationsEnabledTitle => '???????';

  @override
  String get notificationsEnabledBody => 'Terrava??????????????????????????';

  @override
  String get notificationsPlaceSavedTitle => 'Terrava???????';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName????????????????????????????';
  }

  @override
  String get notificationsAreaSavedTitle => '???????????';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName??????????????????????????';
  }

  @override
  String get notificationsWelcomeTitle => 'Terrava?????';

  @override
  String get notificationsWelcomeBody => '?????????????????????????????????';

  @override
  String get notificationsGenericUpdate => '??????????';

  @override
  String get accountDelete => 'アカウントを削除';

  @override
  String get accountDeleteQuestion => 'アカウントを削除しますか？';

  @override
  String get accountDeleteWarning => 'Terravaアカウントと保存データが完全に削除されます。';

  @override
  String get authWelcomeBack => 'おかえりなさい';

  @override
  String get authSignInSubtitle => 'サインインして街を保存し、探索を続けましょう。';

  @override
  String get authEmail => 'メール';

  @override
  String get authPassword => 'パスワード';

  @override
  String get authForgotPassword => 'パスワードをお忘れですか？';

  @override
  String get authSignIn => 'サインイン';

  @override
  String get authSignOut => 'サインアウト';

  @override
  String get authContinueGoogle => 'Googleで続ける';

  @override
  String get authContinueApple => 'Appleで続ける';

  @override
  String get authCreateAccount => 'アカウントを作成';

  @override
  String get authCreateAccountTitle => 'アカウント作成';

  @override
  String get authSignUpSubtitle => 'Terravaに参加して場所を保存し、次の街を計画しましょう。';

  @override
  String get authDisplayName => '表示名';

  @override
  String get authSignUp => '登録';

  @override
  String get authAccountCreated => 'アカウントを作成しました。探索を始められます。';

  @override
  String get authAlreadyHaveAccount => 'すでにアカウントをお持ちですか？サインイン';

  @override
  String get authResetPasswordTitle => 'パスワードをリセット';

  @override
  String get authResetPasswordSubtitle => 'メールアドレスを入力すると、リセットリンクをお送りします。';

  @override
  String get authSendResetLink => 'リセットリンクを送信';

  @override
  String get authBackToSignIn => 'サインインに戻る';

  @override
  String get validationInvalidEmail => '有効なメールアドレスを入力してください';

  @override
  String get validationPasswordMinLength => '6文字以上';

  @override
  String get onboardingDiscoverTitle => 'どんな場所も発見';

  @override
  String get onboardingDiscoverBody => '都市、通り、ランドマーク、座標を検索して、その周辺の暮らしを見てみましょう。';

  @override
  String get onboardingNearbyTitle => '近くにあるものを知る';

  @override
  String get onboardingNearbyBody =>
      'レストラン、病院、学校、銀行、市場、生活必需品 — 実際の判断のために整理されています。';

  @override
  String get onboardingPlanTitle => '明確に計画する';

  @override
  String get onboardingPlanBody => '街を保存し、エリアを比較し、自信を持って行動しましょう — 訪問や移住の前に。';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingGetStarted => 'はじめる';

  @override
  String get homeTagline => 'どんな街の周辺も発見';

  @override
  String get homeSearchHint => '都市、エリア、ランドマークを検索…';

  @override
  String get homeCategoriesTitle => 'カテゴリ';

  @override
  String get homeCategoriesSubtitle => '周辺の必需品';

  @override
  String get homeNearbyTitle => '近く';

  @override
  String get homeNearbySubtitle => 'あなたの近く';

  @override
  String get homeNoNearbyTitle => '近くの場所はまだありません';

  @override
  String get homeNoNearbyMessage => '位置情報を許可するか、検索を試してください。';

  @override
  String get homeRecentlyViewedTitle => '最近閲覧した項目';

  @override
  String get homeRecentlyViewedSubtitle => 'アカウントのアクティビティから';

  @override
  String get homeNoRecentViews => '開いた場所がここに表示されます。';

  @override
  String get homePopularNearbyTitle => '近くの人気';

  @override
  String get homePopularNearbySubtitle => '周辺で高評価の場所';

  @override
  String get locationPermissionNeeded => '近くの場所には位置情報の許可が必要です';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => '現在地を使用しています';

  @override
  String get locationReadError => '位置情報を読み取れません';

  @override
  String get locationNeighborhood => '近隣';

  @override
  String get locationSaveArea => 'エリアを保存';

  @override
  String get locationAreaSaved => 'エリアを保存しました';

  @override
  String get locationNoRadiusResults => 'この範囲に結果がありません';

  @override
  String locationInsightsUnavailable(String error) {
    return 'インサイトを利用できません：$error';
  }

  @override
  String amenityScore(int score) {
    return 'アメニティスコア $score/100';
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
    return '為替：1 $base = $rate $target';
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
    return '$area の日常の利便性スコアは $overall/100（アメニティへのアクセス — 犯罪や公式の住みやすさではありません）。最強：$strongest。最弱：$weakest。$radius km以内：食料品店・薬局 $essentials、健康関連 $health、飲食 $food、交通関連 $transport。';
  }

  @override
  String get scoreEssentials => '必需品';

  @override
  String get scoreHealth => '健康';

  @override
  String get scoreFood => '食事';

  @override
  String get scoreTransport => '交通';

  @override
  String get scoreMoney => '銀行・ATM';

  @override
  String get scoreEducation => '教育';

  @override
  String get scoreFuel => '燃料';

  @override
  String get categoryRestaurants => 'レストラン';

  @override
  String get categoryHotels => 'ホテル';

  @override
  String get categoryHospitals => '病院';

  @override
  String get categoryBanks => '銀行';

  @override
  String get categoryPharmacies => '薬局';

  @override
  String get categorySchools => '学校';

  @override
  String get categorySupermarkets => 'スーパー';

  @override
  String get categoryMarkets => '市場';

  @override
  String get categoryFuel => '燃料';

  @override
  String get categoryNoResultsTitle => '結果なし';

  @override
  String get categoryNoResultsMessage => '別のカテゴリを試すか、地図を移動してください。';

  @override
  String mapClusterPlaces(int count) {
    return '$count 件の場所';
  }

  @override
  String get mapTapToZoom => 'タップして拡大';

  @override
  String get mapSearchArea => 'このエリアを検索';

  @override
  String get mapMyLocation => '現在地';

  @override
  String get savedTitle => '保存済み';

  @override
  String get savedSubtitle => '場所、近隣、コレクションがアカウントに同期されます。';

  @override
  String get savedCollectionsTitle => 'コレクション';

  @override
  String get savedNewCollection => '新規';

  @override
  String get savedNoCollections => 'コレクションはまだありません。';

  @override
  String get savedNeighborhoodsTitle => '近隣';

  @override
  String get savedNoAreas => '保存されたエリアはまだありません。';

  @override
  String get savedPlacesTitle => '場所';

  @override
  String get savedNoPlacesTitle => '保存された場所はありません';

  @override
  String get savedNoPlacesMessage => '詳細からレストランやホテルなどを保存できます。';

  @override
  String get collectionFallbackName => 'コレクション';

  @override
  String get collectionNewTitle => '新しいコレクション';

  @override
  String get collectionNameHint => '名前';

  @override
  String get collectionDeleteTooltip => 'コレクションを削除';

  @override
  String get collectionEmptyTitle => '空のコレクション';

  @override
  String get collectionEmptyMessage => '場所の詳細 → コレクションに保存から場所を追加します。';

  @override
  String get collectionSavedArea => '保存されたエリア';

  @override
  String get collectionCreateFirst => '先に保存済みでコレクションを作成してください';

  @override
  String get collectionAdded => 'コレクションに追加しました';

  @override
  String get areaFallbackName => 'エリア';

  @override
  String get placeFallbackName => '場所';

  @override
  String get placeOpenNow => '営業中';

  @override
  String get placeClosed => '閉店';

  @override
  String get placeSaved => '場所を保存しました';

  @override
  String get placeCollection => 'コレクション';

  @override
  String get placeCall => '電話';

  @override
  String get placeWebsite => 'ウェブサイト';

  @override
  String get placeHours => '営業時間';

  @override
  String get placeReviews => 'レビュー';

  @override
  String get profileTitle => 'プロフィール';

  @override
  String get profileFallbackName => 'トラベラー';

  @override
  String get profileChangePhoto => '写真を変更';

  @override
  String get profileSettingsSubtitle => '単位、言語、通知、法務';

  @override
  String get profilePhotoUpdated => 'プロフィール写真を更新しました';

  @override
  String get searchTitle => '検索';

  @override
  String get searchHint => '国、都市、通り、ランドマーク、緯度,経度';

  @override
  String get searchNoResults => 'その検索の結果はありません';

  @override
  String get searchVoiceTooltip => '音声検索';

  @override
  String get searchVoiceDisabledTooltip => '音声検索（.envで有効化）';

  @override
  String get searchVoiceUnavailable => 'マイク / 音声認識が利用できません';

  @override
  String get searchVoiceEnableInstruction =>
      '.envでENABLE_VOICE_SEARCH=trueを設定して有効化';

  @override
  String get searchRecentTitle => '最近の検索';

  @override
  String get searchNoRecent => '最近の検索はまだありません。';

  @override
  String get searchPopularTitle => '人気の検索';

  @override
  String get searchNoPopular => '人気の検索は実際の利用から表示されます。';

  @override
  String get searchNoSuggestionsTitle => '候補なし';

  @override
  String get searchNoSuggestionsMessage => '都市、ランドマーク、または座標を試してください。';

  @override
  String get directionsLocationRequired => '経路には現在地が必要です';

  @override
  String get directionsNoRoute => 'ルートが見つかりません';

  @override
  String get directionsOriginYou => 'あなた';

  @override
  String get directionsDestination => '目的地';

  @override
  String get aboutTitle => 'について';

  @override
  String get aboutDefaultDescription =>
      'Terravaは、訪問・移住・居住の前に、どんな街でも理解できるようサポートします。';

  @override
  String aboutVersion(String version) {
    return 'バージョン $version';
  }

  @override
  String get helpTitle => 'ヘルプ';

  @override
  String get helpHowItWorksTitle => 'Terravaの仕組み';

  @override
  String get helpHowItWorksBody =>
      '地球上のあらゆる場所を検索し、地図で近くの必需品を探索し、近隣詳細でアメニティスコアを確認し、場所をアカウントに保存できます。';

  @override
  String get helpScoresTitle => '近隣スコア';

  @override
  String get helpScoresBody =>
      'スコアはGoogle Placesの密度、評価、距離に基づく利便性・アメニティの推定です。犯罪、学校の質、公式の住みやすさの評価ではありません。';

  @override
  String get privacyBody =>
      'Terravaは、アカウントプロフィール、保存した場所、検索履歴、オプションのプッシュトークンを、行レベルのセキュリティを備えたSupabaseに保存します。位置情報は端末上でGoogle APIから近くの場所を取得するために使用されます。個人データを販売することはありません。削除のご依頼はサポートまでご連絡ください。';

  @override
  String get termsBody =>
      'Terravaは情報提供を目的とした近隣発見ツールを提供します。アメニティスコアは推定値であり、安全性や住みやすさの保証ではありません。サードパーティの地図・場所データは不完全または古い場合があります。適用法およびGoogle Maps / Placesの利用規約に従ってアプリをご利用ください。';

  @override
  String get errorGenericTitle => '問題が発生しました';
}
