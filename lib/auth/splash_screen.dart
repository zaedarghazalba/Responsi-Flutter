// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:async';

class FlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start the navigation process
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 500,
              height: 100,
            ), // Adjust size as needed
            const SizedBox(height: 20),
            const Text(
              "Loading Time 5 detik",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
