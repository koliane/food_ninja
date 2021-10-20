import 'config.dart';
import 'env_enum.dart';
import 'dev/dev_config.dart';
import 'prod/prod_config.dart';

// Пока конфигурацию вынес в файл. По надобности, нужно будет переделать через файл .env
class Env {
  static const EnvEnum _env = EnvEnum.dev;
  static final Config _config = _env == EnvEnum.dev
      ? DevConfig()
      : ProdConfig();

  static bool get isDev => _env == EnvEnum.dev;
  static bool get isProduction => _env == EnvEnum.prod;

  static bool get needToSqliteRebuild => _config.needToSqliteRebuild;
  static String get apiBaseUrl => _config.apiBaseUrl;
}