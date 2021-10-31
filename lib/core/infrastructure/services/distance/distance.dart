import 'package:food_ninja/core/infrastructure/utils/double/double.dart';

enum DistanceUnit {
  km,
  m
}

class UnitFormatter {
  String get(DistanceUnit unit) {
    switch(unit) {
      case DistanceUnit.km: return 'Km';
      case DistanceUnit.m: return 'm';
    }
  }
}

class Distance {
  final double value;
  final DistanceUnit unit;

  Distance(this.value, [this.unit = DistanceUnit.km]);

  @override
  String toString() {
    return '${Double.toTruncateZeroString(value)} ${UnitFormatter().get(unit)}';
  }
}