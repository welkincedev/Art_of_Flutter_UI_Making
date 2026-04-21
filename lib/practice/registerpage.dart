import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register",
            style: TextStyle(color: Colors.deepPurple, fontSize: 30,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(decoration: InputDecoration(hintText: "Full Name")),SizedBox(height: 20),
          TextField(decoration: InputDecoration(hintText: "Email")),SizedBox(height: 20),
          TextField(decoration: InputDecoration(hintText: "Password")),SizedBox(height: 20),
          SizedBox(
            width: width<600 ? double.infinity:300,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Register", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
