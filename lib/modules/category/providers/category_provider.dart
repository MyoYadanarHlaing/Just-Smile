import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_smile/data/model/category_response_model.dart';
import 'package:just_smile/repository/remote_data_repository.dart';

class CategoryProvider extends ChangeNotifier {
  RemoteDataRepository remoteDataRepository;
  bool isLoading = false;
  List<String> categories = [];

  CategoryProvider({required this.remoteDataRepository});

  Future<void> getCategories() async {
    isLoading = true;
    Response response = await remoteDataRepository.getCategories();
    if (response.statusCode == 200) {
      CategoryResponseModel categoryResponseModel =
          CategoryResponseModel.fromJson(response.data);
      if (!categoryResponseModel.error) {
        categories = categoryResponseModel.categories;
      } else {
        debugPrint('cat err=${categoryResponseModel.error}');
      }
    } else {
      debugPrint('error=${response.data.toString()}');
    }
    isLoading = false;
    notifyListeners();
  }
}
