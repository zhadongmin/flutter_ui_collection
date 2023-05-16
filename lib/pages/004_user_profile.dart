//https://www.youtube.com/watch?v=3scHvCgi9iY
import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/animations/fade_animation.dart';
// import 'package:flutter_ui_collection/animations/fade_y_animation.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/004/photo.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const FadeAnimation(
                              delay: 1,
                              child: Text(
                                'Emma Waston',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                FadeAnimation(
                                  delay: 1.2,
                                  child: Text(
                                    "60 Videos",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                  delay: 1.3,
                                  child: Text(
                                    "240k Subscribers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Born',
                            descriptions: 'April 15th 1990, Paris ,France',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Nationality',
                            descriptions: 'British',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Shoe size',
                            descriptions: '37.5',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Genre',
                            descriptions: 'Soundtracks',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Grandparents',
                            descriptions:
                                'Freda Emma Duerre Watson, Greta M. Dickinson, Colin Luesby',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Awards',
                            descriptions:
                                'Teen Choice Award for Choice Movie: Liplock',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          createProfileItem(
                            title: 'Nominations ',
                            descriptions:
                                'Teen Choice Award for Choice Movie: Liplock',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Video',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1.8,
                            child: SizedBox(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  makeVideo(
                                    image: 'assets/images/004/one.jpeg',
                                  ),
                                  makeVideo(
                                    image: 'assets/images/004/two.jpeg',
                                  ),
                                  makeVideo(
                                    image: 'assets/images/004/three.jpeg',
                                  ),
                                  makeVideo(
                                    image: 'assets/images/004/four.jpeg',
                                  ),
                                  makeVideo(
                                    image: 'assets/images/004/five.jpeg',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 120,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 30,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                delay: 2.0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow[700],
                  ),
                  height: 50,
                  child: const Align(
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3)
              ],
            ),
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 70,
          ),
        ),
      ),
    );
  }

  Widget createProfileItem({title, descriptions}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          delay: 1.6,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeAnimation(
          delay: 1.6,
          child: Text(
            descriptions,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
