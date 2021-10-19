abstract class Double {
  static String toTruncateZeroString(double value) {
    final String result = value.toString();
    final List<String> parts = result.split('.');

    if(parts.length == 1) {
      return result;
    }

    final RegExp pattern = RegExp(r"0*$");
    final lastPart = parts.last.replaceAll(pattern, '');

    if(lastPart.isEmpty) {
      return parts.first;
    }

    return '${parts.first}.$lastPart';
  }
}