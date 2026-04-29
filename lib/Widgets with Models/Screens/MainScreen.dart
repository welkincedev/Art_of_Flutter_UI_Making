import 'package:flutter/material.dart';
import 'AssgUI1.dart';
import 'DetailsPage.dart';
import 'Homepage.dart';

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {   // each screens
        '/': (context) => HomePage(),
      }
    );
  }
}
