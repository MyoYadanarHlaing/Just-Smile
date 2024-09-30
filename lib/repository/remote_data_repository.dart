import 'package:dio/dio.dart';
import 'package:just_smile/data/remote/remote_data_source.dart';

class RemoteDataRepository {
  RemoteDataSource remoteDataSource;

  RemoteDataRepository({required this.remoteDataSource});

  Future<Response> getAllJokes() {
    return remoteDataSource.getAllJokes();
  }

  Future<Response> getCategories() {
    return remoteDataSource.getCategories();
  }

  Future<Response> getJokesByCategory(String catName) {
    return remoteDataSource.getJokesByCategory(catName);
  }
}
