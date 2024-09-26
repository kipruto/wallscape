// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaperapp/src/pages/home.dart';
import 'package:wallpaperapp/src/widgets/ElevatedButtonWidget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define the content for each page
  final List<Map<String, String>> _introContent = [
    {
      'title': 'Explore High-Quality Wallpapers',
      'description':
          'Explore a vast collection of high-quality wallpapers, handpicked for your device. Beautify your screen with stunning images that fit every mood.',
      'image': 'assets/images/1.png', // Use your own image asset
    },
    {
      'title': 'Upload Your Shots & Share',
      'description':
          'Upload your own wallpapers and share with the community, or download any wallpaper to set as your device background with ease',
      'image': 'assets/images/2.png', // Use your own image asset
    },
    {
      'title': 'Unlock Pro Features',
      'description':
          'Get access to exclusive wallpapers, ad-free experience, and early access to new collections with our Pro features.',
      'image': 'assets/images/3.png', // Use your own image asset
    },
  ];

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
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _introContent.length,
              itemBuilder: (context, index) {
                return _buildIntroPage(
                  _introContent[index]['title']!,
                  _introContent[index]['description']!,
                  _introContent[index]['image']!,
                );
              },
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Dot indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _introContent.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Get Started or Next Button
                  _currentPage == _introContent.length - 1
                      ? CustomElevatedButton(
                          text: 'Get Started',
                          backgroundColor: Colors.blueAccent,
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('introsalreadyseen', true);
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            }
                          })
                      : CustomElevatedButton(
                          text: 'Next',
                          backgroundColor: Colors.blueAccent,
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroPage(String title, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300), // Display image for the page
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: Text(
                description,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Dot indicator builder
  Widget _buildDot(int index) {
    return Container(
      height: 8,
      width: _currentPage == index ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blueAccent : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
