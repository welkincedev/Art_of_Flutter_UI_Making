import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            // height: 50,
            // width: 50,
            "https://plus.unsplash.com/premium_photo-1774271492622-2caebba85850?q=80&w=830&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          Expanded(
            child: Image.network(
              // height: 50,
              // width: 50,
              "https://plus.unsplash.com/premium_photo-1774271492622-2caebba85850?q=80&w=830&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
          ),
          Expanded(
            child: Image.network(
              height: 250,
              // width: 50,
              "https://plus.unsplash.com/premium_photo-1774271492622-2caebba85850?q=80&w=830&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
          ),
        ],
      ),
    );
  }
}
