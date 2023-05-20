import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final Color primaryColor;
  final Color darkPrimaryColor;
  const ButtonAnimation({
    super.key,
    required this.primaryColor,
    required this.darkPrimaryColor,
  });

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleAnimationController;
  late AnimationController _fadeAnimationController;

  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  double buttonWidth = 200.0;
  double scale = 1.0;
  bool animationComplete = false;
  double barColorOpacity = .6;
  bool animationStart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation =
        Tween<double>(begin: 50, end: 0).animate(_fadeAnimationController);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(_scaleAnimationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleAnimationController.reverse();
          _fadeAnimationController.forward();
          _animationController.forward();
        }
      });

    _animation = Tween<double>(
      begin: 0,
      end: buttonWidth,
    ).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // _animationController.reverse();
          setState(() {
            animationComplete = true;
            barColorOpacity = .0;
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _scaleAnimationController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _scaleAnimationController,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              onTap: () {
                _scaleAnimationController.forward();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(children: [
                  Expanded(
                    child: Align(
                        child: animationComplete == false
                            ? const Text(
                                "Download",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : const Icon(
                                Icons.check,
                                color: Colors.white,
                              )),
                  ),
                  AnimatedBuilder(
                    animation: _fadeAnimationController,
                    builder: (context, child) => Container(
                      width: _fadeAnimation.value,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.darkPrimaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Positioned(
            top: 0,
            left: 0,
            width: _animation.value,
            // width: 40,
            height: 50,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: barColorOpacity,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
