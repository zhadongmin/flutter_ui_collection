//
import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/animations/fade_animation.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late AnimationController _scale2AnimationController;
  late AnimationController _widthAnimationController;
  late AnimationController _positionAmationController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _positionAnimation;
  late Animation<double> _widthAnimation;

  bool hiddenIcon = false;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _widthAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(_scaleAnimationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // _scaleAnimationController.reverse();
          _widthAnimationController.forward();
        }
      });

    _widthAnimation = Tween<double>(begin: 80.0, end: 300.0).animate(
      _widthAnimationController,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionAmationController.forward();
        }
      });

    _positionAmationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scale2AnimationController.forward();
          setState(() {
            hiddenIcon = true;
          });
        }
      });

    _positionAnimation =
        Tween<double>(begin: 0, end: 200).animate(_positionAmationController);

    _scale2AnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const LoginPage(),
              )).then((value) {
            setState(() {
              // hiddenIcon = false;
            });
          });
        }
      });

    _scale2Animation =
        Tween<double>(begin: 1, end: 32).animate(_scale2AnimationController);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scaleAnimationController.dispose();
    _scale2AnimationController.dispose();
    _positionAmationController.dispose();
    _widthAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: 0,
              width: width,
              child: FadeAnimation(
                delay: 1,
                child: shaowWidget(),
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                delay: 1.3,
                child: shaowWidget(width: width),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                delay: 1.6,
                child: shaowWidget(width: width),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              // width: width,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeAnimation(
                    delay: 1,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      delay: 1.3,
                      child: Text(
                        "We promis that you'll have the most\n fuss-free time with u ever",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                        ),
                      )),
                  const SizedBox(
                    height: 180,
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: AnimatedBuilder(
                      animation: _scaleAnimationController,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthAnimationController,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              height: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.4),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                  onTap: () {
                                    _scaleAnimationController.forward();
                                  },
                                  child: Stack(
                                    children: [
                                      AnimatedBuilder(
                                        animation: _positionAmationController,
                                        builder: (context, child) => Positioned(
                                          left: _positionAnimation.value,
                                          child: AnimatedBuilder(
                                            animation:
                                                _scale2AnimationController,
                                            builder: (context, child) =>
                                                Transform.scale(
                                              scale: _scale2Animation.value,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: !hiddenIcon
                                                    ? const Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shaowWidget({width}) {
    return Container(
      width: width,
      height: 400,
      decoration: const BoxDecoration(
        // color: Colors.amber,
        image: DecorationImage(
          image: AssetImage('assets/images/008/one.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FadeAnimation(
                delay: 1.2,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                delay: 1.5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.8),
                            ),
                            hintText: "Email or Phone number",
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.8),
                            ),
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FadeAnimation(
                delay: 1.7,
                child: Center(
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[800]!,
                    ),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
