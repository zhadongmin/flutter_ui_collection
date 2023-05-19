import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/005/shanghai.jpeg',
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3)
                  ],
                  begin: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeItem(
                            image: 'assets/images/005/baoshan.png',
                            square: '300m²',
                            title: '宝山',
                          ),
                          makeItem(
                            image: 'assets/images/005/yangpu.png',
                            square: '60.61m²',
                            title: '杨浦',
                          ),
                          makeItem(
                            image: 'assets/images/005/putuo.png',
                            square: '55.47m²',
                            title: '普陀',
                          ),
                          makeItem(
                            image: 'assets/images/005/huangpu.png',
                            square: '20.52m²',
                            title: '黄浦',
                          ),
                          makeItem(
                            image: 'assets/images/005/xuhui.png',
                            square: '55m²',
                            title: '徐汇',
                          ),
                          makeItem(
                            image: 'assets/images/005/changning.png',
                            square: '37.19m²',
                            title: '长宁',
                          ),
                          makeItem(
                            image: 'assets/images/005/jingan.png',
                            square: '7.62m²',
                            title: '静安',
                          ),
                          makeItem(
                            image: 'assets/images/005/minghang.png',
                            square: '371.7m²',
                            title: '闵行',
                          ),
                          makeItem(
                            image: 'assets/images/005/jiading.png',
                            square: '463.55m²',
                            title: '嘉定',
                          ),
                          makeItem(
                            image: 'assets/images/005/pudong.png',
                            square: '1,429.67m²',
                            title: '浦东新区',
                          ),
                          makeItem(
                            image: 'assets/images/005/jinshan.jpeg',
                            square: '586m²',
                            title: '金山区',
                          ),
                          makeItem(
                            image: 'assets/images/005/songjiang.png',
                            square: '605m²',
                            title: '松江',
                          ),
                          makeItem(
                            image: 'assets/images/005/qingpu.png',
                            square: '543.64m²',
                            title: '青浦',
                          ),
                          makeItem(
                            image: 'assets/images/005/fengxian.png',
                            square: '733.38m²',
                            title: '奉贤',
                          ),
                          makeItem(
                            image: 'assets/images/005/chongming.png',
                            square: '1185.49m²',
                            title: '崇明',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          makePoint(top: 140.0, left: 40.0),
          makePoint(top: 190.0, left: 190.0),
          makePoint(top: 219.0, left: 60.0),
        ],
      ),
    );
  }

  Widget makeItem({image, square, title}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    square,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makePoint({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(.3),
        ),
        child: AnimateWidget(
          duration: const Duration(seconds: 1),
          cycles: 0,
          builder: (context, animate) {
            final margin = animate.fromTween(
              (_) => EdgeInsetsTween(
                begin: const EdgeInsets.all(4.0),
                end: const EdgeInsets.all(6.0),
              ),
            );
            return Center(
              child: Container(
                margin: margin,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
