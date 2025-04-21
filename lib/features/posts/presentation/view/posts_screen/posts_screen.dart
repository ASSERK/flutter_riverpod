import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpro/features/posts/presentation/view/posts_detail_screen/posts_detail_screen.dart';
import 'package:testpro/features/posts/presentation/viewmodel/posts_view_model.dart';

class PostsScreen extends ConsumerWidget {
  final int userId;
  const PostsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsByUserProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text("بوستات المستخدم")),
      body: postsAsync.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
                child: ListTile(
                  title: Text(post.title),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetailScreen(postId: post.id),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("خطأ")),
      ),
    );
  }
}
