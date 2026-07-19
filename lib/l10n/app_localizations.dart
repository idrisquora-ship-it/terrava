import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Terrava'**
  String get appName;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Understand any neighborhood'**
  String get splashTagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get navExplore;

  /// No description provided for @navSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navSaved;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get commonCreate;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonTryAgain;

  /// No description provided for @commonDirections.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get commonDirections;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get commonShare;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonSeeAll;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @unitsMetric.
  ///
  /// In en, this message translates to:
  /// **'Metric (km)'**
  String get unitsMetric;

  /// No description provided for @unitsImperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial (mi)'**
  String get unitsImperial;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsUnits.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get settingsUnits;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settingsCurrency;

  /// No description provided for @settingsAboutTerrava.
  ///
  /// In en, this message translates to:
  /// **'About Terrava'**
  String get settingsAboutTerrava;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// No description provided for @settingsTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get settingsTermsOfService;

  /// No description provided for @notificationsPushTitle.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get notificationsPushTitle;

  /// No description provided for @notificationsPushSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Saved places, tips, and account alerts via Firebase'**
  String get notificationsPushSubtitle;

  /// No description provided for @notificationsEnabledTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications on'**
  String get notificationsEnabledTitle;

  /// No description provided for @notificationsEnabledBody.
  ///
  /// In en, this message translates to:
  /// **'Terrava can alert you about saved places and account updates.'**
  String get notificationsEnabledBody;

  /// No description provided for @notificationsPlaceSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved to Terrava'**
  String get notificationsPlaceSavedTitle;

  /// No description provided for @notificationsPlaceSavedBody.
  ///
  /// In en, this message translates to:
  /// **'{placeName} is in your list. Open Saved anytime to revisit it.'**
  String notificationsPlaceSavedBody(String placeName);

  /// No description provided for @notificationsAreaSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood saved'**
  String get notificationsAreaSavedTitle;

  /// No description provided for @notificationsAreaSavedBody.
  ///
  /// In en, this message translates to:
  /// **'{areaName} is ready when you want to compare scores again.'**
  String notificationsAreaSavedBody(String areaName);

  /// No description provided for @notificationsWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Terrava'**
  String get notificationsWelcomeTitle;

  /// No description provided for @notificationsWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Explore neighborhoods, save places, and get score insights nearby.'**
  String get notificationsWelcomeBody;

  /// No description provided for @notificationsGenericUpdate.
  ///
  /// In en, this message translates to:
  /// **'You have a new update'**
  String get notificationsGenericUpdate;

  /// No description provided for @accountDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get accountDelete;

  /// No description provided for @accountDeleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get accountDeleteQuestion;

  /// No description provided for @accountDeleteWarning.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your Terrava account and saved data.'**
  String get accountDeleteWarning;

  /// No description provided for @authWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get authWelcomeBack;

  /// No description provided for @authSignInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to save neighborhoods and continue exploring.'**
  String get authSignInSubtitle;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// No description provided for @authSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get authSignOut;

  /// No description provided for @authContinueGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueGoogle;

  /// No description provided for @authContinueApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get authContinueApple;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get authCreateAccount;

  /// No description provided for @authCreateAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccountTitle;

  /// No description provided for @authSignUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join Terrava to save places and plan your next neighborhood.'**
  String get authSignUpSubtitle;

  /// No description provided for @authDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get authDisplayName;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authSignUp;

  /// No description provided for @authAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created. You can start exploring.'**
  String get authAccountCreated;

  /// No description provided for @authAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get authAlreadyHaveAccount;

  /// No description provided for @authResetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get authResetPasswordTitle;

  /// No description provided for @authResetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send a reset link.'**
  String get authResetPasswordSubtitle;

  /// No description provided for @authSendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get authSendResetLink;

  /// No description provided for @authBackToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get authBackToSignIn;

  /// No description provided for @validationInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get validationInvalidEmail;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Min 6 characters'**
  String get validationPasswordMinLength;

  /// No description provided for @onboardingDiscoverTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover any place'**
  String get onboardingDiscoverTitle;

  /// No description provided for @onboardingDiscoverBody.
  ///
  /// In en, this message translates to:
  /// **'Search cities, streets, landmarks, or coordinates and see what life looks like around them.'**
  String get onboardingDiscoverBody;

  /// No description provided for @onboardingNearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Know what\'s nearby'**
  String get onboardingNearbyTitle;

  /// No description provided for @onboardingNearbyBody.
  ///
  /// In en, this message translates to:
  /// **'Restaurants, hospitals, schools, banks, markets, and essentials — organized for real decisions.'**
  String get onboardingNearbyBody;

  /// No description provided for @onboardingPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan with clarity'**
  String get onboardingPlanTitle;

  /// No description provided for @onboardingPlanBody.
  ///
  /// In en, this message translates to:
  /// **'Save neighborhoods, compare areas, and move with confidence — before you visit or relocate.'**
  String get onboardingPlanBody;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'Discover what\'s around any neighborhood'**
  String get homeTagline;

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search city, area, landmark…'**
  String get homeSearchHint;

  /// No description provided for @homeCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get homeCategoriesTitle;

  /// No description provided for @homeCategoriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Essentials around you'**
  String get homeCategoriesSubtitle;

  /// No description provided for @homeNearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby'**
  String get homeNearbyTitle;

  /// No description provided for @homeNearbySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Close to you'**
  String get homeNearbySubtitle;

  /// No description provided for @homeNoNearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'No nearby places yet'**
  String get homeNoNearbyTitle;

  /// No description provided for @homeNoNearbyMessage.
  ///
  /// In en, this message translates to:
  /// **'Allow location or try Search.'**
  String get homeNoNearbyMessage;

  /// No description provided for @homeRecentlyViewedTitle.
  ///
  /// In en, this message translates to:
  /// **'Recently viewed'**
  String get homeRecentlyViewedTitle;

  /// No description provided for @homeRecentlyViewedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'From your account activity'**
  String get homeRecentlyViewedSubtitle;

  /// No description provided for @homeNoRecentViews.
  ///
  /// In en, this message translates to:
  /// **'Places you open will show up here.'**
  String get homeNoRecentViews;

  /// No description provided for @homePopularNearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Popular nearby'**
  String get homePopularNearbyTitle;

  /// No description provided for @homePopularNearbySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Highly rated around you'**
  String get homePopularNearbySubtitle;

  /// No description provided for @locationPermissionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Location permission needed for nearby places'**
  String get locationPermissionNeeded;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Turn on Location / GPS in system settings, then try again.'**
  String get locationServicesDisabled;

  /// No description provided for @locationUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Could not get your current location. Move outdoors or try again.'**
  String get locationUnavailable;

  /// No description provided for @locationUsingCurrent.
  ///
  /// In en, this message translates to:
  /// **'Using your current location'**
  String get locationUsingCurrent;

  /// No description provided for @locationReadError.
  ///
  /// In en, this message translates to:
  /// **'Unable to read location'**
  String get locationReadError;

  /// No description provided for @locationNeighborhood.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood'**
  String get locationNeighborhood;

  /// No description provided for @locationSaveArea.
  ///
  /// In en, this message translates to:
  /// **'Save area'**
  String get locationSaveArea;

  /// No description provided for @locationAreaSaved.
  ///
  /// In en, this message translates to:
  /// **'Area saved'**
  String get locationAreaSaved;

  /// No description provided for @locationNoRadiusResults.
  ///
  /// In en, this message translates to:
  /// **'No results in this radius'**
  String get locationNoRadiusResults;

  /// No description provided for @locationInsightsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Insights unavailable: {error}'**
  String locationInsightsUnavailable(String error);

  /// No description provided for @amenityScore.
  ///
  /// In en, this message translates to:
  /// **'Amenity score {score}/100'**
  String amenityScore(int score);

  /// No description provided for @securityScore.
  ///
  /// In en, this message translates to:
  /// **'Security signals {score}/100'**
  String securityScore(int score);

  /// No description provided for @securityScoreHint.
  ///
  /// In en, this message translates to:
  /// **'Estimate from nearby police/fire, hospitals, and everyday activity — not official crime statistics.'**
  String get securityScoreHint;

  /// No description provided for @placesNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Could not load nearby places. Check your connection and try again.'**
  String get placesNetworkError;

  /// No description provided for @weatherSummary.
  ///
  /// In en, this message translates to:
  /// **'{temp}°C · {condition} · feels {feelsLike}°C · humidity {humidity}%'**
  String weatherSummary(
      int temp, String condition, int feelsLike, int humidity);

  /// No description provided for @fxRate.
  ///
  /// In en, this message translates to:
  /// **'FX: 1 {base} = {rate} {target}'**
  String fxRate(String base, String rate, String target);

  /// No description provided for @scoreSummary.
  ///
  /// In en, this message translates to:
  /// **'{area} scores {overall}/100 for everyday convenience (amenity access — not crime or official livability). Strongest: {strongest}. Weakest: {weakest}. Within {radius} km: {essentials} grocery/pharmacy options, {health} health-related places, {food} food places, {transport} transit-related places.'**
  String scoreSummary(
      String area,
      int overall,
      String strongest,
      String weakest,
      String radius,
      int essentials,
      int health,
      int food,
      int transport);

  /// No description provided for @scoreEssentials.
  ///
  /// In en, this message translates to:
  /// **'Essentials'**
  String get scoreEssentials;

  /// No description provided for @scoreHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get scoreHealth;

  /// No description provided for @scoreFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get scoreFood;

  /// No description provided for @scoreTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get scoreTransport;

  /// No description provided for @scoreMoney.
  ///
  /// In en, this message translates to:
  /// **'Banks & ATMs'**
  String get scoreMoney;

  /// No description provided for @scoreEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get scoreEducation;

  /// No description provided for @scoreFuel.
  ///
  /// In en, this message translates to:
  /// **'Fuel'**
  String get scoreFuel;

  /// No description provided for @categoryRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get categoryRestaurants;

  /// No description provided for @categoryHotels.
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get categoryHotels;

  /// No description provided for @categoryHospitals.
  ///
  /// In en, this message translates to:
  /// **'Hospitals'**
  String get categoryHospitals;

  /// No description provided for @categoryBanks.
  ///
  /// In en, this message translates to:
  /// **'Banks'**
  String get categoryBanks;

  /// No description provided for @categoryPharmacies.
  ///
  /// In en, this message translates to:
  /// **'Pharmacies'**
  String get categoryPharmacies;

  /// No description provided for @categorySchools.
  ///
  /// In en, this message translates to:
  /// **'Schools'**
  String get categorySchools;

  /// No description provided for @categorySupermarkets.
  ///
  /// In en, this message translates to:
  /// **'Supermarkets'**
  String get categorySupermarkets;

  /// No description provided for @categoryMarkets.
  ///
  /// In en, this message translates to:
  /// **'Markets'**
  String get categoryMarkets;

  /// No description provided for @categoryFuel.
  ///
  /// In en, this message translates to:
  /// **'Fuel'**
  String get categoryFuel;

  /// No description provided for @categoryNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get categoryNoResultsTitle;

  /// No description provided for @categoryNoResultsMessage.
  ///
  /// In en, this message translates to:
  /// **'Try another category or move the map.'**
  String get categoryNoResultsMessage;

  /// No description provided for @mapClusterPlaces.
  ///
  /// In en, this message translates to:
  /// **'{count} places'**
  String mapClusterPlaces(int count);

  /// No description provided for @mapTapToZoom.
  ///
  /// In en, this message translates to:
  /// **'Tap to zoom'**
  String get mapTapToZoom;

  /// No description provided for @mapSearchArea.
  ///
  /// In en, this message translates to:
  /// **'Search this area'**
  String get mapSearchArea;

  /// No description provided for @mapMyLocation.
  ///
  /// In en, this message translates to:
  /// **'My location'**
  String get mapMyLocation;

  /// No description provided for @savedTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get savedTitle;

  /// No description provided for @savedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Places, neighborhoods, and collections synced to your account.'**
  String get savedSubtitle;

  /// No description provided for @savedCollectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get savedCollectionsTitle;

  /// No description provided for @savedNewCollection.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get savedNewCollection;

  /// No description provided for @savedNoCollections.
  ///
  /// In en, this message translates to:
  /// **'No collections yet.'**
  String get savedNoCollections;

  /// No description provided for @savedNeighborhoodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Neighborhoods'**
  String get savedNeighborhoodsTitle;

  /// No description provided for @savedNoAreas.
  ///
  /// In en, this message translates to:
  /// **'No saved areas yet.'**
  String get savedNoAreas;

  /// No description provided for @savedPlacesTitle.
  ///
  /// In en, this message translates to:
  /// **'Places'**
  String get savedPlacesTitle;

  /// No description provided for @savedNoPlacesTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved places'**
  String get savedNoPlacesTitle;

  /// No description provided for @savedNoPlacesMessage.
  ///
  /// In en, this message translates to:
  /// **'Save restaurants, hotels, and more from details.'**
  String get savedNoPlacesMessage;

  /// No description provided for @collectionFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collectionFallbackName;

  /// No description provided for @collectionNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New collection'**
  String get collectionNewTitle;

  /// No description provided for @collectionNameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get collectionNameHint;

  /// No description provided for @collectionDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete collection'**
  String get collectionDeleteTooltip;

  /// No description provided for @collectionEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Empty collection'**
  String get collectionEmptyTitle;

  /// No description provided for @collectionEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add places from Place Details → Save to collection.'**
  String get collectionEmptyMessage;

  /// No description provided for @collectionSavedArea.
  ///
  /// In en, this message translates to:
  /// **'Saved area'**
  String get collectionSavedArea;

  /// No description provided for @collectionCreateFirst.
  ///
  /// In en, this message translates to:
  /// **'Create a collection in Saved first'**
  String get collectionCreateFirst;

  /// No description provided for @collectionAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to collection'**
  String get collectionAdded;

  /// No description provided for @areaFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get areaFallbackName;

  /// No description provided for @placeFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get placeFallbackName;

  /// No description provided for @placeOpenNow.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get placeOpenNow;

  /// No description provided for @placeClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get placeClosed;

  /// No description provided for @placeSaved.
  ///
  /// In en, this message translates to:
  /// **'Place saved'**
  String get placeSaved;

  /// No description provided for @placeCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get placeCollection;

  /// No description provided for @placeCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get placeCall;

  /// No description provided for @placeWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get placeWebsite;

  /// No description provided for @placeHours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get placeHours;

  /// No description provided for @placeReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get placeReviews;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Traveler'**
  String get profileFallbackName;

  /// No description provided for @profileChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get profileChangePhoto;

  /// No description provided for @profileSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Units, language, notifications, legal'**
  String get profileSettingsSubtitle;

  /// No description provided for @profilePhotoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile photo updated'**
  String get profilePhotoUpdated;

  /// No description provided for @searchTitle.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Country, city, street, landmark, lat,lng'**
  String get searchHint;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results for that search'**
  String get searchNoResults;

  /// No description provided for @searchVoiceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Voice search'**
  String get searchVoiceTooltip;

  /// No description provided for @searchVoiceDisabledTooltip.
  ///
  /// In en, this message translates to:
  /// **'Voice search (enable in .env)'**
  String get searchVoiceDisabledTooltip;

  /// No description provided for @searchVoiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Microphone / speech not available'**
  String get searchVoiceUnavailable;

  /// No description provided for @searchVoiceEnableInstruction.
  ///
  /// In en, this message translates to:
  /// **'Set ENABLE_VOICE_SEARCH=true in .env to enable'**
  String get searchVoiceEnableInstruction;

  /// No description provided for @searchRecentTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get searchRecentTitle;

  /// No description provided for @searchNoRecent.
  ///
  /// In en, this message translates to:
  /// **'No recent searches yet.'**
  String get searchNoRecent;

  /// No description provided for @searchPopularTitle.
  ///
  /// In en, this message translates to:
  /// **'Popular searches'**
  String get searchPopularTitle;

  /// No description provided for @searchNoPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular searches will appear from real usage.'**
  String get searchNoPopular;

  /// No description provided for @searchNoSuggestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'No suggestions'**
  String get searchNoSuggestionsTitle;

  /// No description provided for @searchNoSuggestionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Try a city, landmark, or coordinates.'**
  String get searchNoSuggestionsMessage;

  /// No description provided for @directionsLocationRequired.
  ///
  /// In en, this message translates to:
  /// **'Current location required for directions'**
  String get directionsLocationRequired;

  /// No description provided for @directionsNoRoute.
  ///
  /// In en, this message translates to:
  /// **'No route found'**
  String get directionsNoRoute;

  /// No description provided for @directionsOriginYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get directionsOriginYou;

  /// No description provided for @directionsDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get directionsDestination;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @aboutDefaultDescription.
  ///
  /// In en, this message translates to:
  /// **'Terrava helps anyone understand any neighborhood before visiting, moving, or living there.'**
  String get aboutDefaultDescription;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String aboutVersion(String version);

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTitle;

  /// No description provided for @helpHowItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How Terrava works'**
  String get helpHowItWorksTitle;

  /// No description provided for @helpHowItWorksBody.
  ///
  /// In en, this message translates to:
  /// **'Search any place on Earth, explore nearby essentials on the map, open neighborhood details for amenity scores, and save places to your account.'**
  String get helpHowItWorksBody;

  /// No description provided for @helpScoresTitle.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood scores'**
  String get helpScoresTitle;

  /// No description provided for @helpScoresBody.
  ///
  /// In en, this message translates to:
  /// **'Scores are convenience/amenity estimates from Google Places density, ratings, and distance. They are not crime, school-quality, or official livability ratings.'**
  String get helpScoresBody;

  /// No description provided for @privacyBody.
  ///
  /// In en, this message translates to:
  /// **'Terrava stores your account profile, saved places, search history, and optional push tokens in Supabase with row-level security. Location is used on-device to fetch nearby places from Google APIs. We do not sell personal data. Contact support for deletion requests.'**
  String get privacyBody;

  /// No description provided for @termsBody.
  ///
  /// In en, this message translates to:
  /// **'Terrava provides neighborhood discovery tools for informational purposes. Amenity scores are estimates, not guarantees of safety or livability. Third-party map and place data may be incomplete or outdated. Use the app in accordance with applicable laws and Google Maps / Places terms.'**
  String get termsBody;

  /// No description provided for @errorGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGenericTitle;

  /// No description provided for @roleChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose account type'**
  String get roleChooseTitle;

  /// No description provided for @roleChooseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick how you will use Terrava. Business owners can list properties and businesses.'**
  String get roleChooseSubtitle;

  /// No description provided for @roleChooseFootnote.
  ///
  /// In en, this message translates to:
  /// **'You cannot change this later in the app. Contact support if you chose the wrong type.'**
  String get roleChooseFootnote;

  /// No description provided for @roleCivilian.
  ///
  /// In en, this message translates to:
  /// **'Civilian'**
  String get roleCivilian;

  /// No description provided for @roleCivilianHint.
  ///
  /// In en, this message translates to:
  /// **'Search neighborhoods, save places, and message listing owners.'**
  String get roleCivilianHint;

  /// No description provided for @roleBusinessOwner.
  ///
  /// In en, this message translates to:
  /// **'Business owner / Agent'**
  String get roleBusinessOwner;

  /// No description provided for @roleBusinessOwnerShort.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get roleBusinessOwnerShort;

  /// No description provided for @roleBusinessOwnerHint.
  ///
  /// In en, this message translates to:
  /// **'List houses, restaurants, and other businesses — plus all civilian features.'**
  String get roleBusinessOwnerHint;

  /// No description provided for @roleSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save account type. Try again.'**
  String get roleSaveFailed;

  /// No description provided for @listingsCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create listing'**
  String get listingsCreateTitle;

  /// No description provided for @listingsMineTitle.
  ///
  /// In en, this message translates to:
  /// **'My listings'**
  String get listingsMineTitle;

  /// No description provided for @listingsMineEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No listings yet'**
  String get listingsMineEmptyTitle;

  /// No description provided for @listingsMineEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Publish a house, shop, or restaurant so people nearby can find you first.'**
  String get listingsMineEmptyMessage;

  /// No description provided for @listingsKindLabel.
  ///
  /// In en, this message translates to:
  /// **'Listing type'**
  String get listingsKindLabel;

  /// No description provided for @listingsKindRental.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get listingsKindRental;

  /// No description provided for @listingsKindSale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get listingsKindSale;

  /// No description provided for @listingsKindBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get listingsKindBusiness;

  /// No description provided for @listingsCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get listingsCategoryLabel;

  /// No description provided for @listingsTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get listingsTitleLabel;

  /// No description provided for @listingsDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get listingsDescriptionLabel;

  /// No description provided for @listingsPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price (NGN)'**
  String get listingsPriceLabel;

  /// No description provided for @listingsCityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get listingsCityLabel;

  /// No description provided for @listingsAreaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area / neighborhood'**
  String get listingsAreaLabel;

  /// No description provided for @listingsPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get listingsPhoneLabel;

  /// No description provided for @listingsRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get listingsRequired;

  /// No description provided for @listingsLocating.
  ///
  /// In en, this message translates to:
  /// **'Getting your location…'**
  String get listingsLocating;

  /// No description provided for @listingsLocationSet.
  ///
  /// In en, this message translates to:
  /// **'Location set: {lat}, {lng}'**
  String listingsLocationSet(String lat, String lng);

  /// No description provided for @listingsUseMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my current location'**
  String get listingsUseMyLocation;

  /// No description provided for @listingsAddPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get listingsAddPhoto;

  /// No description provided for @listingsPhotosCount.
  ///
  /// In en, this message translates to:
  /// **'{count}/{max} photos'**
  String listingsPhotosCount(int count, int max);

  /// No description provided for @listingsPhotosMaxReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum {max} photos per listing.'**
  String listingsPhotosMaxReached(int max);

  /// No description provided for @listingsManagePhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get listingsManagePhotos;

  /// No description provided for @listingsPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish listing'**
  String get listingsPublish;

  /// No description provided for @listingsPublishFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not publish listing. Check your connection and role.'**
  String get listingsPublishFailed;

  /// No description provided for @listingsPhotoFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not upload photo.'**
  String get listingsPhotoFailed;

  /// No description provided for @listingsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load listings.'**
  String get listingsLoadFailed;

  /// No description provided for @listingsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Listing not found'**
  String get listingsNotFound;

  /// No description provided for @listingsListedBadge.
  ///
  /// In en, this message translates to:
  /// **'Listed on Terrava'**
  String get listingsListedBadge;

  /// No description provided for @listingsPause.
  ///
  /// In en, this message translates to:
  /// **'Pause / unpause'**
  String get listingsPause;

  /// No description provided for @listingsBedrooms.
  ///
  /// In en, this message translates to:
  /// **'Bedrooms'**
  String get listingsBedrooms;

  /// No description provided for @listingsBathrooms.
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get listingsBathrooms;

  /// No description provided for @listingsBedroomsValue.
  ///
  /// In en, this message translates to:
  /// **'{count} beds'**
  String listingsBedroomsValue(int count);

  /// No description provided for @listingsBathroomsValue.
  ///
  /// In en, this message translates to:
  /// **'{count} baths'**
  String listingsBathroomsValue(int count);

  /// No description provided for @listingsFurnished.
  ///
  /// In en, this message translates to:
  /// **'Furnished'**
  String get listingsFurnished;

  /// No description provided for @listingsUnfurnished.
  ///
  /// In en, this message translates to:
  /// **'Unfurnished'**
  String get listingsUnfurnished;

  /// No description provided for @listingsAmenities.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get listingsAmenities;

  /// No description provided for @listingsOpeningHours.
  ///
  /// In en, this message translates to:
  /// **'Opening hours'**
  String get listingsOpeningHours;

  /// No description provided for @listingsServices.
  ///
  /// In en, this message translates to:
  /// **'Menu / services'**
  String get listingsServices;

  /// No description provided for @listingsServicesHint.
  ///
  /// In en, this message translates to:
  /// **'What you offer (menu highlights, services…)'**
  String get listingsServicesHint;

  /// No description provided for @listingsVerifiedBadge.
  ///
  /// In en, this message translates to:
  /// **'Verified on Terrava'**
  String get listingsVerifiedBadge;

  /// No description provided for @listingsVerifiedComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Verified badge will be a paid upgrade later. Payment is not enabled yet.'**
  String get listingsVerifiedComingSoon;

  /// No description provided for @listingsSave.
  ///
  /// In en, this message translates to:
  /// **'Save listing'**
  String get listingsSave;

  /// No description provided for @listingsUnsave.
  ///
  /// In en, this message translates to:
  /// **'Remove from saved'**
  String get listingsUnsave;

  /// No description provided for @listingsSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved listings'**
  String get listingsSavedTitle;

  /// No description provided for @listingsSavedEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved listings'**
  String get listingsSavedEmptyTitle;

  /// No description provided for @listingsSavedEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Save Terrava listings you like to revisit them later.'**
  String get listingsSavedEmptyMessage;

  /// No description provided for @listingsAlertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Listing alerts'**
  String get listingsAlertsTitle;

  /// No description provided for @listingsAlertsIntro.
  ///
  /// In en, this message translates to:
  /// **'Get remembered filters for new houses/businesses in an area. Push alerts come later — your alert is saved now.'**
  String get listingsAlertsIntro;

  /// No description provided for @listingsCreateAlert.
  ///
  /// In en, this message translates to:
  /// **'Save alert'**
  String get listingsCreateAlert;

  /// No description provided for @listingsAlertSaved.
  ///
  /// In en, this message translates to:
  /// **'Alert saved.'**
  String get listingsAlertSaved;

  /// No description provided for @listingsAlertFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save alert.'**
  String get listingsAlertFailed;

  /// No description provided for @listingsYourAlerts.
  ///
  /// In en, this message translates to:
  /// **'Your alerts'**
  String get listingsYourAlerts;

  /// No description provided for @listingsNoAlerts.
  ///
  /// In en, this message translates to:
  /// **'No alerts yet.'**
  String get listingsNoAlerts;

  /// No description provided for @listingsMaxPrice.
  ///
  /// In en, this message translates to:
  /// **'Max price (NGN)'**
  String get listingsMaxPrice;

  /// No description provided for @listingsDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Listing dashboard'**
  String get listingsDashboardTitle;

  /// No description provided for @listingsStatTotal.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get listingsStatTotal;

  /// No description provided for @listingsStatActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get listingsStatActive;

  /// No description provided for @listingsStatViews.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get listingsStatViews;

  /// No description provided for @listingsStatMessages.
  ///
  /// In en, this message translates to:
  /// **'Message threads'**
  String get listingsStatMessages;

  /// No description provided for @listingsAvailableFrom.
  ///
  /// In en, this message translates to:
  /// **'Available from'**
  String get listingsAvailableFrom;

  /// No description provided for @listingsPickAvailableFrom.
  ///
  /// In en, this message translates to:
  /// **'Pick available date'**
  String get listingsPickAvailableFrom;

  /// No description provided for @listingsPricePeriod.
  ///
  /// In en, this message translates to:
  /// **'Price type'**
  String get listingsPricePeriod;

  /// No description provided for @listingsPriceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get listingsPriceMonthly;

  /// No description provided for @listingsPriceYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get listingsPriceYearly;

  /// No description provided for @listingsPriceNegotiable.
  ///
  /// In en, this message translates to:
  /// **'Negotiable'**
  String get listingsPriceNegotiable;

  /// No description provided for @listingsPriceTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get listingsPriceTotal;

  /// No description provided for @listingsSetCover.
  ///
  /// In en, this message translates to:
  /// **'Set as cover'**
  String get listingsSetCover;

  /// No description provided for @listingsCoverBadge.
  ///
  /// In en, this message translates to:
  /// **'Cover'**
  String get listingsCoverBadge;

  /// No description provided for @listingsShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get listingsShare;

  /// No description provided for @listingsReport.
  ///
  /// In en, this message translates to:
  /// **'Report listing'**
  String get listingsReport;

  /// No description provided for @listingsReportReason.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting this?'**
  String get listingsReportReason;

  /// No description provided for @listingsReportSpam.
  ///
  /// In en, this message translates to:
  /// **'Spam or scam'**
  String get listingsReportSpam;

  /// No description provided for @listingsReportWrongInfo.
  ///
  /// In en, this message translates to:
  /// **'Wrong information'**
  String get listingsReportWrongInfo;

  /// No description provided for @listingsReportInappropriate.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate content'**
  String get listingsReportInappropriate;

  /// No description provided for @listingsReportOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get listingsReportOther;

  /// No description provided for @listingsReportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Thanks — we received your report.'**
  String get listingsReportSubmitted;

  /// No description provided for @listingsReportFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not submit report.'**
  String get listingsReportFailed;

  /// No description provided for @listingsReportAlready.
  ///
  /// In en, this message translates to:
  /// **'You already reported this listing.'**
  String get listingsReportAlready;

  /// No description provided for @searchAreaHint.
  ///
  /// In en, this message translates to:
  /// **'Area (e.g. Ayekale, Osogbo)'**
  String get searchAreaHint;

  /// No description provided for @searchListedSection.
  ///
  /// In en, this message translates to:
  /// **'Listed on Terrava'**
  String get searchListedSection;

  /// No description provided for @searchListedEmpty.
  ///
  /// In en, this message translates to:
  /// **'No Terrava listings match yet — try another area or see more places below.'**
  String get searchListedEmpty;

  /// No description provided for @searchMorePlacesSection.
  ///
  /// In en, this message translates to:
  /// **'More places nearby'**
  String get searchMorePlacesSection;

  /// No description provided for @chatInboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get chatInboxTitle;

  /// No description provided for @chatInboxEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get chatInboxEmptyTitle;

  /// No description provided for @chatInboxEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Message a listing owner from a Terrava listing to start chatting.'**
  String get chatInboxEmptyMessage;

  /// No description provided for @chatThreadTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatThreadTitle;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get chatInputHint;

  /// No description provided for @chatNoMessagesYet.
  ///
  /// In en, this message translates to:
  /// **'Say hello to start the conversation.'**
  String get chatNoMessagesYet;

  /// No description provided for @chatMessageSeller.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get chatMessageSeller;

  /// No description provided for @chatStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not start chat.'**
  String get chatStartFailed;

  /// No description provided for @chatSendFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not send message.'**
  String get chatSendFailed;

  /// No description provided for @chatLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load messages.'**
  String get chatLoadFailed;

  /// No description provided for @chatAttachMedia.
  ///
  /// In en, this message translates to:
  /// **'Attach photo or video'**
  String get chatAttachMedia;

  /// No description provided for @chatAttachImage.
  ///
  /// In en, this message translates to:
  /// **'Send photo'**
  String get chatAttachImage;

  /// No description provided for @chatAttachVideo.
  ///
  /// In en, this message translates to:
  /// **'Send video'**
  String get chatAttachVideo;

  /// No description provided for @chatOpenVideo.
  ///
  /// In en, this message translates to:
  /// **'Open video'**
  String get chatOpenVideo;

  /// No description provided for @adminTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin dashboard'**
  String get adminTitle;

  /// No description provided for @adminBadge.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminBadge;

  /// No description provided for @adminAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'You need admin access to open this screen.'**
  String get adminAccessDenied;

  /// No description provided for @adminTabUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminTabUsers;

  /// No description provided for @adminTabVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get adminTabVerify;

  /// No description provided for @adminTabIssues.
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get adminTabIssues;

  /// No description provided for @adminTabListingReports.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get adminTabListingReports;

  /// No description provided for @adminTabAnnounce.
  ///
  /// In en, this message translates to:
  /// **'Announce'**
  String get adminTabAnnounce;

  /// No description provided for @adminMakeAdmin.
  ///
  /// In en, this message translates to:
  /// **'Make admin'**
  String get adminMakeAdmin;

  /// No description provided for @adminRemoveAdmin.
  ///
  /// In en, this message translates to:
  /// **'Remove admin'**
  String get adminRemoveAdmin;

  /// No description provided for @adminSuspend.
  ///
  /// In en, this message translates to:
  /// **'Suspend account'**
  String get adminSuspend;

  /// No description provided for @adminBlock.
  ///
  /// In en, this message translates to:
  /// **'Block account'**
  String get adminBlock;

  /// No description provided for @adminActivate.
  ///
  /// In en, this message translates to:
  /// **'Reactivate account'**
  String get adminActivate;

  /// No description provided for @adminDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get adminDeleteAccount;

  /// No description provided for @adminDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Soft-delete this account? They will lose access immediately.'**
  String get adminDeleteConfirm;

  /// No description provided for @adminActionDone.
  ///
  /// In en, this message translates to:
  /// **'Done.'**
  String get adminActionDone;

  /// No description provided for @adminActionFailed.
  ///
  /// In en, this message translates to:
  /// **'That admin action failed.'**
  String get adminActionFailed;

  /// No description provided for @adminLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load admin data.'**
  String get adminLoadFailed;

  /// No description provided for @adminNoPendingVerify.
  ///
  /// In en, this message translates to:
  /// **'No pending verification requests.'**
  String get adminNoPendingVerify;

  /// No description provided for @adminApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get adminApprove;

  /// No description provided for @adminReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get adminReject;

  /// No description provided for @adminNoIssues.
  ///
  /// In en, this message translates to:
  /// **'No issue reports.'**
  String get adminNoIssues;

  /// No description provided for @adminNoListingReports.
  ///
  /// In en, this message translates to:
  /// **'No listing reports.'**
  String get adminNoListingReports;

  /// No description provided for @adminMarkInProgress.
  ///
  /// In en, this message translates to:
  /// **'Mark in progress'**
  String get adminMarkInProgress;

  /// No description provided for @adminMarkResolved.
  ///
  /// In en, this message translates to:
  /// **'Mark resolved'**
  String get adminMarkResolved;

  /// No description provided for @adminMarkDismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get adminMarkDismissed;

  /// No description provided for @adminMarkReviewed.
  ///
  /// In en, this message translates to:
  /// **'Mark reviewed'**
  String get adminMarkReviewed;

  /// No description provided for @adminRelatedUser.
  ///
  /// In en, this message translates to:
  /// **'Related user'**
  String get adminRelatedUser;

  /// No description provided for @adminAnnounceTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcement title'**
  String get adminAnnounceTitle;

  /// No description provided for @adminAnnounceBody.
  ///
  /// In en, this message translates to:
  /// **'Message to all users'**
  String get adminAnnounceBody;

  /// No description provided for @adminSendAnnounce.
  ///
  /// In en, this message translates to:
  /// **'Publish announcement'**
  String get adminSendAnnounce;

  /// No description provided for @adminAnnounceSent.
  ///
  /// In en, this message translates to:
  /// **'Announcement published.'**
  String get adminAnnounceSent;

  /// No description provided for @adminPastAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Past announcements'**
  String get adminPastAnnouncements;

  /// No description provided for @adminNoAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'No announcements yet.'**
  String get adminNoAnnouncements;

  /// No description provided for @adminActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adminActive;

  /// No description provided for @adminInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get adminInactive;

  /// No description provided for @reportIssueTitle.
  ///
  /// In en, this message translates to:
  /// **'Report an issue'**
  String get reportIssueTitle;

  /// No description provided for @reportIssueIntro.
  ///
  /// In en, this message translates to:
  /// **'Tell admins about a problem with the app, a listing, or another user.'**
  String get reportIssueIntro;

  /// No description provided for @reportIssueSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get reportIssueSubject;

  /// No description provided for @reportIssueBody.
  ///
  /// In en, this message translates to:
  /// **'Describe the issue'**
  String get reportIssueBody;

  /// No description provided for @reportIssueSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send to admins'**
  String get reportIssueSubmit;

  /// No description provided for @reportIssueSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Thanks — admins will review your report.'**
  String get reportIssueSubmitted;

  /// No description provided for @reportIssueFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not send report.'**
  String get reportIssueFailed;

  /// No description provided for @reportUser.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get reportUser;

  /// No description provided for @reportUserSubject.
  ///
  /// In en, this message translates to:
  /// **'Report a user'**
  String get reportUserSubject;

  /// No description provided for @announcementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcementsTitle;

  /// No description provided for @announcementsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No announcements right now.'**
  String get announcementsEmpty;

  /// No description provided for @verificationRequest.
  ///
  /// In en, this message translates to:
  /// **'Request verification'**
  String get verificationRequest;

  /// No description provided for @verificationRequested.
  ///
  /// In en, this message translates to:
  /// **'Verification request sent. An admin will review it.'**
  String get verificationRequested;

  /// No description provided for @verificationPending.
  ///
  /// In en, this message translates to:
  /// **'Verification pending admin approval.'**
  String get verificationPending;

  /// No description provided for @verificationRejected.
  ///
  /// In en, this message translates to:
  /// **'Verification was rejected. You can request again.'**
  String get verificationRejected;

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not request verification.'**
  String get verificationFailed;

  /// No description provided for @accountRestrictedTitle.
  ///
  /// In en, this message translates to:
  /// **'Account restricted'**
  String get accountRestrictedTitle;

  /// No description provided for @accountRestrictedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account cannot use Terrava right now.'**
  String get accountRestrictedMessage;

  /// No description provided for @accountSuspendedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account is suspended. Contact support if you think this is a mistake.'**
  String get accountSuspendedMessage;

  /// No description provided for @accountBlockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account is blocked.'**
  String get accountBlockedMessage;

  /// No description provided for @accountDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'This account has been deleted.'**
  String get accountDeletedMessage;

  /// No description provided for @categoryHouseRent.
  ///
  /// In en, this message translates to:
  /// **'House rent'**
  String get categoryHouseRent;

  /// No description provided for @listingsAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Street address'**
  String get listingsAddressLabel;

  /// No description provided for @listingsStateLabel.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get listingsStateLabel;

  /// No description provided for @rentalsBrowseTitle.
  ///
  /// In en, this message translates to:
  /// **'Houses for rent'**
  String get rentalsBrowseTitle;

  /// No description provided for @rentalsBrowseIntro.
  ///
  /// In en, this message translates to:
  /// **'Browse rentals by city and area. Change the city/state anytime to explore a place you want to move to.'**
  String get rentalsBrowseIntro;

  /// No description provided for @rentalsDetectedLocation.
  ///
  /// In en, this message translates to:
  /// **'Detected near: {address}'**
  String rentalsDetectedLocation(String address);

  /// No description provided for @rentalsSearch.
  ///
  /// In en, this message translates to:
  /// **'Show rentals'**
  String get rentalsSearch;

  /// No description provided for @rentalsUseMyCity.
  ///
  /// In en, this message translates to:
  /// **'Use my detected city'**
  String get rentalsUseMyCity;

  /// No description provided for @rentalsAllAreas.
  ///
  /// In en, this message translates to:
  /// **'All areas'**
  String get rentalsAllAreas;

  /// No description provided for @rentalsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No rentals here yet'**
  String get rentalsEmptyTitle;

  /// No description provided for @rentalsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Try another city, state, or area — or list a rental if you are a business owner.'**
  String get rentalsEmptyMessage;

  /// No description provided for @rentalsNoAddress.
  ///
  /// In en, this message translates to:
  /// **'Location not set'**
  String get rentalsNoAddress;

  /// No description provided for @rentalsExploreArea.
  ///
  /// In en, this message translates to:
  /// **'See restaurants, markets & schools nearby'**
  String get rentalsExploreArea;

  /// No description provided for @searchCityHint.
  ///
  /// In en, this message translates to:
  /// **'City (e.g. Osogbo, Ibadan, Lagos)'**
  String get searchCityHint;

  /// No description provided for @searchNearMeOnly.
  ///
  /// In en, this message translates to:
  /// **'Near my GPS only'**
  String get searchNearMeOnly;

  /// No description provided for @listingsExploreArea.
  ///
  /// In en, this message translates to:
  /// **'Explore this neighborhood'**
  String get listingsExploreArea;

  /// No description provided for @downloadApkTooltip.
  ///
  /// In en, this message translates to:
  /// **'Download Android APK'**
  String get downloadApkTooltip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'it',
        'ja',
        'nl',
        'pt',
        'ru',
        'tr',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
