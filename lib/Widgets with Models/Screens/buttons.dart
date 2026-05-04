import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: FButtons(),));
}

class FButtons extends StatelessWidget {
  const FButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FilledButton(onPressed: () {}, child: Text("HI Guys")),
          FilledButton.tonal(onPressed: () {}, child: Text("Filled Tonal")),
          FilledButton.icon(
            onPressed: () {},
            label: Text("Hi Guys"),
            icon: Icon(Icons.dangerous_outlined),
          ),
        ],
      ),
    );
  }
}
