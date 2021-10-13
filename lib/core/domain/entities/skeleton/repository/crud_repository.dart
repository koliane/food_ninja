import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';
import 'package:food_ninja/core/domain/entities/skeleton/model/base_model.dart';
import 'package:food_ninja/core/domain/entities/skeleton/repository/base_repository.dart';

abstract class CrudRepository<T extends BaseModel> extends BaseRepository {
  Future<int> create(T model);
  Future<BaseCollection<T>> read();
  Future update(T model);
  //ignore: avoid_annotating_with_dynamic
  Future delete(covariant dynamic key);
}