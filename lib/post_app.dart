import 'package:flutter/material.dart';
import 'text_post.dart';
import 'video_post.dart';
import 'image_post.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Post App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/text': (context) => const TextPost(),
        '/video': (context) => const VideoPost(),
        '/image': (context) => const ImagePost(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const TextPost(),
    const VideoPost(),
    const ImagePost(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
        ],
      ),
    );
  }
}
