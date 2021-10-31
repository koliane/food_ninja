import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';

abstract class BaseRepository {
  final BaseProvider? provider;
  const BaseRepository([this.provider]);
}