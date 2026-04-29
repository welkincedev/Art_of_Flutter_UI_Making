import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/animation/stepani.json',height: 200,width: 200),

            // Load a Lottie file from a remote url
            Lottie.network(
                'https://lottie.host/281089a5-6305-4cfa-b216-3f33e8eec306/X01ChGlebX.json',
            ),

          ],
        ),
      ),
    );
  }
}