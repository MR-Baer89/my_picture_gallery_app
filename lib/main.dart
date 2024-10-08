import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/gallery_data.dart';
import 'package:my_picture_gallery_app/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meine Bildergalerie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

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
    ImageGallery(galleryData: galleryData), // Pass galleryData as an argument
    const ProfilePage(),
    // ... andere Screens hinzufügen (z.B. Profilseite)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine Bildergalerie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementiere Suchfunktion
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex], // Zeige den ausgewählten Screen
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Bilder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ), // Add a new item for "Profile"
          // ... weitere BottomNavigationBarItems für andere Screens
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<GalleryItem> galleryData;

  const ImageGallery({super.key, required this.galleryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final item = galleryData[index];
          return Card(
            child: Column(
              children: [
                // Use Image.asset for local images
                Image.asset(item.imagePath),
                Text(item.imageTitle),
                Text(item.imageDate),
                // ... weitere Informationen
              ],
            ),
          );
        },
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final GalleryItem image;

  const ImageDetailPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.imageTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Große Bildansicht
            Image.network(
              image.imagePath,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Datum:${image.imageDate}',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text('Beschreibung:',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(image.imageDescription),
                  const SizedBox(height: 8),
                  // Tags anzeigen
                  if (image.tags.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: image.tags.map((tag) {
                        return Chip(
                          label: Text(tag),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
