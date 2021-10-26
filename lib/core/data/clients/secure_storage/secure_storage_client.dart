import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_ninja/core/data/clients/skeleton/base_client.dart';

class SecureStorageClient extends BaseClient{
  static final _instance = SecureStorageClient._();

  final FlutterSecureStorage _storage;


  SecureStorageClient._(): _storage = const FlutterSecureStorage();

  factory SecureStorageClient() {
    return _instance;
  }

  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  Future<Map<String, String>> readAll() {
    return _storage.readAll();
  }

  Future<bool> containsKey(String key) {
    return _storage.containsKey(key: key);
  }

  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  Future<void> write(String key, String? value) {
    return _storage.write(key: key, value: value);
  }
}