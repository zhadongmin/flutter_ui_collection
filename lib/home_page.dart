import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/features/catch_error_page.dart';
import 'package:flutter_ui_collection/pages/001_inspiration_app_ui.dart';
import 'package:flutter_ui_collection/pages/002_page_view_animation.dart';
import 'package:flutter_ui_collection/pages/003_food_delivery.dart';
import 'package:flutter_ui_collection/pages/004_user_profile.dart';
import 'package:flutter_ui_collection/pages/005_ripple_animation.dart';
import 'package:flutter_ui_collection/pages/006_make_page_transition.dart';
import 'package:flutter_ui_collection/pages/029_on_boarding_design.dart';

import 'app/music_player.dart';

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
        onPressed: () => context.push(const MakePageTransition()),
        child: const Text('Lesson 6 Make Page Transition'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const MusicPlayer()),
        child: const Text('Music player'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const RippleAnimation()),
        child: const Text('Lesson 5  Ripple Animation'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const UserProfile()),
        child: const Text('Lesson 4 UserProfile And Animation'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const OnBoardingDesign()),
        child: const Text('On Boarding Design'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const InspirationApp()),
        child: const Text('Inspiration App UI'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const PageViewAnimation()),
        child: const Text('Page View Animation'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const FoodDeliveryApplicationUI()),
        child: const Text('FoodDeliveryApplicationUI'),
      ),
      ElevatedButton(
        onPressed: () => context.push(const ErrorCatchPage()),
        child: const Text('Test Catch Error'),
      ),
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
