import 'package:flutter/material.dart';
import 'package:wallpaperapp/src/pages/onboarding/splashscreen.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Custom Font App',
      theme: ThemeData(
        fontFamily: 'Jost',
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}

