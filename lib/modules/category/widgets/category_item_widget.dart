import 'package:flutter/material.dart';

import '../../joke/joke_page.dart';

class CategoryItemWidget extends StatelessWidget {
  final String name;
  final int index;

  const CategoryItemWidget({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JokePage(
                  fromCategory: true,
                  catName: name,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity((16 - index) / 30),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/prank.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
