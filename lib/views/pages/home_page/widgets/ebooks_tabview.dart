import 'package:book_store/models/book_item_model.dart';
import 'package:book_store/services/book_service/book_repository.dart';
import 'package:book_store/views/pages/home_page/home_controller.dart';
import 'package:book_store/views/widgets/select_from_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/book_items/book_item_list.dart';

class EbooksTab extends GetWidget<HomeController> {
  const EbooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          BooksType.values.length,
          (index) => _buildBookItem(context, index),
        ),
      ),
    );
  }

  Widget _buildBookItem(BuildContext ctx, int index) {
    return _ShowDashBoard(
      getBooksList: () => controller.showDashboard(_booksCategory()[index]),
      title: _booksCategory()[index].name.toUpperCase(),
    );
  }

  List<BooksType> _booksCategory() {
    return BooksType.values;
  }
}

class _ShowDashBoard extends StatefulWidget {
  const _ShowDashBoard({
    required this.getBooksList,
    required this.title,
  });
  final Future<List<BookModel>> Function() getBooksList;
  final String title;

  @override
  State<_ShowDashBoard> createState() => _ShowDashBoardState();
}

class _ShowDashBoardState extends State<_ShowDashBoard> {
  bool _isLoading = true;
  List<BookModel> books = [];

  Future<void> _getBooks() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    books = await widget.getBooksList.call();
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    _getBooks();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectFromTitle(
          title: widget.title,
          onTap: () {},
        ),
        if (books.isEmpty && !_isLoading)
          const Center(
            child: Text('No Items Found'),
          )
        else
          BookItemList(
            isLoading: _isLoading,
            items: books,
          )
      ],
    );
  }
}
