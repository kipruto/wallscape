// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaperapp/src/pages/home.dart';
import 'dart:async';
import 'package:wallpaperapp/src/pages/onboarding/introscreen.dart'; // For Timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a timer to navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 5), () {
      _navigateBasedOnIntroSeen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blueAccent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            children: [
              const Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(Icons.ac_unit, size: 130, color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      "WallScape Premium",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Wallpapers",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),

              Container(height: 2, width:  MediaQuery.of(context).size.width * 0.7, decoration: const BoxDecoration(color: Colors.white),),
                 const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Designed by Kipruto (kiprutodev.net)",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateBasedOnIntroSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? introsalreadyseen = prefs.getBool('introsalreadyseen');
    if (context.mounted) {
      if (introsalreadyseen == true) {
        // Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Navigate to IntroScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IntroScreen()),
        );
      }
    }
  }
}
