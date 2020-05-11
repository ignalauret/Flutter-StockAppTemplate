import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  HomeScreenHeader(this.subtitle);
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).primaryColor,
      child: Text(
        subtitle,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
