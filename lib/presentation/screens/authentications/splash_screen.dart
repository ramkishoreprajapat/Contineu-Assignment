import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Image.asset('images/ic_logo.png', width: 72, height: 72),
      ),
    );
  }
}
