import 'package:flutter/material.dart';

class SliversAppBar extends StatelessWidget {
  const SliversAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("My App"),
              background: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzY4ZhdaTaeaDiMrEl_YRU8_8txhzBh2hQcA&s",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(delegate: SearchBarDelegate(), pinned: true),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //       return ListTile(
          //         title: Text("Item $index"),
          //       );
          //     },
          //     childCount: 10,
          //   ),
          // ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Card(
                  child: Center(
                    child:
                    Text("Item $index"),
                  ),
                );
              },
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
          ),
          // SliverGrid(
          //     delegate: SliverChildBuilderDelegate(
          //   (context, index){
          //   return Card(
          //     child: Center(
          //        child: Text("Title"),
          // ),
          //   );
          // }, gridDelegate: CrossAxisAlignment)
          // )
        ],
      ),
    );
  }
}
class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 68;

  @override
  double get minExtent => 68;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey      ),
    ),
    );
  }

  @override
  bool shouldRebuild(covariant SearchBarDelegate oldDelegate) {
    return false;
  }
}