import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stockapptemplate/utils/constants.dart';
import 'package:stockapptemplate/widgets/header_statistic.dart';

class HomeScreenHeader extends StatelessWidget {
  HomeScreenHeader(this.subtitle);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CurvedSideClipper(),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: MAIN_COLOR,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Container(
            height: 130,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: const EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: size.width * 0.8,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HeaderStatistic("total", 520),
                        HeaderStatistic("comida", 520),
                        HeaderStatistic("bebida", 520),
                        HeaderStatistic("insumos", 520),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedSideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
