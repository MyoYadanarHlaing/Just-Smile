import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_smile/data/model/joke_response_model.dart';
import 'package:just_smile/repository/remote_data_repository.dart';

class JokeProvider extends ChangeNotifier {
  RemoteDataRepository remoteDataRepository;
  bool isLoading = false;
  List<JokeModel> jokes = [];

  JokeProvider({required this.remoteDataRepository});

  void getAllJokes() async {
    isLoading = true;
    Response response = await remoteDataRepository.getAllJokes();
    if (response.statusCode == 200) {
      if (response.data != null) {
        JokeResponseModel jokeModel = JokeResponseModel.fromJson(response.data);
        if (!jokeModel.error && jokeModel.jokes != null) {
          jokes = jokeModel.jokes!;
        }
      }
    } else {
      debugPrint('joke error=${response.data}');
    }
    isLoading = false;
    notifyListeners();
  }

  void getJokesByCategory(String catName) async {
    isLoading = true;
    Response response = await remoteDataRepository.getJokesByCategory(catName);
    if (response.statusCode == 200) {
      if (response.data != null) {
        JokeResponseModel jokeModel = JokeResponseModel.fromJson(response.data);
        if (!jokeModel.error && jokeModel.jokes != null) {
          jokes = jokeModel.jokes!;
        }
      }
    } else {
      debugPrint('joke by category error=${response.data}');
    }
    isLoading = false;
    notifyListeners();
  }
}
