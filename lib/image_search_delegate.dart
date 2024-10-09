import 'package:flutter/material.dart';
import 'package:my_picture_gallery_app/widgets/gallery_data.dart';
import 'package:my_picture_gallery_app/screens/image_detail_page.dart';

class ImageSearchDelegate extends SearchDelegate {
  final List<GalleryItem> galleryData;

  ImageSearchDelegate({required this.galleryData});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<GalleryItem> results = galleryData
        .where((item) =>
            item.imageTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
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

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<GalleryItem> suggestions = galleryData
        .where((item) =>
            item.imageTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.imageTitle),
          onTap: () {
            query = suggestion.imageTitle;
            showResults(context);
          },
        );
      },
    );
  }
}
