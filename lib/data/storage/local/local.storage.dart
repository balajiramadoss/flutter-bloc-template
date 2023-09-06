import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/data/abstracts/abstract.storage.dart';

///
/// [LocalStorage]
///
@singleton
class LocalStorage implements StorageInterface {
  ///
  /// [SharedPreferences]
  ///
  final SharedPreferences preferences;

  ///
  /// Constructor
  ///
  LocalStorage(this.preferences);

  @override
  Future<void> save(String key, dynamic content) async {
    if (content is String) {
      await preferences.setString(key, content);
    }
    if (content is bool) {
      await preferences.setBool(key, content);
    }
    if (content is int) {
      await preferences.setInt(key, content);
    }
    if (content is double) {
      await preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await preferences.setStringList(key, content);
    }
  }

  @override
  Future<bool> delete(String? key) {
    return preferences.remove(key!);
  }

  @override
  bool exists(String key) {
    return preferences.containsKey(key);
  }

  @override
  bool? retrieveBool(String key) {
    return preferences.getBool(key);
  }

  @override
  double? retrieveDouble(String key) {
    return preferences.getDouble(key);
  }

  @override
  int? retrieveInt(String key) {
    return preferences.getInt(key);
  }

  @override
  String? retrieveString(String key) {
    return preferences.getString(key);
  }

  @override
  List<String>? retrieveStringList(String key) {
    return preferences.getStringList(key);
  }
}
