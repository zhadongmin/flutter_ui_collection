import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collection/animations/fade_animation_reverse.dart';
import 'package:page_transition/page_transition.dart';

class PartyApplication extends StatefulWidget {
  const PartyApplication({super.key});

  @override
  State<PartyApplication> createState() => _PartyApplicationState();
}

class _PartyApplicationState extends State<PartyApplication>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 30,
    ).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(
              child: const FindEvent(),
              type: PageTransitionType.bottomToTop,
            ),
          ).then((value) {
            _scaleController.reverse();
            setState(() {
              hide = false;
            });
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/009/fireworks.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeAnimation(
                delay: 1,
                child: Text(
                  "Find the best locations near tou for a good night.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                delay: 1.2,
                child: Text(
                  'Let us find you an event for your interest',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: FadeAnimation(
                  delay: 1.4,
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.yellow[700],
                        ),
                        child: !hide
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "Find nearest event",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),

                                    // textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FindEvent extends StatefulWidget {
  const FindEvent({super.key});

  @override
  State<FindEvent> createState() => _FindEventState();
}

class _FindEventState extends State<FindEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/009/nature.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(15, -15),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    color: Colors.yellow[800],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                delay: 1,
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search Event",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                delay: 1.2,
                child: makeItem(image: 'assets/images/009/one.jpeg', date: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1.3,
                child: makeItem(image: 'assets/images/009/two.jpeg', date: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1.4,
                child:
                    makeItem(image: 'assets/images/009/three.jpeg', date: 19),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1.5,
                child: makeItem(image: 'assets/images/009/four.jpeg', date: 20),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, date}) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 200,
          margin: const EdgeInsets.only(right: 20),
          child: Column(children: [
            Text(
              date.toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'SEP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Bumber shoot 2019 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "19:00 PM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
