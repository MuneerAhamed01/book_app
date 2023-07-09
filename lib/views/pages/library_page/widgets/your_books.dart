import 'package:book_store/views/widgets/book_items/book_item.dart';
import 'package:flutter/material.dart';

class YourBooks extends StatelessWidget {
  const YourBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: _itemBuilder,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BookItem(
        image: '',
        title: 'jd jd jd jd',
        rating: 3.9,
        type: BookItemType.list,
      ),
    );
  }
}
