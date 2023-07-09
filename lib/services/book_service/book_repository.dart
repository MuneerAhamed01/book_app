import 'package:book_store/models/book_item_model.dart';
import 'package:book_store/services/book_service/book_api.dart';
import 'package:get/get.dart';

enum BooksType { business, topSelling, health, selfHelp }

class BookRepository extends GetxService {
  final _bookApi = Get.find<BookApi>();

  Future<List<BookModel>> getBooks(BooksType type) async {
    Response? response;
    try {
      if (type == BooksType.business) {
        response = await _bookApi.getBusinessBooks();
      }
      if (type == BooksType.topSelling) {
        response = await _bookApi.getTopSellingBooks();
      }
      if (type == BooksType.health) {
        response = await _bookApi.getHealthAndMindBooks();
      }
      if (type == BooksType.selfHelp) {
        response = await _bookApi.getSelfHelpBooks();
      }

      if (response?.body['items'] != null) {
        print('response ${response?.body['items']}');

       return (response?.body['items'] as List).map((e) => BookModel.fromJson(e)).toList();

        // return BookModel.fromJson(response!.body['items']!);
      }

      throw Exception('No data');
    } catch (e) {
      print('response ${response}');

      rethrow;
    }
  }
}
