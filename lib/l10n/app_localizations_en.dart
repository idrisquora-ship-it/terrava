// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Terrava';

  @override
  String get splashTagline => 'Understand any neighborhood';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Explore';

  @override
  String get navSaved => 'Saved';

  @override
  String get navProfile => 'Profile';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonCreate => 'Create';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonTryAgain => 'Try again';

  @override
  String get commonDirections => 'Directions';

  @override
  String get commonSave => 'Save';

  @override
  String get commonShare => 'Share';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get unitsMetric => 'Metric (km)';

  @override
  String get unitsImperial => 'Imperial (mi)';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsUnits => 'Units';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsCurrency => 'Currency';

  @override
  String get settingsAboutTerrava => 'About Terrava';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsTermsOfService => 'Terms of Service';

  @override
  String get notificationsPushTitle => 'Push notifications';

  @override
  String get notificationsPushSubtitle =>
      'Saved places, tips, and account alerts via Firebase';

  @override
  String get notificationsEnabledTitle => 'Notifications on';

  @override
  String get notificationsEnabledBody =>
      'Terrava can alert you about saved places and account updates.';

  @override
  String get notificationsPlaceSavedTitle => 'Saved to Terrava';

  @override
  String notificationsPlaceSavedBody(String placeName) {
    return '$placeName is in your list. Open Saved anytime to revisit it.';
  }

  @override
  String get notificationsAreaSavedTitle => 'Neighborhood saved';

  @override
  String notificationsAreaSavedBody(String areaName) {
    return '$areaName is ready when you want to compare scores again.';
  }

  @override
  String get notificationsWelcomeTitle => 'Welcome to Terrava';

  @override
  String get notificationsWelcomeBody =>
      'Explore neighborhoods, save places, and get score insights nearby.';

  @override
  String get notificationsGenericUpdate => 'You have a new update';

  @override
  String get accountDelete => 'Delete account';

  @override
  String get accountDeleteQuestion => 'Delete account?';

  @override
  String get accountDeleteWarning =>
      'This permanently deletes your Terrava account and saved data.';

  @override
  String get authWelcomeBack => 'Welcome back';

  @override
  String get authSignInSubtitle =>
      'Sign in to save neighborhoods and continue exploring.';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authSignOut => 'Sign out';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authContinueApple => 'Continue with Apple';

  @override
  String get authCreateAccount => 'Create an account';

  @override
  String get authCreateAccountTitle => 'Create account';

  @override
  String get authSignUpSubtitle =>
      'Join Terrava to save places and plan your next neighborhood.';

  @override
  String get authDisplayName => 'Display name';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authAccountCreated => 'Account created. You can start exploring.';

  @override
  String get authAlreadyHaveAccount => 'Already have an account? Sign in';

  @override
  String get authResetPasswordTitle => 'Reset password';

  @override
  String get authResetPasswordSubtitle =>
      'Enter your email and we\'ll send a reset link.';

  @override
  String get authSendResetLink => 'Send reset link';

  @override
  String get authBackToSignIn => 'Back to sign in';

  @override
  String get validationInvalidEmail => 'Enter a valid email';

  @override
  String get validationPasswordMinLength => 'Min 6 characters';

  @override
  String get onboardingDiscoverTitle => 'Discover any place';

  @override
  String get onboardingDiscoverBody =>
      'Search cities, streets, landmarks, or coordinates and see what life looks like around them.';

  @override
  String get onboardingNearbyTitle => 'Know what\'s nearby';

  @override
  String get onboardingNearbyBody =>
      'Restaurants, hospitals, schools, banks, markets, and essentials — organized for real decisions.';

  @override
  String get onboardingPlanTitle => 'Plan with clarity';

  @override
  String get onboardingPlanBody =>
      'Save neighborhoods, compare areas, and move with confidence — before you visit or relocate.';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get homeTagline => 'Discover what\'s around any neighborhood';

  @override
  String get homeSearchHint => 'Search city, area, landmark…';

  @override
  String get homeCategoriesTitle => 'Categories';

  @override
  String get homeCategoriesSubtitle => 'Essentials around you';

  @override
  String get homeNearbyTitle => 'Nearby';

  @override
  String get homeNearbySubtitle => 'Close to you';

  @override
  String get homeNoNearbyTitle => 'No nearby places yet';

  @override
  String get homeNoNearbyMessage => 'Allow location or try Search.';

  @override
  String get homeRecentlyViewedTitle => 'Recently viewed';

  @override
  String get homeRecentlyViewedSubtitle => 'From your account activity';

  @override
  String get homeNoRecentViews => 'Places you open will show up here.';

  @override
  String get homePopularNearbyTitle => 'Popular nearby';

  @override
  String get homePopularNearbySubtitle => 'Highly rated around you';

  @override
  String get locationPermissionNeeded =>
      'Location permission needed for nearby places';

  @override
  String get locationServicesDisabled =>
      'Turn on Location / GPS in system settings, then try again.';

  @override
  String get locationUnavailable =>
      'Could not get your current location. Move outdoors or try again.';

  @override
  String get locationUsingCurrent => 'Using your current location';

  @override
  String get locationReadError => 'Unable to read location';

  @override
  String get locationNeighborhood => 'Neighborhood';

  @override
  String get locationSaveArea => 'Save area';

  @override
  String get locationAreaSaved => 'Area saved';

  @override
  String get locationNoRadiusResults => 'No results in this radius';

  @override
  String locationInsightsUnavailable(String error) {
    return 'Insights unavailable: $error';
  }

  @override
  String amenityScore(int score) {
    return 'Amenity score $score/100';
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
    return '$temp°C · $condition · feels $feelsLike°C · humidity $humidity%';
  }

  @override
  String fxRate(String base, String rate, String target) {
    return 'FX: 1 $base = $rate $target';
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
    return '$area scores $overall/100 for everyday convenience (amenity access — not crime or official livability). Strongest: $strongest. Weakest: $weakest. Within $radius km: $essentials grocery/pharmacy options, $health health-related places, $food food places, $transport transit-related places.';
  }

  @override
  String get scoreEssentials => 'Essentials';

  @override
  String get scoreHealth => 'Health';

  @override
  String get scoreFood => 'Food';

  @override
  String get scoreTransport => 'Transport';

  @override
  String get scoreMoney => 'Banks & ATMs';

  @override
  String get scoreEducation => 'Education';

  @override
  String get scoreFuel => 'Fuel';

  @override
  String get categoryRestaurants => 'Restaurants';

  @override
  String get categoryHotels => 'Hotels';

  @override
  String get categoryHospitals => 'Hospitals';

  @override
  String get categoryBanks => 'Banks';

  @override
  String get categoryPharmacies => 'Pharmacies';

  @override
  String get categorySchools => 'Schools';

  @override
  String get categorySupermarkets => 'Supermarkets';

  @override
  String get categoryMarkets => 'Markets';

  @override
  String get categoryFuel => 'Fuel';

  @override
  String get categoryNoResultsTitle => 'No results';

  @override
  String get categoryNoResultsMessage =>
      'Try another category or move the map.';

  @override
  String mapClusterPlaces(int count) {
    return '$count places';
  }

  @override
  String get mapTapToZoom => 'Tap to zoom';

  @override
  String get mapSearchArea => 'Search this area';

  @override
  String get mapMyLocation => 'My location';

  @override
  String get savedTitle => 'Saved';

  @override
  String get savedSubtitle =>
      'Places, neighborhoods, and collections synced to your account.';

  @override
  String get savedCollectionsTitle => 'Collections';

  @override
  String get savedNewCollection => 'New';

  @override
  String get savedNoCollections => 'No collections yet.';

  @override
  String get savedNeighborhoodsTitle => 'Neighborhoods';

  @override
  String get savedNoAreas => 'No saved areas yet.';

  @override
  String get savedPlacesTitle => 'Places';

  @override
  String get savedNoPlacesTitle => 'No saved places';

  @override
  String get savedNoPlacesMessage =>
      'Save restaurants, hotels, and more from details.';

  @override
  String get collectionFallbackName => 'Collection';

  @override
  String get collectionNewTitle => 'New collection';

  @override
  String get collectionNameHint => 'Name';

  @override
  String get collectionDeleteTooltip => 'Delete collection';

  @override
  String get collectionEmptyTitle => 'Empty collection';

  @override
  String get collectionEmptyMessage =>
      'Add places from Place Details → Save to collection.';

  @override
  String get collectionSavedArea => 'Saved area';

  @override
  String get collectionCreateFirst => 'Create a collection in Saved first';

  @override
  String get collectionAdded => 'Added to collection';

  @override
  String get areaFallbackName => 'Area';

  @override
  String get placeFallbackName => 'Place';

  @override
  String get placeOpenNow => 'Open now';

  @override
  String get placeClosed => 'Closed';

  @override
  String get placeSaved => 'Place saved';

  @override
  String get placeCollection => 'Collection';

  @override
  String get placeCall => 'Call';

  @override
  String get placeWebsite => 'Website';

  @override
  String get placeHours => 'Hours';

  @override
  String get placeReviews => 'Reviews';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileFallbackName => 'Traveler';

  @override
  String get profileChangePhoto => 'Change photo';

  @override
  String get profileSettingsSubtitle => 'Units, language, notifications, legal';

  @override
  String get profilePhotoUpdated => 'Profile photo updated';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchHint => 'Country, city, street, landmark, lat,lng';

  @override
  String get searchNoResults => 'No results for that search';

  @override
  String get searchVoiceTooltip => 'Voice search';

  @override
  String get searchVoiceDisabledTooltip => 'Voice search (enable in .env)';

  @override
  String get searchVoiceUnavailable => 'Microphone / speech not available';

  @override
  String get searchVoiceEnableInstruction =>
      'Set ENABLE_VOICE_SEARCH=true in .env to enable';

  @override
  String get searchRecentTitle => 'Recent searches';

  @override
  String get searchNoRecent => 'No recent searches yet.';

  @override
  String get searchPopularTitle => 'Popular searches';

  @override
  String get searchNoPopular => 'Popular searches will appear from real usage.';

  @override
  String get searchNoSuggestionsTitle => 'No suggestions';

  @override
  String get searchNoSuggestionsMessage =>
      'Try a city, landmark, or coordinates.';

  @override
  String get directionsLocationRequired =>
      'Current location required for directions';

  @override
  String get directionsNoRoute => 'No route found';

  @override
  String get directionsOriginYou => 'You';

  @override
  String get directionsDestination => 'Destination';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutDefaultDescription =>
      'Terrava helps anyone understand any neighborhood before visiting, moving, or living there.';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get helpTitle => 'Help';

  @override
  String get helpHowItWorksTitle => 'How Terrava works';

  @override
  String get helpHowItWorksBody =>
      'Search any place on Earth, explore nearby essentials on the map, open neighborhood details for amenity scores, and save places to your account.';

  @override
  String get helpScoresTitle => 'Neighborhood scores';

  @override
  String get helpScoresBody =>
      'Scores are convenience/amenity estimates from Google Places density, ratings, and distance. They are not crime, school-quality, or official livability ratings.';

  @override
  String get privacyBody =>
      'Terrava stores your account profile, saved places, search history, and optional push tokens in Supabase with row-level security. Location is used on-device to fetch nearby places from Google APIs. We do not sell personal data. Contact support for deletion requests.';

  @override
  String get termsBody =>
      'Terrava provides neighborhood discovery tools for informational purposes. Amenity scores are estimates, not guarantees of safety or livability. Third-party map and place data may be incomplete or outdated. Use the app in accordance with applicable laws and Google Maps / Places terms.';

  @override
  String get errorGenericTitle => 'Something went wrong';

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
