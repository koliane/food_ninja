class OptionsProps {
  static const String needToShowOnboarding = 'need_to_show_onboarding';
  static const String apiAuthToken = 'api_auth_token';

  static const List<String> secureProps = [
    apiAuthToken
  ];

  static const List<String> boolProps = [
    needToShowOnboarding,
  ];

  static bool isBool(String code) {
    return boolProps.contains(code);
  }

  static bool isSecure(String code) {
    return secureProps.contains(code);
  }

}