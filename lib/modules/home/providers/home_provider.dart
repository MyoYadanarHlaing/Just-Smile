import 'package:flutter/cupertino.dart';
import 'package:just_smile/modules/category/category_page.dart';
import 'package:just_smile/modules/joke/joke_page.dart';
import 'package:just_smile/modules/setting/setting_page.dart';

class HomeProvider extends ChangeNotifier {
  int index = 0;
  List<Widget> widgets = [
    const JokePage(),
    const CategoryPage(),
    const SettingPage()
  ];

  onBottomNavigationChanged(int index) {
    this.index = index;
    notifyListeners();
  }
}
