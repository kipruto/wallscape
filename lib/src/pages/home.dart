import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor:
              Colors.white, // Reset to white for the next screen
          systemNavigationBarIconBrightness:
              Brightness.dark, // Dark icons for contrast
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white, title: const Text('Home')),
          body: const Center(
            child: Text('Welcome to the Home Screen!'),
          ),
        ));
  }
}
