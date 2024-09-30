import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_smile/constant/route_constant.dart';
import 'package:just_smile/injector.dart';
import 'package:just_smile/modules/category/category_page.dart';
import 'package:just_smile/modules/category/providers/category_provider.dart';
import 'package:just_smile/modules/get_started/get_started_page.dart';
import 'package:just_smile/modules/home/home_page.dart';
import 'package:just_smile/modules/home/providers/home_provider.dart';
import 'package:just_smile/modules/joke/joke_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await inject();
  runApp(const JustSmileApp());
}

class JustSmileApp extends StatelessWidget {
  const JustSmileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Smile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1ACCBF)),
        useMaterial3: true,
        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
      ),
      initialRoute: Routes.getStarted,
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case Routes.getStarted:
            page = const GetStartedPage();
            break;
          case Routes.category:
            page = ChangeNotifierProvider.value(
              value: getIt.get<CategoryProvider>(),
              child: const CategoryPage(),
            );
            break;
          case Routes.joke:
            page = const JokePage();
            break;
          case Routes.home:
          default:
            page = ChangeNotifierProvider.value(
              value: getIt.get<HomeProvider>(),
              child: const HomePage(),
            );
            break;
        }
        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}
