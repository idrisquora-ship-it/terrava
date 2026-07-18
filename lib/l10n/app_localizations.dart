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
