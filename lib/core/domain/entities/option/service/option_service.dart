import '../model/option.dart';
import '../repository/option_repository.dart';
import '../../skeleton/collection/base_collection.dart';

class OptionService {
  const OptionService();

  Future<BaseCollection<Option>> getAllOptions() async {
    return const OptionRepository().read();
  }

  Future<bool> updateOption(covariant Option option) async {
    return const OptionRepository().update(option);
  }
}