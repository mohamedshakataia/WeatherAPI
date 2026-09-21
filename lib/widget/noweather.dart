import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'There Is No Weather Start Searching Now',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
