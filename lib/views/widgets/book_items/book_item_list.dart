import 'package:book_store/models/book_item_model.dart';
import 'package:flutter/material.dart';

import 'book_item.dart';

class BookItemList extends StatelessWidget {
  const BookItemList({
    super.key,
    this.isLoading = true,
    required this.items,
  });
  final bool isLoading;
  final List<BookModel> items;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingState();
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 270),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index != 9 ? 0 : 10, left: index == 0 ? 10 : 0),
            child: BookItem(
              title: items[index].bookInfo.title,
              image: items[index].bookInfo.images?.thumbnail,
              rating: items[index].bookInfo.averageRating ?? 0,
              bookLink: items[index].selfLink,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
      ),
    );
  }

  Widget _buildLoadingState() {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index != 9 ? 0 : 10, left: index == 0 ? 10 : 0),
              child: Container(
                height: 140,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text('Loading...'),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 4,
        ));
  }
}
