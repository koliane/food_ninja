import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_ninja/core/data/clients/skeleton/base_client.dart';

class SecureStorageClient extends BaseClient{
  static final _instance = SecureStorageClient._();

  final FlutterSecureStorage _storage;


  SecureStorageClient._(): _storage = FlutterSecureStorage();

  factory SecureStorageClient() {
    return _instance;
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  Future<void> delete(String key) async {
    return await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }

  Future<void> write(String key, String? value) async {
    return await _storage.write(key: key, value: value);
  }
}