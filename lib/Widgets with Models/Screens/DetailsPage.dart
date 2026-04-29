import 'package:flutter/material.dart';

import '../Model/fruitsmodel.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    final Fruit fruit = ModalRoute.of(context)!.settings.arguments as Fruit;

    return Scaffold(
      appBar: AppBar(title: Text("Fruit Detalis")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  fruit.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text(fruit.name, style: TextStyle(fontSize: 30)),
              SizedBox(height: 10,),
              Text(fruit.color, style: TextStyle(fontSize: 15)),
              SizedBox(height: 10,),
              Text("Price : ${fruit.price}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 30,),
              ElevatedButton.icon(
               label: Text("Go Back"),
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                Navigator.pop(context,"You Selected ${fruit.name}");
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
