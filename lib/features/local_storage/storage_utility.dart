import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  //final _storage = GetStorage();
  late final GetStorage _storage;

  static TLocalStorage? _instance;

  TLocalStorage._internal();

  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketname) async {
    await GetStorage.init(bucketname);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketname);
  }

  //Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
