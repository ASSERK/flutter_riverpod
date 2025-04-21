import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpro/features/posts/data/model/posts_model.dart';
import 'package:testpro/features/posts/data/repository/posts_service_repository.dart';

final postServiceProvider = Provider((ref) => PostService());

final postsByUserProvider =
    FutureProvider.family<List<Post>, int>((ref, userId) {
  return ref.read(postServiceProvider).fetchPostsByUser(userId);
});

class PostByIdNotifier extends FamilyAsyncNotifier<Post, int> {
  late int postId;

  @override
  Future<Post> build(int arg) async {
    postId = arg;
    return ref.read(postServiceProvider).fetchPostById(postId);
  }

  Future<void> refreshPost() async {
    state = const AsyncLoading();
    try {
      final post = await ref.read(postServiceProvider).fetchPostById(postId);
      state = AsyncData(post);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final postByIdNotifierProvider =
    AsyncNotifierProviderFamily<PostByIdNotifier, Post, int>(
        PostByIdNotifier.new);
