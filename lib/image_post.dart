import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key});

  void _sharePost(BuildContext context) {
    final String url = 'https://yourwebsite.com/image';
    Share.share(url);
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is an image post.'),
          const SizedBox(height: 20),
          // Displaying an image from assets
          Image.asset(
            'assets/image.jpg', // Path to your local image asset
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
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
