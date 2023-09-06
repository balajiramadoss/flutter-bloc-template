import 'package:injectable/injectable.dart';
import 'package:starter/data/models/user.model.dart';
import 'package:starter/data/storage/db/dao/user_dao.dart';

///
@singleton
class UserRepository {

  ///
  final UserDao userDao;

  ///
  UserRepository(this.userDao);

  ///
  Future<User?> getUser() async {
    return userDao.getUser();
  }

  ///
  Future<void> addUser(User user) async {
    await userDao.saveOrUpdateUser(user);
  }
}
