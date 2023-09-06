///
/// [StorageInterface]
///
abstract class StorageInterface {
  ///
  /// Save an item
  ///
  Future<void> save(String key, dynamic content);

  ///
  /// Retrieve an item by [key]
  ///
  String? retrieveString(String key);

  ///
  /// Retrieve as bool by [key]
  ///
  bool? retrieveBool(String key);

  ///
  /// Retrieve as int by [key]
  ///
  int? retrieveInt(String key);

  ///
  /// Retrieve as double as [String] by [key]
  ///
  double? retrieveDouble(String key);

  ///
  /// Retrieve an List of String by [key]
  ///
  List<String>? retrieveStringList(String key);

  ///
  /// Delete an item by [key]
  ///
  Future<bool> delete(String? key);

  ///
  /// Check if an item exists
  ///
  bool exists(String key);
}
