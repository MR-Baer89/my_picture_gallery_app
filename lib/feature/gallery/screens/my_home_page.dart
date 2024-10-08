import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/feature/gallery/data/gallery_data.dart';
import 'package:my_picture_gallery_app/feature/gallery/screens/image_gallery.dart';
import 'package:my_picture_gallery_app/feature/profil/screens/profile_page.dart';

import '../../search/widgets/image_search_delegate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    ImageGallery(galleryData: galleryData),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 13, 145),
        title: const Text(
          'Meine Bildergalerie',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ImageSearchDelegate(galleryData: galleryData),
              );
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 197, 196, 196),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Bilder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 118, 53, 203),
        onTap: _onItemTapped,
      ),
    );
  }
}
