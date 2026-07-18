abstract final class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const signIn = '/auth/sign-in';
  static const signUp = '/auth/sign-up';
  static const forgotPassword = '/auth/forgot-password';
  static const home = '/home';
  static const explore = '/explore';
  static const saved = '/saved';
  static const profile = '/profile';
  static const search = '/search';
  static const locationDetails = '/location/:lat/:lng';
  static const placeDetails = '/place/:placeId';
  static const directions = '/directions';
  static const categoryResults = '/category/:type';
  static const settings = '/settings';
  static const about = '/about';
  static const help = '/help';
  static const privacy = '/privacy';
  static const terms = '/terms';
  static const collection = '/collection/:id';

  static String locationDetailsPath(double lat, double lng) =>
      '/location/$lat/$lng';

  static String placeDetailsPath(String placeId) => '/place/$placeId';

  static String categoryPath(String type) => '/category/$type';

  static String categoryPathAt(String type, double lat, double lng) =>
      '/category/$type?lat=$lat&lng=$lng';

  static String collectionPath(String id) => '/collection/$id';
}
