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
