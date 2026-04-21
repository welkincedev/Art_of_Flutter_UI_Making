import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firstsample/Widgets%20with%20Models/Model/fruitsmodel.dart' hide Fruit;

import '../../widgetss/Widgets2 using Models/model/fruitsmodel.dart';

class Home extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit(
      id: 1,
      name: "Apple",
      color: "Green",
      image:
          "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
    price: 90
    ),
    Fruit(
      id: 1,
      name: "Banana",
      color: "Yellow",
      image:
          "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
    price: 20,),
    Fruit(
      id: 1,
      name: "Mango",
      color: "Orange",
      image: "https://images.stockcake.com/public/d/6/1/d614f56b-8227-4cda-a894-32f9b422bfd4_large/fresh-green-apple-stockcake.jpg",
      price: 50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Fruits List'),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(fruit.image)),
              title: Text(fruit.name),
              subtitle: Text("Color : ${fruit.color}"),
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: fruit,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
