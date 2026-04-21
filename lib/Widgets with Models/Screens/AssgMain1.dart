import 'package:flutter/material.dart';

import 'AssgDeta1.dart';
import 'AssgUI1.dart';

class Assgmain1 extends StatelessWidget {
  const Assgmain1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {   // each screens
          '/': (context) => HomePage(),
          '/details': (context) => ProductDetailsPage(),
        }
    );
  }
}
