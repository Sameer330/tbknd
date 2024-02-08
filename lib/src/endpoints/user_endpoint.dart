import 'package:serverpod/serverpod.dart';
import 'package:tbknd_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<Map<String, dynamic>> create(Session session, User user) async {
    user.image = 'https://picsum.photos/200';

    await User.db.insert(
      session,
      [user],
    );

    return user.toJson();
  }

  Future<Map<String, dynamic>> read(Session session, int id) async {
    var users = await User.db.findById(
      session,
      id,
    );

    if (users == null) {
      return {
        'statusCode': 404,
        'message': 'User not found.',
      };
    }

    var res = users.toJson();

    res['statusCode'] = 200;

    return res;
  }

  Future<Map<String, dynamic>> readAll(Session session) async {
    final users = await User.db.find(session);

    var res = <String, dynamic>{};

    res['users'] = users.map((e) => e.toJson()).toList();
    res['statusCode'] = 200;

    return res;
  }

  Future<Map<String, dynamic>> update(Session session, User user) async {
    await User.db.update(session, [user]);

    return user.toJson();
  }

  Future<Map<String, dynamic>> delete(Session session, int id) async {
    Map<String, dynamic> res = {};

    var isExist = await User.db.findById(session, id);

    if (isExist != null) {
      final deletedUser = await User.db.deleteWhere(
        session,
        where: (value) {
          return value.id.equals(id);
        },
      );

      res['statusCode'] = 200;
      res['deleted'] = deletedUser;

      return res;
    }

    return {
      'statusCode': 404,
      'message': 'User not found. Cannot be deleted!',
    };
  }
}
