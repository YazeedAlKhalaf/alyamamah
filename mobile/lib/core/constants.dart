class Constants {
  static const double padding = 16;
  static const double spacing = padding / 2;

  static const String apiUrl = 'https://edugate.yu.edu.sa/yu';
  static const String yuApiBaseUrl = 'https://api-yu.alkhalaf.dev';

  static const String quasarApiHost = String.fromEnvironment('QUASAR_API_HOST');
  static const int quasarApiPort = int.fromEnvironment('QUASAR_API_PORT');
  static const bool isQuasarClientChannelSecure =
      bool.fromEnvironment('IS_QUASAR_CLIENT_CHANNEL_SECURE');

  static const String sharedAppGroup = 'group.dev.alkhalaf.alyamamah.shared';
  static const String twitterLink = 'https://twitter.com/YazeedAlKhalaf';
  static const String semesterProgressLink =
      'https://alyamamah-semester-progress.netlify.app';
  static const String tuwaiqClassroomsLink = 'https://tc.gdscyu.com';

  static const String usernameKey = 'username';
  static const String passwordKey = 'password';
  static const String accessTokenKey = 'accessToken';
  static const String localeKey = 'locale';
  static const String themeModeKey = 'themeMode';
  static const String coursesWidgetDataKey = 'coursesWidgetData';
  static const String ramadanModeKey = 'ramadanMode';
  static const String linkKey = 'link';
  static const String scheduleDaysKey = 'scheduleDays';
  static const String absencesKey = 'absences';

  static const String sentryDsn =
      'https://78cdadfd10c6445b9cd6d3cd44c0a66b@o4505085364862976.ingest.sentry.io/4505085366894592';

  static const String publicGoogleSdkKey = 'goog_YxqkNEvPlxaeZNvWVAUglEdLGZP';
  static const String publicIosSdkKey = 'appl_BDkULQjDCWnBPRxYDAotpqeKFio';
  static const String defaultOfferingId = 'default';
  static const String alyamamahGPTProductId =
      'dev.alkhalaf.alyamamah.alyamamahGPT';

  static const String unleashUrl =
      'https://unleash-yu.alkhalaf.dev/api/frontend';
  static const String unleashClientKey =
      'default:production.04c7ab3b41adbb4b40ebf156b01a1c5c7d10e11dc572096349a9b41f';
  static const String unleashAppName = 'alyamamah-app';

  static const String privacyPolicyUrl =
      'https://yu.alkhalaf.dev/privacy-policy';
  static const String termsOfUseUrl =
      'https://www.apple.com/legal/internet-services/itunes/dev/stdeula';

  static const String paymentUrl =
      'https://edugate.yu.edu.sa/yu/ui/student/onlinePayment/index/forwardPaymentIndex.faces';
  static const String loginUrl =
      '$apiUrl/resources/common/commonServies/actorDetails/-1/1/2';
}
