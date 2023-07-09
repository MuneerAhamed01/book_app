import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

enum BookItemType { grid, list }

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    this.type = BookItemType.grid,
    this.bookLink
  });

  final String? image;
  final String title;
  final double rating;
  final BookItemType type;
  final String? bookLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(bookLink != null && bookLink!.isNotEmpty){
          launchUrl(Uri.parse(bookLink!));

        }
      },
      child: type == BookItemType.grid ? _buildGridItem() : _buildListItems(),
    );
  }

  Column _buildGridItem() {
    const Color color = Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image == null) _buildErrorWidget() else _buildImage(),
        SizedBox(
          width: 140,
          child: Text(
            title,
            maxLines: 2,
            style: const TextStyle(color: color),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (rating == 0) const SizedBox() else _buildRating(color)
      ],
    );
  }

  Row _buildRating(Color color) {
    return Row(
      children: [
        Text(
          rating.toStringAsFixed(2),
          style: TextStyle(color: color),
        ),
        Icon(
          Icons.star,
          color: color,
          size: 14,
        ),
      ],
    );
  }

  _buildListItems() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sample Book item",
                maxLines: 2,
                style: Get.textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              if (rating == 0) const SizedBox() else _buildRating(Colors.grey)
            ],
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Icon(Icons.more_horiz),
        )
      ],
    );
  }

  _buildImage() {
    Size size;
    if (type == BookItemType.grid) {
      size = const Size(140, 200);
    } else {
      size = const Size(80, 100);
    }
    return CachedNetworkImage(
      imageUrl: type == BookItemType.list
          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh9bf6avN_6gcIakCx1zGTVrbKCl_IZVm0TS_toQOfwQ&s"
          : image!,
      errorWidget: (context, url, error) => const Icon(Icons.info),
      imageBuilder: (_, imageProvider) => Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
        ),
      ),
    );
  }

  _buildErrorWidget() {
    Size size;
    if (type == BookItemType.grid) {
      size = const Size(140, 200);
    } else {
      size = const Size(80, 100);
    }
    return SizedBox(
      height: size.height,
      width: size.width,
      child: const Center(
        child: Text('No image found'),
      ),
    );
  }
}
