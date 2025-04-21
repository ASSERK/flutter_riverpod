import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testpro/features/posts/data/model/posts_model.dart';

class PostService {
  Future<List<Post>> fetchPostsByUser(int userId) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/posts'),
    );
    final List data = json.decode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  }

  Future<Post> fetchPostById(int id) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );
    return Post.fromJson(json.decode(response.body));
  }
}
