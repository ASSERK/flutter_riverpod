import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpro/features/posts/data/model/posts_model.dart';
import 'package:testpro/features/posts/data/repository/posts_service_repository.dart';

final postServiceProvider = Provider((ref) => PostService());

final postsByUserProvider =
    FutureProvider.family<List<Post>, int>((ref, userId) {
  return ref.read(postServiceProvider).fetchPostsByUser(userId);
});
