/// Account roles stored on `profiles.role`.
enum UserRole {
  civilian,
  businessOwner;

  static UserRole fromDb(String? value) {
    return switch (value) {
      'business_owner' => UserRole.businessOwner,
      _ => UserRole.civilian,
    };
  }

  String get dbValue => switch (this) {
        UserRole.civilian => 'civilian',
        UserRole.businessOwner => 'business_owner',
      };

  bool get canList => this == UserRole.businessOwner;
}
