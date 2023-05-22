import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/pages/010_grid_view.dart';

// can not understand
extension NavigatorExtension on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      ElevatedButton(
        onPressed: () => context.push(const GridViewPage()),
        child: const Text('Lesson 10 GridView  with animation'),
      ),
      // ElevatedButton(
      //   onPressed: () => context.push(const PartyApplication()),
      //   child: const Text('Lesson 9 PartyApplication'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const SplashScreenPage()),
      //   child: const Text('Lesson 8 Splash Screen Animation'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const DownloadButtonPage()),
      //   child: const Text('Lesson 7 Download Button With Animation'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const MakePageTransition()),
      //   child: const Text('Lesson 6 Make Page Transition'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const MusicPlayer()),
      //   child: const Text('Music player'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const RippleAnimation()),
      //   child: const Text('Lesson 5  Ripple Animation'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const UserProfile()),
      //   child: const Text('Lesson 4 UserProfile And Animation'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const OnBoardingDesign()),
      //   child: const Text('On Boarding Design'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const InspirationApp()),
      //   child: const Text('Inspiration App UI'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const PageViewAnimation()),
      //   child: const Text('Page View Animation'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const FoodDeliveryApplicationUI()),
      //   child: const Text('FoodDeliveryApplicationUI'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.push(const ErrorCatchPage()),
      //   child: const Text('Test Catch Error'),
      // ),
    ];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: actions,
          ),
        ),
      ),
    );
  }
}
