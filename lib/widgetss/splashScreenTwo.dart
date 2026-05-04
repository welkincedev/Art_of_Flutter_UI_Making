import 'package:flutter/material.dart';

import 'Loginpage.dart';


void main() =>
    runApp(MaterialApp(home: MyApp(),
      debugShowCheckedModeBanner: false,)
    );


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2) , (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
    });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Higuys"),
      ),
    );
  }
}
