import 'package:flutter/material.dart';
import '../animations/fade_animation.dart';

class PageViewAnimation extends StatefulWidget {
  const PageViewAnimation({super.key});

  @override
  State<PageViewAnimation> createState() => _PageViewAnimationState();
}

class _PageViewAnimationState extends State<PageViewAnimation>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  void _onScroll() {
    print('scroll');
  }

  final totalPage = 4;

  @override
  void initState() {
    _controller = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          makePage(
            image: 'assets/images/002/a.jpeg',
            title: 'Excited',
            description: 'Happy girl running sideways balls to the wall',
            page: 1,
          ),
          makePage(
            image: 'assets/images/002/b.jpeg',
            title: 'Relax',
            description: 'Woman in green dress walking sideways',
            page: 2,
          ),
          makePage(
            image: 'assets/images/002/d.jpeg',
            title: 'Confidence',
            description: 'A cheerful young woman walking towards a camera',
            page: 3,
          ),
          makePage(
            image: 'assets/images/002/c.jpeg',
            title: 'Happy',
            description: 'In running position',
            page: 4,
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      width: double.infinity,
      // color: Colors.blue,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(
                    delay: 2,
                    child: Text(
                      '$page',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$totalPage',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        children: const [
                          _Star(color: Colors.yellow),
                          _Star(
                            color: Colors.yellow,
                          ),
                          _Star(
                            color: Colors.yellow,
                          ),
                          _Star(
                            color: Colors.yellow,
                          ),
                          _Star(
                            color: Colors.grey,
                          ),
                          Text(
                            '4.0',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            '(2300)',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white,
                            height: 2,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const FadeAnimation(
                      delay: 2.5,
                      child: Text(
                        'READ MORE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: Icon(
        Icons.star,
        color: color,
        size: 15,
      ),
    );
  }
}
