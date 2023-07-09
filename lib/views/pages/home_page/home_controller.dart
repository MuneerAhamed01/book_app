import 'package:book_store/services/book_service/book_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  showDashboard(BooksType type) {
   return Get.find<BookRepository>().getBooks(type);
  }
}
