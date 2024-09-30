import 'package:flutter/material.dart';
import 'package:just_smile/injector.dart';
import 'package:just_smile/modules/category/providers/category_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/category_item_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: getIt.get<CategoryProvider>(),
        builder: (context, wd) {
          context.read<CategoryProvider>().getCategories();

          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFBCA0EF),
                    Color(0xFF1ACCBF),
                  ],
                ),
              ),
              child: Consumer<CategoryProvider>(
                  builder: (context, categoryProvider, wd) {
                return categoryProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Select Your\nCategory',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 32),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 24,
                                ),
                                itemCount: categoryProvider.categories.length,
                                itemBuilder: (context, pos) {
                                  return CategoryItemWidget(
                                      name: categoryProvider.categories[pos],
                                      index: pos);
                                }),
                          ),
                        ],
                      );
              }),
            ),
          );
        });
  }
}
