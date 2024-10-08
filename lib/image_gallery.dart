import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/gallery_data.dart';
import 'package:my_picture_gallery_app/image_detail_page.dart';

class ImageGallery extends StatelessWidget {
  final List<GalleryItem> galleryData;

  const ImageGallery({super.key, required this.galleryData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: galleryData.length,
      itemBuilder: (context, index) {
        final item = galleryData[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDetailPage(image: item),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.asset(item.imagePath),
                Text(item.imageTitle),
                Text(item.imageDate),
              ],
            ),
          ),
        );
      },
    );
  }
}
