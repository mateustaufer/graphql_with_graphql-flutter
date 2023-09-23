import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static const String storageContainer = 'data';

  static Future<bool> init() => GetStorage.init(storageContainer);
  static Future<void> erase() => GetStorage(storageContainer).erase();

  static getData({required String key}) =>
      GetStorage(storageContainer).read<dynamic>(key);

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) =>
      GetStorage(storageContainer).write(key, value);
}
