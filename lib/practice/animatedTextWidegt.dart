import 'package:flutter/material.dart';


class AnimatedtextWidget extends StatefulWidget {
  const AnimatedtextWidget({super.key});

  @override
  State<AnimatedtextWidget> createState() => _AnimatedtextWidgetState();
}

class _AnimatedtextWidgetState extends State<AnimatedtextWidget> {

  String displayText = "Helo World";
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(displayText,style: TextStyle(fontSize: 24)
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            displayText = "New Text";
          });
        }, child: Text("Update Text"))
      ],
    );
  }
}
