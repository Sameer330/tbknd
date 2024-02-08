import 'package:serverpod/serverpod.dart';
import 'package:tbknd_server/src/generated/protocol.dart';

class PostsEndpoint extends Endpoint {
  Future<Map<String, dynamic>> createPost(Session session, Post post) async {
    Map<String, dynamic> res = {};

    print('Creating post: ${post.text} for user: ${post.userId}');

    var newPost = await Post.db.insertRow(
      session,
      post,
    );

    res['statusCode'] = 200;
    res['post'] = newPost.toJson();

    return res;
  }

  Future<Map<String, dynamic>> readAllPosts(Session session) async {
    Map<String, dynamic> res = {};

    res['statusCode'] = 200;
    res['data'] = await Post.db.find(
      session,
    );

    return res;
  }
}
