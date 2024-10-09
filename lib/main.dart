import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/feature/gallery/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meine Bildergalerie',
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}
