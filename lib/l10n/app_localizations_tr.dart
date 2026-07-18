// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Her mahalleyi anlayın';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navExplore => 'Keşfet';

  @override
  String get navSaved => 'Kaydedilenler';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonCreate => 'Oluştur';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonContinue => 'Devam';

  @override
  String get commonTryAgain => 'Tekrar dene';

  @override
  String get commonDirections => 'Yol tarifi';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonShare => 'Paylaş';

  @override
  String get commonSeeAll => 'Tümünü gör';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get unitsMetric => 'Metrik (km)';

  @override
  String get unitsImperial => 'İmparatorluk (mi)';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsAppearance => 'Görünüm';

  @override
  String get settingsUnits => 'Birimler';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsCurrency => 'Para birimi';

  @override
  String get settingsAboutTerrava => 'Terrava hakkında';

  @override
  String get settingsHelp => 'Yardım';

  @override
  String get settingsPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get settingsTermsOfService => 'Hizmet Şartları';

  @override
  String get notificationsPushTitle => 'Anlık bildirimler';

  @override
  String get notificationsPushSubtitle =>
      'Kaydedilen yerler, ipuçları ve hesap uyarıları Firebase ile';

  @override
  String get notificationsEnabledTitle => 'Bildirimler a??k';

  @override
  String get notificationsEnabledBody =>
      'Terrava, kaydedilen yerler ve hesap g?ncellemeleri hakk?nda sizi uyarabilir.';

  @override
  String get notificationsPlaceSavedTitle => 'Terrava\'ya kaydedildi';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName listenizde. Yeniden bakmak i?in istedi?iniz zaman Kaydedilenler\'i a??n.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Mahalle kaydedildi';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName, puanlar? tekrar kar??la?t?rmak istedi?inizde haz?r.';
  }

  @override
  String get notificationsWelcomeTitle => 'Terrava\'ya ho? geldiniz';

  @override
  String get notificationsWelcomeBody =>
      'Mahalleleri ke?fedin, yerleri kaydedin ve yak?ndaki puan ?ng?r?lerini al?n.';

  @override
  String get notificationsGenericUpdate => 'Yeni bir g?ncellemeniz var';

  @override
  String get accountDelete => 'Hesabı sil';

  @override
  String get accountDeleteQuestion => 'Hesap silinsin mi?';

  @override
  String get accountDeleteWarning =>
      'Bu, Terrava hesabınızı ve kaydedilen verileri kalıcı olarak siler.';

  @override
  String get authWelcomeBack => 'Tekrar hoş geldiniz';

  @override
  String get authSignInSubtitle =>
      'Mahalleleri kaydetmek ve keşfe devam etmek için giriş yapın.';

  @override
  String get authEmail => 'E-posta';

  @override
  String get authPassword => 'Şifre';

  @override
  String get authForgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get authSignIn => 'Giriş yap';

  @override
  String get authSignOut => 'Çıkış yap';

  @override
  String get authContinueGoogle => 'Google ile devam et';

  @override
  String get authContinueApple => 'Apple ile devam et';

  @override
  String get authCreateAccount => 'Hesap oluştur';

  @override
  String get authCreateAccountTitle => 'Hesap oluştur';

  @override
  String get authSignUpSubtitle =>
      'Yerleri kaydetmek ve bir sonraki mahallenizi planlamak için Terrava\'ya katılın.';

  @override
  String get authDisplayName => 'Görünen ad';

  @override
  String get authSignUp => 'Kaydol';

  @override
  String get authAccountCreated =>
      'Hesap oluşturuldu. Keşfetmeye başlayabilirsiniz.';

  @override
  String get authAlreadyHaveAccount => 'Zaten hesabınız var mı? Giriş yapın';

  @override
  String get authResetPasswordTitle => 'Şifreyi sıfırla';

  @override
  String get authResetPasswordSubtitle =>
      'E-postanızı girin, size sıfırlama bağlantısı gönderelim.';

  @override
  String get authSendResetLink => 'Sıfırlama bağlantısı gönder';

  @override
  String get authBackToSignIn => 'Girişe dön';

  @override
  String get validationInvalidEmail => 'Geçerli bir e-posta girin';

  @override
  String get validationPasswordMinLength => 'En az 6 karakter';

  @override
  String get onboardingDiscoverTitle => 'Her yeri keşfedin';

  @override
  String get onboardingDiscoverBody =>
      'Şehirleri, sokakları, simge yapıları veya koordinatları arayın ve çevredeki hayatı görün.';

  @override
  String get onboardingNearbyTitle => 'Yakında ne olduğunu bilin';

  @override
  String get onboardingNearbyBody =>
      'Restoranlar, hastaneler, okullar, bankalar, pazarlar ve ihtiyaçlar — gerçek kararlar için düzenlenmiş.';

  @override
  String get onboardingPlanTitle => 'Netlikle planlayın';

  @override
  String get onboardingPlanBody =>
      'Mahalleleri kaydedin, bölgeleri karşılaştırın ve güvenle ilerleyin — ziyaret veya taşınmadan önce.';

  @override
  String get onboardingSkip => 'Atla';

  @override
  String get onboardingGetStarted => 'Başla';

  @override
  String get homeTagline => 'Her mahallenin çevresinde ne olduğunu keşfedin';

  @override
  String get homeSearchHint => 'Şehir, bölge, simge yapı ara…';

  @override
  String get homeCategoriesTitle => 'Kategoriler';

  @override
  String get homeCategoriesSubtitle => 'Çevrenizdeki ihtiyaçlar';

  @override
  String get homeNearbyTitle => 'Yakında';

  @override
  String get homeNearbySubtitle => 'Size yakın';

  @override
  String get homeNoNearbyTitle => 'Henüz yakında yer yok';

  @override
  String get homeNoNearbyMessage => 'Konuma izin verin veya Aramayı deneyin.';

  @override
  String get homeRecentlyViewedTitle => 'Son görüntülenenler';

  @override
  String get homeRecentlyViewedSubtitle => 'Hesap etkinliğinizden';

  @override
  String get homeNoRecentViews => 'Açtığınız yerler burada görünür.';

  @override
  String get homePopularNearbyTitle => 'Yakında popüler';

  @override
  String get homePopularNearbySubtitle => 'Çevrenizde yüksek puanlı';

  @override
  String get locationPermissionNeeded =>
      'Yakındaki yerler için konum izni gerekli';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Mevcut konumunuz kullanılıyor';

  @override
  String get locationReadError => 'Konum okunamadı';

  @override
  String get locationNeighborhood => 'Mahalle';

  @override
  String get locationSaveArea => 'Bölgeyi kaydet';

  @override
  String get locationAreaSaved => 'Bölge kaydedildi';

  @override
  String get locationNoRadiusResults => 'Bu yarıçapta sonuç yok';

  @override
  String locationInsightsUnavailable(String error) {
    return 'İçgörüler kullanılamıyor: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Olanak skoru $score/100';
  }

  @override
  String weatherSummary(
      int temp, String condition, int feelsLike, int humidity) {
    return '$temp°C · $condition · hissedilen $feelsLike°C · nem $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'Kur: 1 $base = $rate $target';
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
    return '$area günlük kolaylık için $overall/100 puan alıyor (olanak erişimi — suç veya resmi yaşanabilirlik değil). En güçlü: $strongest. En zayıf: $weakest. $radius km içinde: $essentials market/eczane seçeneği, $health sağlıkla ilgili yer, $food yemek yeri, $transport ulaşımla ilgili yer.';
  }

  @override
  String get scoreEssentials => 'İhtiyaçlar';

  @override
  String get scoreHealth => 'Sağlık';

  @override
  String get scoreFood => 'Yemek';

  @override
  String get scoreTransport => 'Ulaşım';

  @override
  String get scoreMoney => 'Bankalar ve ATM\'ler';

  @override
  String get scoreEducation => 'Eğitim';

  @override
  String get scoreFuel => 'Yakıt';

  @override
  String get categoryRestaurants => 'Restoranlar';

  @override
  String get categoryHotels => 'Oteller';

  @override
  String get categoryHospitals => 'Hastaneler';

  @override
  String get categoryBanks => 'Bankalar';

  @override
  String get categoryPharmacies => 'Eczaneler';

  @override
  String get categorySchools => 'Okullar';

  @override
  String get categorySupermarkets => 'Süpermarketler';

  @override
  String get categoryMarkets => 'Pazarlar';

  @override
  String get categoryFuel => 'Yakıt';

  @override
  String get categoryNoResultsTitle => 'Sonuç yok';

  @override
  String get categoryNoResultsMessage =>
      'Başka bir kategori deneyin veya haritayı kaydırın.';

  @override
  String mapClusterPlaces(int count) {
    return '$count yer';
  }

  @override
  String get mapTapToZoom => 'Yakınlaştırmak için dokunun';

  @override
  String get mapSearchArea => 'Bu alanı ara';

  @override
  String get mapMyLocation => 'Konumum';

  @override
  String get savedTitle => 'Kaydedilenler';

  @override
  String get savedSubtitle =>
      'Yerler, mahalleler ve koleksiyonlar hesabınıza senkronize edilir.';

  @override
  String get savedCollectionsTitle => 'Koleksiyonlar';

  @override
  String get savedNewCollection => 'Yeni';

  @override
  String get savedNoCollections => 'Henüz koleksiyon yok.';

  @override
  String get savedNeighborhoodsTitle => 'Mahalleler';

  @override
  String get savedNoAreas => 'Henüz kaydedilmiş bölge yok.';

  @override
  String get savedPlacesTitle => 'Yerler';

  @override
  String get savedNoPlacesTitle => 'Kaydedilmiş yer yok';

  @override
  String get savedNoPlacesMessage =>
      'Ayrıntılardan restoran, otel ve daha fazlasını kaydedin.';

  @override
  String get collectionFallbackName => 'Koleksiyon';

  @override
  String get collectionNewTitle => 'Yeni koleksiyon';

  @override
  String get collectionNameHint => 'Ad';

  @override
  String get collectionDeleteTooltip => 'Koleksiyonu sil';

  @override
  String get collectionEmptyTitle => 'Boş koleksiyon';

  @override
  String get collectionEmptyMessage =>
      'Yer Ayrıntıları → Koleksiyona kaydet ile yer ekleyin.';

  @override
  String get collectionSavedArea => 'Kaydedilen bölge';

  @override
  String get collectionCreateFirst =>
      'Önce Kaydedilenler\'de bir koleksiyon oluşturun';

  @override
  String get collectionAdded => 'Koleksiyona eklendi';

  @override
  String get areaFallbackName => 'Bölge';

  @override
  String get placeFallbackName => 'Yer';

  @override
  String get placeOpenNow => 'Şu an açık';

  @override
  String get placeClosed => 'Kapalı';

  @override
  String get placeSaved => 'Yer kaydedildi';

  @override
  String get placeCollection => 'Koleksiyon';

  @override
  String get placeCall => 'Ara';

  @override
  String get placeWebsite => 'Web sitesi';

  @override
  String get placeHours => 'Saatler';

  @override
  String get placeReviews => 'Yorumlar';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileFallbackName => 'Gezgin';

  @override
  String get profileChangePhoto => 'Fotoğrafı değiştir';

  @override
  String get profileSettingsSubtitle => 'Birimler, dil, bildirimler, yasal';

  @override
  String get profilePhotoUpdated => 'Profil fotoğrafı güncellendi';

  @override
  String get searchTitle => 'Ara';

  @override
  String get searchHint => 'Ülke, şehir, sokak, simge yapı, enlem,boylam';

  @override
  String get searchNoResults => 'Bu arama için sonuç yok';

  @override
  String get searchVoiceTooltip => 'Sesli arama';

  @override
  String get searchVoiceDisabledTooltip =>
      'Sesli arama (.env\'de etkinleştirin)';

  @override
  String get searchVoiceUnavailable => 'Mikrofon / konuşma kullanılamıyor';

  @override
  String get searchVoiceEnableInstruction =>
      'Etkinleştirmek için .env\'de ENABLE_VOICE_SEARCH=true ayarlayın';

  @override
  String get searchRecentTitle => 'Son aramalar';

  @override
  String get searchNoRecent => 'Henüz son arama yok.';

  @override
  String get searchPopularTitle => 'Popüler aramalar';

  @override
  String get searchNoPopular =>
      'Popüler aramalar gerçek kullanımdan görünecek.';

  @override
  String get searchNoSuggestionsTitle => 'Öneri yok';

  @override
  String get searchNoSuggestionsMessage =>
      'Bir şehir, simge yapı veya koordinat deneyin.';

  @override
  String get directionsLocationRequired =>
      'Yol tarifi için mevcut konum gerekli';

  @override
  String get directionsNoRoute => 'Rota bulunamadı';

  @override
  String get directionsOriginYou => 'Siz';

  @override
  String get directionsDestination => 'Varış noktası';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String get aboutDefaultDescription =>
      'Terrava, herkesin herhangi bir mahalleyi ziyaret etmeden, taşınmadan veya yaşamadan önce anlamasına yardımcı olur.';

  @override
  String aboutVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get helpTitle => 'Yardım';

  @override
  String get helpHowItWorksTitle => 'Terrava nasıl çalışır';

  @override
  String get helpHowItWorksBody =>
      'Dünyadaki herhangi bir yeri arayın, haritada yakındaki ihtiyaçları keşfedin, olanak skorları için mahalle ayrıntılarını açın ve yerleri hesabınıza kaydedin.';

  @override
  String get helpScoresTitle => 'Mahalle skorları';

  @override
  String get helpScoresBody =>
      'Skorlar, Google Places yoğunluğu, puanlar ve mesafeden kolaylık/olanak tahminleridir. Suç, okul kalitesi veya resmi yaşanabilirlik puanı değildir.';

  @override
  String get privacyBody =>
      'Terrava, hesap profilinizi, kaydedilen yerleri, arama geçmişini ve isteğe bağlı push belirteçlerini satır düzeyinde güvenlikle Supabase\'te saklar. Konum, yakındaki yerleri Google API\'lerinden almak için cihazda kullanılır. Kişisel verileri satmayız. Silme talepleri için destek ile iletişime geçin.';

  @override
  String get termsBody =>
      'Terrava, bilgilendirme amacıyla mahalle keşif araçları sunar. Olanak skorları tahminidir; güvenlik veya yaşanabilirlik garantisi değildir. Üçüncü taraf harita ve yer verileri eksik veya güncel olmayabilir. Uygulamayı yürürlükteki yasalar ve Google Maps / Places şartlarına uygun kullanın.';

  @override
  String get errorGenericTitle => 'Bir şeyler ters gitti';
}
