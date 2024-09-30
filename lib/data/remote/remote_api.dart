import 'package:dio/dio.dart';

class RemoteApi {
  Dio dio = Dio();

  RemoteApi(this.dio);

  Future<Response> getAllJokes() async {
    return dio.get('/joke/Any?safe-mode&amount=10');
  }

  Future<Response> getCategories() async {
    return dio.get('/categories');
  }

  Future<Response> getJokesByCategory(String catName) async {
    return dio.get('/joke/$catName');
  }
}
