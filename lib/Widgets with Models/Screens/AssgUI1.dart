import 'package:flutter/material.dart';
import 'package:firstsample/Widgets with Models/Model/AssgMod1.dart';

import '../Model/AssgMod1.dart';

class HomePage extends StatelessWidget {
  final List<Products> productsasgn = [
    Products(imgicon: "👞", name: "Nike Air Max", Subtext: "Premium Running Shoes", rating: 245, discPrice: '120', ogPrice: '150', words: '-20%'),
    Products(imgicon: "👔", name: "Designer T-Shirt", Subtext: "100% Cotton Premium", rating: 189, discPrice: '45', ogPrice: '60', words: 'In Stock'),
    Products(imgicon: "⌚", name: "Smart Watch", Subtext: "Fitness Tracking", rating: 312, discPrice: '199', ogPrice: '250', words: 'Hot Deal'),
    Products(imgicon: "👜", name: "Leather Handbag", Subtext: "Italian Leather", rating: 98, discPrice: '89', ogPrice: '120', words: 'New'),
    Products(imgicon: "🎧", name: "Wireless Earbud", Subtext: "Noise Cancelling", rating: 567, discPrice: '79', ogPrice: '99', words: 'Best Seller'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Products List'),
      ),

      body: ListView.builder(
        itemCount: productsasgn.length,
        itemBuilder: (context, index) {
          final product = productsasgn[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,

            child: ListTile(
              leading: CircleAvatar(
                child: Text(product.imgicon), // ✅ emoji inside avatar
              ),

              title: Text(product.name),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.Subtext),
                  Text("Rating: ${product.rating}"),
                  Text("Price: \$${product.discPrice} (was \$${product.ogPrice})"),
                ],
              ),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: product,
                );
              },
            ),
          );
        },
      ),
    );
  }
}