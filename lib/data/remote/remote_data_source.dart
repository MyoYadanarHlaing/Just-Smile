import 'package:dio/dio.dart';
import 'package:just_smile/data/remote/remote_api.dart';

class RemoteDataSource {
  RemoteApi remoteApi;

  RemoteDataSource({required this.remoteApi});

  Future<Response> getAllJokes() {
    return remoteApi.getAllJokes();
  }

  Future<Response> getCategories() {
    return remoteApi.getCategories();
  }

  Future<Response> getJokesByCategory(String catName) {
    return remoteApi.getJokesByCategory(catName);
  }
}
