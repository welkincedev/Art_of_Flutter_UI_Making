import 'package:flutter/material.dart';


import '../Model/AssgMod1.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Products product =
    ModalRoute.of(context)!.settings.arguments as Products;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// 🔥 ICON (since you used emoji instead of image)
              CircleAvatar(
                radius: 50,
                child: Text(
                  product.imgicon,
                  style: const TextStyle(fontSize: 40),
                ),
              ),

              const SizedBox(height: 20),

              /// 🏷 NAME
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// 📝 SUBTEXT
              Text(
                product.Subtext,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 10),

              /// ⭐ RATING
              Text(
                "⭐ ${product.rating} ratings",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              /// 💰 PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${product.discPrice}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    "\$${product.ogPrice}",
                    style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// 🔖 TAG (like -20%, Hot Deal)
              Text(
                product.words,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              /// 🔙 BUTTON
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context, "You selected ${product.name}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}