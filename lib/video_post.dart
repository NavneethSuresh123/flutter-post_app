import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({super.key});

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..addListener(() {
        setState(() {}); // Ensure the UI updates when the video state changes.
      })
      ..setLooping(true);

    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      print('Video Initialized'); // Debug statement
      setState(() {}); // Trigger a rebuild once the video is initialized
    }).catchError((error) {
      print('Error initializing video: $error'); // Debugging errors
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sharePost(BuildContext context) {
    final String url = 'https://yourwebsite.com/video';
    Share.share(url);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sharePost(context),
              child: const Text('Share Post'),
            ),
          ],
        ),
      ),
    );
  }
}
