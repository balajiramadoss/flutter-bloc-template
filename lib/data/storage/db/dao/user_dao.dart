import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/data/models/user.model.dart';
import 'package:starter/data/storage/db/hive_database.dart';

///
/// [UserDao]
///
@injectable
class UserDao {
  ///
  static const String userId = 'user_id';

  ///
  HiveDatabase hiveDatabase;

  ///
  Box<User> get userBox => hiveDatabase.userBox;

  ///
  UserDao(this.hiveDatabase);

  ///
  Future<User?> getUser() async {
    return userBox.get(userId);
  }

  ///
  Future<void> saveOrUpdateUser(User user) async {
    await userBox.put(userId, user);
  }

  ///
  Future<void> drop() async {
    userBox.delete(userId);
  }
}
