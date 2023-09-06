import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/data/models/user.model.dart';

///
/// Maybe initialize all boxes here!
///
@singleton
class HiveDatabase {
  ///
  Box<User> userBox;

  ///
  HiveDatabase(this.userBox);

  ///
  /// THIS IS HOW WE INITIALIZE THE ASYNC OBJECTS
  /// IN INJECTABLE LIBRARY!!
  ///
  @factoryMethod
  @preResolve
  static Future<HiveDatabase> init() async {
    await Hive.initFlutter();
    Box<User> userBox = await Hive.openBox('userBox');
    HiveDatabase hv = HiveDatabase(userBox);
    hv.initAdapters();
    return hv;
  }

  ///
  void initAdapters() {
    Hive.registerAdapter(UserAdapter());
  }
}
