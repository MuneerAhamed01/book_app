import 'package:get/get.dart';

class BookApi extends GetxService {
  final GetConnect _connect;

  BookApi(this._connect);

  Future<Response<dynamic>> getBusinessBooks() async {
    return _connect.get('v1/volumes',
        query: {"q": 'subject:"Business-Economics"', "maxResult": "10"});
  }

  Future<Response<dynamic>> getSelfHelpBooks() async {
    return _connect.get('v1/volumes',
        query: {"q": 'subject:"self-help"', "maxResult": "10"});
  }

  Future<Response<dynamic>> getHealthAndMindBooks() async {
    return _connect.get('v1/volumes',
        query: {"q": 'subject:"health"', "maxResult": "10"});
  }

  Future<Response<dynamic>> getTopSellingBooks() async {
    return _connect.get('v1/volumes',
        query: {"q": 'category:"top-selling"', "maxResult": "10"});
  }
}
