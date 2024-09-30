import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_smile/constant/route_constant.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: const Color(0xFFBCA0EF),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Image.asset(
              'assets/images/enjoy.png',
              width: 150,
              height: 150,
            ),
            Image.asset(
              'assets/images/bear.png',
              width: 150,
              height: 150,
            ),
            Expanded(child: Container()),
            const Text(
              'Welcome To',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              'THE BEST JOKES',
              style: TextStyle(
                fontFamily: GoogleFonts.aladin().fontFamily,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFAD4C4),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.home);
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    shadows: [Shadow(blurRadius: 5, color: Colors.white)],
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
