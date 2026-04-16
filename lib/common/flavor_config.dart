enum FlavorConfig {
  development(
    baseUrl: 'https://equran.id/api/v2',
    baseUrlDoa: 'https://doa-doa-api-ahmadramadhan.fly.dev',
    baseUrlPrayerTime: 'https://api.aladhan.com/v1',
  ),
  staging(
    baseUrl: 'https://equran.id/api/v2',
    baseUrlDoa: 'https://doa-doa-api-ahmadramadhan.fly.dev',
    baseUrlPrayerTime: 'https://api.aladhan.com/v1',
  ),
  production(
    baseUrl: 'https://equran.id/api/v2',
    baseUrlDoa: 'https://doa-doa-api-ahmadramadhan.fly.dev',
    baseUrlPrayerTime: 'https://api.aladhan.com/v1',
  );

  final String baseUrl;
  final String baseUrlDoa;
  final String baseUrlPrayerTime;

  const FlavorConfig({
    required this.baseUrl,
    required this.baseUrlDoa,
    required this.baseUrlPrayerTime,
  });

  /// The current active flavor, set during bootstrap
  static late FlavorConfig current;
}
