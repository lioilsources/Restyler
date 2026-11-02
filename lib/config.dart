import 'package:tsumiki_shared/tsumiki_shared.dart';

/// Build-time settings (`make run`, `.env.local`).
class AppConfig {
  const AppConfig({
    required this.apiUrl,
    required this.appToken,
    required this.user,
    this.cfAccessClientId = '',
    this.cfAccessClientSecret = '',
  });

  factory AppConfig.fromEnvironment() => const AppConfig(
    apiUrl: String.fromEnvironment(
      'RESTYLER_API_URL',
      defaultValue: 'https://restyler-api.ol1n.com',
    ),
    appToken: String.fromEnvironment('RESTYLER_APP_TOKEN'),
    user: String.fromEnvironment('RESTYLER_USER'),
    cfAccessClientId: String.fromEnvironment('CF_ACCESS_CLIENT_ID'),
    cfAccessClientSecret: String.fromEnvironment('CF_ACCESS_CLIENT_SECRET'),
  );

  final String apiUrl;
  final String appToken;
  final String user;
  final String cfAccessClientId;
  final String cfAccessClientSecret;

  bool get configured => appToken.isNotEmpty && user.isNotEmpty;

  AppAuth get auth => AppAuth(
    token: appToken,
    user: user,
    cfAccessClientId: cfAccessClientId,
    cfAccessClientSecret: cfAccessClientSecret,
  );
}
