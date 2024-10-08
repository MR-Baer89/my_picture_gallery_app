import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/feature/gallery/data/gallery_data.dart';

class ImageDetailPage extends StatelessWidget {
  final GalleryItem image;

  const ImageDetailPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 99, 13, 145),
        title: Text(
          image.imageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image.imagePath),
              const SizedBox(height: 16),
              Text('Datum: ${image.imageDate}',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              Text('Beschreibung:',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(image.imageDescription),
              const SizedBox(height: 8),
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
      ),
    );
  }
}
