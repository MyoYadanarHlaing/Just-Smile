import 'package:flutter/material.dart';
import 'package:just_smile/modules/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, ch) {
      return Scaffold(
        body: provider.widgets[provider.index],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: provider.index == 0
              ? const Color(0xFFFAD4C4)
              : provider.index == 1
                  ? const Color(0xFF1ACCBF)
                  : const Color(0xFF459C68),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.5),
          currentIndex: provider.index,
          onTap: (index) => provider.onBottomNavigationChanged(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
