class OptionsProps {
  static const String needToShowOnboarding = 'need_to_show_onboarding';

  static const List<String> boolProps = [
    needToShowOnboarding,
  ];

  static bool isBool(String code) {
    return boolProps.contains(code);
  }

}