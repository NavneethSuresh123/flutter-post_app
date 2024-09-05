import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPost extends StatelessWidget {
  const TextPost({super.key});

  void _sharePost(BuildContext context) {
    final String url = 'myapp://text';
    Share.share('Check out this post: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is a text post.'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _sharePost(context),
            child: const Text('Share Post'),
          ),
        ],
      ),
    );
  }
}
