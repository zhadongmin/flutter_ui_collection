// https://www.youtube.com/watch?v=lff21mmYhvQ&t=468s
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collection/animations/fade_x_animation.dart';
import 'package:page_transition/page_transition.dart';

class FoodDeliveryApplicationUI extends StatefulWidget {
  const FoodDeliveryApplicationUI({super.key});

  @override
  State<FoodDeliveryApplicationUI> createState() =>
      _FoodDeliveryApplicationUIState();
}

class _FoodDeliveryApplicationUIState extends State<FoodDeliveryApplicationUI>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _txtVisible = true;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 100),
    );
    _txtVisible = true;
    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _txtVisible = false;
    });

    _animationController.forward().then(
          (value) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const DeliveryHomePage(),
            ),
          ).then(
            (value) {
              print('back');
              _animation = Tween<double>(begin: 25.0, end: 1.0)
                  .animate(_animationController);
              setState(() {
                _txtVisible = true;
              });
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.amber,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/003/food.jpeg'),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
              // stops: const [0.2, 0.6, 0.9],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeXAnimation(
                  delay: .5,
                  child: Text(
                    'Taking Order For Faster Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const FadeXAnimation(
                  delay: 1,
                  child: Text(
                    'See restaurant nearby by\n adding location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.4,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeXAnimation(
                  delay: 1.2,
                  child: ScaleTransition(
                    scale: _animation,
                    // child: AnimatedOpacity(
                    //   opacity: _txtVisible ? 1.0 : 0.0,
                    //   duration: const Duration(microseconds: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Colors.yellow, Colors.orange],
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: _txtVisible ? 1.0 : 0.0,
                        duration: const Duration(microseconds: 50),
                        child: MaterialButton(
                          onPressed: () => _onTap(),
                          minWidth: double.infinity,
                          child: const Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AnimatedOpacity(
                  opacity: _txtVisible ? 1.0 : 0.0,
                  duration: const Duration(microseconds: 50),
                  child: const FadeXAnimation(
                    delay: 1.4,
                    child: Align(
                      child: Text(
                        'Mow Deliver TO Your Door 24/7',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveryHomePage extends StatefulWidget {
  const DeliveryHomePage({super.key});

  @override
  State<DeliveryHomePage> createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          // color: Colors.yellow,
          onPressed: () {},
          icon: const Icon(null),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket),
            color: Colors.grey[800],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeXAnimation(
                  delay: 1,
                  child: Text(
                    'Food Delivery',
                    style: TextStyle(
                      color: Colors.grey[80],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FadeXAnimation(
                        delay: 1,
                        child: makeCategory(title: 'Pizza', isActive: true),
                      ),
                      FadeXAnimation(
                        delay: 1.3,
                        child: makeCategory(title: 'Burgers', isActive: false),
                      ),
                      FadeXAnimation(
                        delay: 1.4,
                        child: makeCategory(title: 'Kebab', isActive: false),
                      ),
                      FadeXAnimation(
                        delay: 1.5,
                        child: makeCategory(title: 'Desert', isActive: false),
                      ),
                      FadeXAnimation(
                        delay: 1.6,
                        child: makeCategory(title: 'Sala', isActive: false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          FadeXAnimation(
            delay: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FadeXAnimation(
                    delay: 1.4,
                    child: makeItem(image: 'assets/images/003/one.jpeg'),
                  ),
                  FadeXAnimation(
                    delay: 1.5,
                    child: makeItem(image: 'assets/images/003/two.jpeg'),
                  ),
                  FadeXAnimation(
                    delay: 1.6,
                    child: makeItem(image: 'assets/images/003/three.jpeg'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
      // ),
    );
  }

  Widget makeCategory({title, isActive}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.yellow[700] : Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[500],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: const [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '\$ 15.00',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Vegetarian Pizza',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
