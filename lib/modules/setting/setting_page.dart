import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDDFCB9),
              Color(0xFF459C68),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
