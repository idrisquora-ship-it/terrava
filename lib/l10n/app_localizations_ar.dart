// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'افهم أي حيّ';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navExplore => 'استكشف';

  @override
  String get navSaved => 'المحفوظات';

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonCreate => 'إنشاء';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonTryAgain => 'حاول مرة أخرى';

  @override
  String get commonDirections => 'الاتجاهات';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonShare => 'مشاركة';

  @override
  String get commonSeeAll => 'عرض الكل';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get unitsMetric => 'متري (كم)';

  @override
  String get unitsImperial => 'إمبراطوري (ميل)';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsUnits => 'الوحدات';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsCurrency => 'العملة';

  @override
  String get settingsAboutTerrava => 'حول Terrava';

  @override
  String get settingsHelp => 'المساعدة';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsTermsOfService => 'شروط الخدمة';

  @override
  String get notificationsPushTitle => 'إشعارات الدفع';

  @override
  String get notificationsPushSubtitle =>
      'الأماكن المحفوظة والنصائح وتنبيهات الحساب عبر Firebase';

  @override
  String get notificationsEnabledTitle => '?? ????? ?????????';

  @override
  String get notificationsEnabledBody =>
      '???? ?? Terrava ?????? ???? ??????? ???????? ???????? ??????.';

  @override
  String get notificationsPlaceSavedTitle => '?? ????? ?? Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName ????? ?? ??????. ???? ????????? ?? ?? ??? ?????? ????.';
  }

  @override
  String get notificationsAreaSavedTitle => '?? ??? ?????';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName ???? ????? ???? ?? ?????? ??????? ??? ????.';
  }

  @override
  String get notificationsWelcomeTitle => '?????? ?? ?? Terrava';

  @override
  String get notificationsWelcomeBody =>
      '?????? ???????? ????? ???????? ????? ??? ??? ??????? ?????? ???.';

  @override
  String get notificationsGenericUpdate => '???? ????? ????';

  @override
  String get accountDelete => 'حذف الحساب';

  @override
  String get accountDeleteQuestion => 'حذف الحساب؟';

  @override
  String get accountDeleteWarning =>
      'يؤدي هذا إلى حذف حساب Terrava وبياناتك المحفوظة نهائياً.';

  @override
  String get authWelcomeBack => 'مرحباً بعودتك';

  @override
  String get authSignInSubtitle =>
      'سجّل الدخول لحفظ الأحياء ومتابعة الاستكشاف.';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authPassword => 'كلمة المرور';

  @override
  String get authForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get authSignIn => 'تسجيل الدخول';

  @override
  String get authSignOut => 'تسجيل الخروج';

  @override
  String get authContinueGoogle => 'المتابعة مع Google';

  @override
  String get authContinueApple => 'المتابعة مع Apple';

  @override
  String get authCreateAccount => 'إنشاء حساب';

  @override
  String get authCreateAccountTitle => 'إنشاء حساب';

  @override
  String get authSignUpSubtitle =>
      'انضم إلى Terrava لحفظ الأماكن وتخطيط حيّك القادم.';

  @override
  String get authDisplayName => 'اسم العرض';

  @override
  String get authSignUp => 'إنشاء حساب';

  @override
  String get authAccountCreated => 'تم إنشاء الحساب. يمكنك البدء بالاستكشاف.';

  @override
  String get authAlreadyHaveAccount => 'لديك حساب بالفعل؟ سجّل الدخول';

  @override
  String get authResetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get authResetPasswordSubtitle =>
      'أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة التعيين.';

  @override
  String get authSendResetLink => 'إرسال رابط إعادة التعيين';

  @override
  String get authBackToSignIn => 'العودة لتسجيل الدخول';

  @override
  String get validationInvalidEmail => 'أدخل بريداً إلكترونياً صالحاً';

  @override
  String get validationPasswordMinLength => '٦ أحرف على الأقل';

  @override
  String get onboardingDiscoverTitle => 'اكتشف أي مكان';

  @override
  String get onboardingDiscoverBody =>
      'ابحث عن مدن أو شوارع أو معالم أو إحداثيات وشاهد كيف تبدو الحياة من حولها.';

  @override
  String get onboardingNearbyTitle => 'اعرف ما حولك';

  @override
  String get onboardingNearbyBody =>
      'مطاعم ومستشفيات ومدارس وبنوك وأسواق وأساسيات — منظمة لاتخاذ قرارات حقيقية.';

  @override
  String get onboardingPlanTitle => 'خطّط بوضوح';

  @override
  String get onboardingPlanBody =>
      'احفظ الأحياء، قارن المناطق، وانتقل بثقة — قبل الزيارة أو الانتقال.';

  @override
  String get onboardingSkip => 'تخطّي';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get homeTagline => 'اكتشف ما يحيط بأي حيّ';

  @override
  String get homeSearchHint => 'ابحث عن مدينة أو منطقة أو معلم…';

  @override
  String get homeCategoriesTitle => 'الفئات';

  @override
  String get homeCategoriesSubtitle => 'الأساسيات من حولك';

  @override
  String get homeNearbyTitle => 'بالقرب';

  @override
  String get homeNearbySubtitle => 'قريب منك';

  @override
  String get homeNoNearbyTitle => 'لا توجد أماكن قريبة بعد';

  @override
  String get homeNoNearbyMessage => 'اسمح بالموقع أو جرّب البحث.';

  @override
  String get homeRecentlyViewedTitle => 'شوهدت مؤخراً';

  @override
  String get homeRecentlyViewedSubtitle => 'من نشاط حسابك';

  @override
  String get homeNoRecentViews => 'ستظهر هنا الأماكن التي تفتحها.';

  @override
  String get homePopularNearbyTitle => 'الأكثر شعبية بالقرب';

  @override
  String get homePopularNearbySubtitle => 'تقييمات عالية من حولك';

  @override
  String get locationPermissionNeeded => 'يلزم إذن الموقع للأماكن القريبة';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'جارٍ استخدام موقعك الحالي';

  @override
  String get locationReadError => 'تعذّر قراءة الموقع';

  @override
  String get locationNeighborhood => 'الحيّ';

  @override
  String get locationSaveArea => 'حفظ المنطقة';

  @override
  String get locationAreaSaved => 'تم حفظ المنطقة';

  @override
  String get locationNoRadiusResults => 'لا توجد نتائج ضمن هذا النطاق';

  @override
  String locationInsightsUnavailable(String error) {
    return 'التحليلات غير متاحة: $error';
  }

  @override
  String amenityScore(int score) {
    return 'درجة المرافق $score/100';
  }

  @override
  String weatherSummary(
      int temp, String condition, int feelsLike, int humidity) {
    return '$temp°م · $condition · الإحساس $feelsLike°م · الرطوبة $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'سعر الصرف: 1 $base = $rate $target';
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
    return 'تحصل $area على $overall/100 لراحة الحياة اليومية (الوصول للمرافق — وليس الجريمة أو قابلية العيش الرسمية). الأقوى: $strongest. الأضعف: $weakest. ضمن $radius كم: $essentials خيارات بقالة/صيدلية، $health أماكن صحية، $food أماكن طعام، $transport أماكن نقل.';
  }

  @override
  String get scoreEssentials => 'الأساسيات';

  @override
  String get scoreHealth => 'الصحة';

  @override
  String get scoreFood => 'الطعام';

  @override
  String get scoreTransport => 'النقل';

  @override
  String get scoreMoney => 'البنوك وأجهزة الصراف';

  @override
  String get scoreEducation => 'التعليم';

  @override
  String get scoreFuel => 'الوقود';

  @override
  String get categoryRestaurants => 'المطاعم';

  @override
  String get categoryHotels => 'الفنادق';

  @override
  String get categoryHospitals => 'المستشفيات';

  @override
  String get categoryBanks => 'البنوك';

  @override
  String get categoryPharmacies => 'الصيدليات';

  @override
  String get categorySchools => 'المدارس';

  @override
  String get categorySupermarkets => 'السوبرماركت';

  @override
  String get categoryMarkets => 'الأسواق';

  @override
  String get categoryFuel => 'الوقود';

  @override
  String get categoryNoResultsTitle => 'لا توجد نتائج';

  @override
  String get categoryNoResultsMessage => 'جرّب فئة أخرى أو حرّك الخريطة.';

  @override
  String mapClusterPlaces(int count) {
    return '$count أماكن';
  }

  @override
  String get mapTapToZoom => 'اضغط للتكبير';

  @override
  String get mapSearchArea => 'البحث في هذه المنطقة';

  @override
  String get mapMyLocation => 'موقعي';

  @override
  String get savedTitle => 'المحفوظات';

  @override
  String get savedSubtitle => 'أماكن وأحياء ومجموعات متزامنة مع حسابك.';

  @override
  String get savedCollectionsTitle => 'المجموعات';

  @override
  String get savedNewCollection => 'جديد';

  @override
  String get savedNoCollections => 'لا توجد مجموعات بعد.';

  @override
  String get savedNeighborhoodsTitle => 'الأحياء';

  @override
  String get savedNoAreas => 'لا توجد مناطق محفوظة بعد.';

  @override
  String get savedPlacesTitle => 'الأماكن';

  @override
  String get savedNoPlacesTitle => 'لا توجد أماكن محفوظة';

  @override
  String get savedNoPlacesMessage =>
      'احفظ المطاعم والفنادق والمزيد من صفحة التفاصيل.';

  @override
  String get collectionFallbackName => 'مجموعة';

  @override
  String get collectionNewTitle => 'مجموعة جديدة';

  @override
  String get collectionNameHint => 'الاسم';

  @override
  String get collectionDeleteTooltip => 'حذف المجموعة';

  @override
  String get collectionEmptyTitle => 'مجموعة فارغة';

  @override
  String get collectionEmptyMessage =>
      'أضف أماكن من تفاصيل المكان ← حفظ في مجموعة.';

  @override
  String get collectionSavedArea => 'منطقة محفوظة';

  @override
  String get collectionCreateFirst => 'أنشئ مجموعة في المحفوظات أولاً';

  @override
  String get collectionAdded => 'تمت الإضافة إلى المجموعة';

  @override
  String get areaFallbackName => 'منطقة';

  @override
  String get placeFallbackName => 'مكان';

  @override
  String get placeOpenNow => 'مفتوح الآن';

  @override
  String get placeClosed => 'مغلق';

  @override
  String get placeSaved => 'تم حفظ المكان';

  @override
  String get placeCollection => 'مجموعة';

  @override
  String get placeCall => 'اتصال';

  @override
  String get placeWebsite => 'الموقع الإلكتروني';

  @override
  String get placeHours => 'ساعات العمل';

  @override
  String get placeReviews => 'المراجعات';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get profileFallbackName => 'مسافر';

  @override
  String get profileChangePhoto => 'تغيير الصورة';

  @override
  String get profileSettingsSubtitle => 'الوحدات واللغة والإشعارات والقانوني';

  @override
  String get profilePhotoUpdated => 'تم تحديث صورة الملف الشخصي';

  @override
  String get searchTitle => 'بحث';

  @override
  String get searchHint => 'بلد، مدينة، شارع، معلم، خط عرض،خط طول';

  @override
  String get searchNoResults => 'لا توجد نتائج لهذا البحث';

  @override
  String get searchVoiceTooltip => 'البحث الصوتي';

  @override
  String get searchVoiceDisabledTooltip => 'البحث الصوتي (فعّله في .env)';

  @override
  String get searchVoiceUnavailable => 'الميكروفون / الكلام غير متاح';

  @override
  String get searchVoiceEnableInstruction =>
      'اضبط ENABLE_VOICE_SEARCH=true في .env للتفعيل';

  @override
  String get searchRecentTitle => 'عمليات البحث الأخيرة';

  @override
  String get searchNoRecent => 'لا توجد عمليات بحث حديثة بعد.';

  @override
  String get searchPopularTitle => 'عمليات البحث الشائعة';

  @override
  String get searchNoPopular =>
      'ستظهر عمليات البحث الشائعة من الاستخدام الفعلي.';

  @override
  String get searchNoSuggestionsTitle => 'لا اقتراحات';

  @override
  String get searchNoSuggestionsMessage => 'جرّب مدينة أو معلماً أو إحداثيات.';

  @override
  String get directionsLocationRequired => 'الموقع الحالي مطلوب للاتجاهات';

  @override
  String get directionsNoRoute => 'لم يُعثر على مسار';

  @override
  String get directionsOriginYou => 'أنت';

  @override
  String get directionsDestination => 'الوجهة';

  @override
  String get aboutTitle => 'حول';

  @override
  String get aboutDefaultDescription =>
      'يساعد Terrava أي شخص على فهم أي حيّ قبل زيارته أو الانتقال إليه أو العيش فيه.';

  @override
  String aboutVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get helpTitle => 'المساعدة';

  @override
  String get helpHowItWorksTitle => 'كيف يعمل Terrava';

  @override
  String get helpHowItWorksBody =>
      'ابحث عن أي مكان على الأرض، واستكشف الأساسيات القريبة على الخريطة، وافتح تفاصيل الحي لدرجات المرافق، واحفظ الأماكن في حسابك.';

  @override
  String get helpScoresTitle => 'درجات الحيّ';

  @override
  String get helpScoresBody =>
      'الدرجات تقديرات للراحة/المرافق من كثافة Google Places والتقييمات والمسافة. ليست مؤشرات للجريمة أو جودة المدارس أو قابلية العيش الرسمية.';

  @override
  String get privacyBody =>
      'يخزّن Terrava ملف حسابك والأماكن المحفوظة وسجل البحث ورموز الإشعارات الاختيارية في Supabase مع أمان على مستوى الصفوف. يُستخدم الموقع على الجهاز لجلب الأماكن القريبة من واجهات Google. نحن لا نبيع البيانات الشخصية. تواصل مع الدعم لطلبات الحذف.';

  @override
  String get termsBody =>
      'يوفر Terrava أدوات اكتشاف الأحياء لأغراض معلوماتية. درجات المرافق تقديرات وليست ضمانات للسلامة أو جودة المعيشة. قد تكون بيانات الخرائط والأماكن من أطراف ثالثة غير مكتملة أو قديمة. استخدم التطبيق وفق القوانين المعمول بها وشروط Google Maps / Places.';

  @override
  String get errorGenericTitle => 'حدث خطأ ما';
}
