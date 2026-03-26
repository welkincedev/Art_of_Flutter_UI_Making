import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,

      body: Container(
        /// for setting Background Image
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://images.all-free-download.com/images/graphiclarge/gallery_display_background_12_vector_158738.jpg")
            )
        //   gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: AlignmentGeometry.bottomRight,
        //       colors: [Colors.green,Colors.white,Colors.blue])
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon.png"),
                  //image: NetworkImage("https://clipart.info/images/ccovers/1499955335whatsapp-icon-logo-png.png"),
                  height: 180,
                  width: 180,),
                Text(
                  "Gallery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )

        ),
      ),
    );
  }
}
