import 'package:book_store/services/book_service/book_api.dart';
import 'package:book_store/services/book_service/book_repository.dart';
import 'package:book_store/views/pages/home_page/home_controller.dart';
import 'package:book_store/views/pages/main_page/main_page_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(BindRepositories());
  }
}

class BindRepositories extends GetxService {
  late final GetConnect _booksDio;
  @override
  void onInit() {
    _booksDio = _createConnect();
    _bindRep();
    super.onInit();
  }

  _bindRep() {
    Get.put(BookApi(_booksDio), permanent: true);
    Get.put(BookRepository(), permanent: true);
  }

  GetConnect _createConnect() {
    final connect = GetConnect();
    connect.baseUrl = 'https://www.googleapis.com/books/';
    return connect;
  }
}
