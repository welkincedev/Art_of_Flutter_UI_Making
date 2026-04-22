import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class TabScn2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exit Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showExitDialog(context);
          },
          child: const Text('exit'),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('exit?'),
          content: const Text('do you really want to exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // For "no", just close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('no'),
            ),
            TextButton(
              onPressed: () {
                // For "yes", exit the whole app
                SystemNavigator.pop();
              },
              child: const Text('yes'),
            ),
          ],
        );
      },
    );
  }
}
