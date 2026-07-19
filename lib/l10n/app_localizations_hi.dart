// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'किसी भी मोहल्ले को समझें';

  @override
  String get navHome => 'होम';

  @override
  String get navExplore => 'एक्सप्लोर';

  @override
  String get navSaved => 'सेव किए गए';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonCreate => 'बनाएँ';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get commonContinue => 'जारी रखें';

  @override
  String get commonTryAgain => 'फिर से कोशिश करें';

  @override
  String get commonDirections => 'दिशा-निर्देश';

  @override
  String get commonSave => 'सेव करें';

  @override
  String get commonShare => 'शेयर करें';

  @override
  String get commonSeeAll => 'सभी देखें';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get unitsMetric => 'मीट्रिक (किमी)';

  @override
  String get unitsImperial => 'इंपीरियल (मील)';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsAppearance => 'दिखावट';

  @override
  String get settingsUnits => 'इकाइयाँ';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsCurrency => 'मुद्रा';

  @override
  String get settingsAboutTerrava => 'Terrava के बारे में';

  @override
  String get settingsHelp => 'सहायता';

  @override
  String get settingsPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get settingsTermsOfService => 'सेवा की शर्तें';

  @override
  String get notificationsPushTitle => 'पुश नोटिफ़िकेशन';

  @override
  String get notificationsPushSubtitle =>
      'सेव किए गए स्थान, सुझाव और खाता अलर्ट Firebase के ज़रिए';

  @override
  String get notificationsEnabledTitle => '??????????? ???? ???';

  @override
  String get notificationsEnabledBody =>
      'Terrava ???? ??? ??? ?? ??????? ?? ???? ?? ????? ?? ???? ??? ????? ?? ???? ???';

  @override
  String get notificationsPlaceSavedTitle => 'Terrava ??? ??? ???? ???';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ???? ???? ??? ??? ??? ??? ????? ?? ??? ??? ?? ??? ??? ?? ??????';
  }

  @override
  String get notificationsAreaSavedTitle => '??????? ??? ?? ???';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ?? ????? ?? ?? ?? ??? ?? ????? ?? ????? ???? ??????';
  }

  @override
  String get notificationsWelcomeTitle => 'Terrava ??? ???? ?????? ??';

  @override
  String get notificationsWelcomeBody =>
      '??????? ????????? ????, ????? ??? ???? ?? ????? ?? ????? ?????? ?????';

  @override
  String get notificationsGenericUpdate => '???? ??? ?? ??? ????? ??';

  @override
  String get accountDelete => 'खाता हटाएँ';

  @override
  String get accountDeleteQuestion => 'खाता हटाएँ?';

  @override
  String get accountDeleteWarning =>
      'इससे आपका Terrava खाता और सेव किया गया डेटा स्थायी रूप से हट जाएगा।';

  @override
  String get authWelcomeBack => 'वापसी पर स्वागत है';

  @override
  String get authSignInSubtitle =>
      'मोहल्ले सेव करने और एक्सप्लोर जारी रखने के लिए साइन इन करें।';

  @override
  String get authEmail => 'ईमेल';

  @override
  String get authPassword => 'पासवर्ड';

  @override
  String get authForgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get authSignIn => 'साइन इन';

  @override
  String get authSignOut => 'साइन आउट';

  @override
  String get authContinueGoogle => 'Google के साथ जारी रखें';

  @override
  String get authContinueApple => 'Apple के साथ जारी रखें';

  @override
  String get authCreateAccount => 'खाता बनाएँ';

  @override
  String get authCreateAccountTitle => 'खाता बनाएँ';

  @override
  String get authSignUpSubtitle =>
      'स्थान सेव करने और अपना अगला मोहल्ला प्लान करने के लिए Terrava से जुड़ें।';

  @override
  String get authDisplayName => 'प्रदर्शित नाम';

  @override
  String get authSignUp => 'साइन अप';

  @override
  String get authAccountCreated =>
      'खाता बन गया। आप एक्सप्लोर शुरू कर सकते हैं।';

  @override
  String get authAlreadyHaveAccount => 'पहले से खाता है? साइन इन करें';

  @override
  String get authResetPasswordTitle => 'पासवर्ड रीसेट करें';

  @override
  String get authResetPasswordSubtitle =>
      'अपना ईमेल दर्ज करें और हम रीसेट लिंक भेजेंगे।';

  @override
  String get authSendResetLink => 'रीसेट लिंक भेजें';

  @override
  String get authBackToSignIn => 'साइन इन पर वापस जाएँ';

  @override
  String get validationInvalidEmail => 'मान्य ईमेल दर्ज करें';

  @override
  String get validationPasswordMinLength => 'कम से कम 6 अक्षर';

  @override
  String get onboardingDiscoverTitle => 'किसी भी जगह को खोजें';

  @override
  String get onboardingDiscoverBody =>
      'शहर, सड़कें, लैंडमार्क या निर्देशांक खोजें और उनके आसपास जीवन कैसा लगता है देखें।';

  @override
  String get onboardingNearbyTitle => 'जानें आसपास क्या है';

  @override
  String get onboardingNearbyBody =>
      'रेस्तराँ, अस्पताल, स्कूल, बैंक, बाज़ार और ज़रूरी चीज़ें — असली फ़ैसलों के लिए व्यवस्थित।';

  @override
  String get onboardingPlanTitle => 'स्पष्टता के साथ प्लान करें';

  @override
  String get onboardingPlanBody =>
      'मोहल्ले सेव करें, क्षेत्रों की तुलना करें, और आत्मविश्वास से आगे बढ़ें — यात्रा या स्थानांतरण से पहले।';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get homeTagline => 'किसी भी मोहल्ले के आसपास क्या है खोजें';

  @override
  String get homeSearchHint => 'शहर, क्षेत्र, लैंडमार्क खोजें…';

  @override
  String get homeCategoriesTitle => 'श्रेणियाँ';

  @override
  String get homeCategoriesSubtitle => 'आपके आसपास की ज़रूरतें';

  @override
  String get homeNearbyTitle => 'आसपास';

  @override
  String get homeNearbySubtitle => 'आपके पास';

  @override
  String get homeNoNearbyTitle => 'अभी आसपास कोई स्थान नहीं';

  @override
  String get homeNoNearbyMessage => 'लोकेशन की अनुमति दें या खोज आज़माएँ।';

  @override
  String get homeRecentlyViewedTitle => 'हाल ही में देखे गए';

  @override
  String get homeRecentlyViewedSubtitle => 'आपके खाते की गतिविधि से';

  @override
  String get homeNoRecentViews => 'आप जो स्थान खोलेंगे वे यहाँ दिखेंगे।';

  @override
  String get homePopularNearbyTitle => 'आसपास लोकप्रिय';

  @override
  String get homePopularNearbySubtitle => 'आपके आसपास उच्च रेटेड';

  @override
  String get locationPermissionNeeded =>
      'आसपास के स्थानों के लिए लोकेशन अनुमति आवश्यक';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'आपकी वर्तमान लोकेशन उपयोग हो रही है';

  @override
  String get locationReadError => 'लोकेशन पढ़ने में असमर्थ';

  @override
  String get locationNeighborhood => 'मोहल्ला';

  @override
  String get locationSaveArea => 'क्षेत्र सेव करें';

  @override
  String get locationAreaSaved => 'क्षेत्र सेव हो गया';

  @override
  String get locationNoRadiusResults => 'इस दायरे में कोई परिणाम नहीं';

  @override
  String locationInsightsUnavailable(String error) {
    return 'इनसाइट उपलब्ध नहीं: $error';
  }

  @override
  String amenityScore(int score) {
    return 'सुविधा स्कोर $score/100';
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
    return '$temp°C · $condition · महसूस $feelsLike°C · आर्द्रता $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'विनिमय: 1 $base = $rate $target';
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
    return '$area रोज़मर्रा की सुविधा के लिए $overall/100 स्कोर करता है (सुविधा पहुँच — अपराध या आधिकारिक रहने-योग्यता नहीं)। सबसे मज़बूत: $strongest। सबसे कमज़ोर: $weakest। $radius किमी के भीतर: $essentials किराना/फार्मेसी विकल्प, $health स्वास्थ्य संबंधी स्थान, $food भोजन स्थान, $transport परिवहन संबंधी स्थान।';
  }

  @override
  String get scoreEssentials => 'ज़रूरी सुविधाएँ';

  @override
  String get scoreHealth => 'स्वास्थ्य';

  @override
  String get scoreFood => 'भोजन';

  @override
  String get scoreTransport => 'परिवहन';

  @override
  String get scoreMoney => 'बैंक और ATM';

  @override
  String get scoreEducation => 'शिक्षा';

  @override
  String get scoreFuel => 'ईंधन';

  @override
  String get categoryRestaurants => 'रेस्तराँ';

  @override
  String get categoryHotels => 'होटल';

  @override
  String get categoryHospitals => 'अस्पताल';

  @override
  String get categoryBanks => 'बैंक';

  @override
  String get categoryPharmacies => 'फार्मेसी';

  @override
  String get categorySchools => 'स्कूल';

  @override
  String get categorySupermarkets => 'सुपरमार्केट';

  @override
  String get categoryMarkets => 'बाज़ार';

  @override
  String get categoryFuel => 'ईंधन';

  @override
  String get categoryNoResultsTitle => 'कोई परिणाम नहीं';

  @override
  String get categoryNoResultsMessage => 'दूसरी श्रेणी आज़माएँ या मैप हिलाएँ।';

  @override
  String mapClusterPlaces(int count) {
    return '$count स्थान';
  }

  @override
  String get mapTapToZoom => 'ज़ूम करने के लिए टैप करें';

  @override
  String get mapSearchArea => 'इस क्षेत्र में खोजें';

  @override
  String get mapMyLocation => 'मेरी लोकेशन';

  @override
  String get savedTitle => 'सेव किए गए';

  @override
  String get savedSubtitle => 'स्थान, मोहल्ले और कलेक्शन आपके खाते से सिंक।';

  @override
  String get savedCollectionsTitle => 'कलेक्शन';

  @override
  String get savedNewCollection => 'नया';

  @override
  String get savedNoCollections => 'अभी कोई कलेक्शन नहीं।';

  @override
  String get savedNeighborhoodsTitle => 'मोहल्ले';

  @override
  String get savedNoAreas => 'अभी कोई सेव क्षेत्र नहीं।';

  @override
  String get savedPlacesTitle => 'स्थान';

  @override
  String get savedNoPlacesTitle => 'कोई सेव स्थान नहीं';

  @override
  String get savedNoPlacesMessage =>
      'विवरण से रेस्तराँ, होटल और अधिक सेव करें।';

  @override
  String get collectionFallbackName => 'कलेक्शन';

  @override
  String get collectionNewTitle => 'नया कलेक्शन';

  @override
  String get collectionNameHint => 'नाम';

  @override
  String get collectionDeleteTooltip => 'कलेक्शन हटाएँ';

  @override
  String get collectionEmptyTitle => 'खाली कलेक्शन';

  @override
  String get collectionEmptyMessage =>
      'स्थान विवरण → कलेक्शन में सेव से स्थान जोड़ें।';

  @override
  String get collectionSavedArea => 'सेव क्षेत्र';

  @override
  String get collectionCreateFirst => 'पहले सेव में एक कलेक्शन बनाएँ';

  @override
  String get collectionAdded => 'कलेक्शन में जोड़ा गया';

  @override
  String get areaFallbackName => 'क्षेत्र';

  @override
  String get placeFallbackName => 'स्थान';

  @override
  String get placeOpenNow => 'अभी खुला';

  @override
  String get placeClosed => 'बंद';

  @override
  String get placeSaved => 'स्थान सेव हो गया';

  @override
  String get placeCollection => 'कलेक्शन';

  @override
  String get placeCall => 'कॉल करें';

  @override
  String get placeWebsite => 'वेबसाइट';

  @override
  String get placeHours => 'समय';

  @override
  String get placeReviews => 'समीक्षाएँ';

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get profileFallbackName => 'यात्री';

  @override
  String get profileChangePhoto => 'फ़ोटो बदलें';

  @override
  String get profileSettingsSubtitle => 'इकाइयाँ, भाषा, नोटिफ़िकेशन, कानूनी';

  @override
  String get profilePhotoUpdated => 'प्रोफ़ाइल फ़ोटो अपडेट हो गई';

  @override
  String get searchTitle => 'खोज';

  @override
  String get searchHint => 'देश, शहर, सड़क, लैंडमार्क, अक्षांश,देशांतर';

  @override
  String get searchNoResults => 'उस खोज के लिए कोई परिणाम नहीं';

  @override
  String get searchVoiceTooltip => 'वॉइस सर्च';

  @override
  String get searchVoiceDisabledTooltip => 'वॉइस सर्च (.env में सक्षम करें)';

  @override
  String get searchVoiceUnavailable => 'माइक्रोफ़ोन / स्पीच उपलब्ध नहीं';

  @override
  String get searchVoiceEnableInstruction =>
      'सक्षम करने के लिए .env में ENABLE_VOICE_SEARCH=true सेट करें';

  @override
  String get searchRecentTitle => 'हाल की खोजें';

  @override
  String get searchNoRecent => 'अभी कोई हाल की खोज नहीं।';

  @override
  String get searchPopularTitle => 'लोकप्रिय खोजें';

  @override
  String get searchNoPopular => 'लोकप्रिय खोजें वास्तविक उपयोग से दिखेंगी।';

  @override
  String get searchNoSuggestionsTitle => 'कोई सुझाव नहीं';

  @override
  String get searchNoSuggestionsMessage =>
      'शहर, लैंडमार्क या निर्देशांक आज़माएँ।';

  @override
  String get directionsLocationRequired =>
      'दिशा-निर्देशों के लिए वर्तमान लोकेशन आवश्यक';

  @override
  String get directionsNoRoute => 'कोई रूट नहीं मिला';

  @override
  String get directionsOriginYou => 'आप';

  @override
  String get directionsDestination => 'गंतव्य';

  @override
  String get aboutTitle => 'परिचय';

  @override
  String get aboutDefaultDescription =>
      'Terrava किसी भी व्यक्ति को किसी भी मोहल्ले को समझने में मदद करता है — यात्रा, स्थानांतरण या रहने से पहले।';

  @override
  String aboutVersion(String version) {
    return 'संस्करण $version';
  }

  @override
  String get helpTitle => 'सहायता';

  @override
  String get helpHowItWorksTitle => 'Terrava कैसे काम करता है';

  @override
  String get helpHowItWorksBody =>
      'पृथ्वी पर कोई भी स्थान खोजें, मैप पर आसपास की ज़रूरतें देखें, सुविधा स्कोर के लिए मोहल्ला विवरण खोलें, और अपने खाते में स्थान सेव करें।';

  @override
  String get helpScoresTitle => 'मोहल्ला स्कोर';

  @override
  String get helpScoresBody =>
      'स्कोर Google Places घनत्व, रेटिंग और दूरी से सुविधा/सुविधा अनुमान हैं। वे अपराध, स्कूल गुणवत्ता या आधिकारिक रहने-योग्यता रेटिंग नहीं हैं।';

  @override
  String get privacyBody =>
      'Terrava आपका खाता प्रोफ़ाइल, सहेजे गए स्थान, खोज इतिहास और वैकल्पिक पुश टोकन Supabase में पंक्ति-स्तरीय सुरक्षा के साथ संग्रहीत करता है। लोकेशन डिवाइस पर Google APIs से आसपास के स्थान लाने के लिए उपयोग होती है। हम व्यक्तिगत डेटा नहीं बेचते। हटाने के अनुरोधों के लिए सपोर्ट से संपर्क करें।';

  @override
  String get termsBody =>
      'Terrava सूचनात्मक उद्देश्यों के लिए पड़ोस खोज उपकरण प्रदान करता है। सुविधा स्कोर अनुमान हैं, सुरक्षा या रहन-सहन की गारंटी नहीं। तृतीय-पक्ष मानचित्र और स्थान डेटा अधूरा या पुराना हो सकता है। ऐप का उपयोग लागू कानूनों और Google Maps / Places शर्तों के अनुसार करें।';

  @override
  String get errorGenericTitle => 'कुछ गलत हो गया';
}
