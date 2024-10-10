import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/feature/gallery/data/gallery_data.dart';
import 'package:my_picture_gallery_app/feature/gallery/screens/image_detail_page.dart';

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
            shadowColor: Colors.blueGrey,
            child: Column(
              children: [
                SizedBox(
                  width: 160,
                  height: 160,
                  child: Image.asset(item.imagePath, fit: BoxFit.cover),
                ),
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
