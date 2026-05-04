import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: LoadingButton()));
}

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: isLoading
              ? null
              : () async {
            setState(() => isLoading = true);
            await Future.delayed(Duration(seconds: 2));
            setState(() => isLoading = false);
          },
          child: isLoading
              ? SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
              : Text("Submit"),
        ),
      ),
    );
  }
}