import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/animations/button_animation.dart';

class DownloadButtonPage extends StatefulWidget {
  const DownloadButtonPage({super.key});

  @override
  State<DownloadButtonPage> createState() => _DownloadButtonPageState();
}

class _DownloadButtonPageState extends State<DownloadButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ButtonAnimation(
                primaryColor: Color.fromRGBO(57, 92, 249, 1),
                darkPrimaryColor: Color.fromRGBO(44, 78, 233, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(
                primaryColor: Colors.yellow[700]!,
                darkPrimaryColor: Colors.yellow[800]!,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(
                primaryColor: Colors.green[700]!,
                darkPrimaryColor: Colors.green[800]!,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(
                primaryColor: Colors.red[700]!,
                darkPrimaryColor: Colors.red[800]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
