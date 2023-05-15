// https://www.youtube.com/watch?v=mH1bF4qIofw
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class OnBoardingDesign extends StatefulWidget {
  const OnBoardingDesign({super.key});

  @override
  State<OnBoardingDesign> createState() => _OnBoardingDesignState();
}

class _OnBoardingDesignState extends State<OnBoardingDesign> {
  String illustration = "assets/images/jungle-done-1.png";
  String google = "assets/images/icons8-google-48.png";
  String email = "assets/images/icons8-gmail-48.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // decoration: BoxDecoration(border: Border.all()),
                // padding: const EdgeInsets.all(120),
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  illustration,
                  height: 600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Happy Birthday",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Wishing myself a happy birthday",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  // elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        google,
                        width: 30,
                      ),
                      const Spacer(),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  // elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        email,
                        width: 30,
                      ),
                      const Spacer(),
                      const Text(
                        "Sing  Up with Email",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
