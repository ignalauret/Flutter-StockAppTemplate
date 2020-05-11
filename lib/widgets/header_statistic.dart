import 'package:flutter/material.dart';

class HeaderStatistic extends StatelessWidget {
  HeaderStatistic(this.title, this.value);
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value.toString(),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
