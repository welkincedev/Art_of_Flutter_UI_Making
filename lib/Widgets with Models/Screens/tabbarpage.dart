import 'package:firstsample/Widgets%20with%20Models/Screens/tabscreen1.dart';
import 'package:firstsample/Widgets%20with%20Models/Screens/tabscreen2.dart';
import 'package:flutter/material.dart';
import 'AssgUI1.dart';

class TabPage extends StatefulWidget {
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: Duration(milliseconds: 400),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar Page", style: TextStyle(fontSize: 16)),
          actions: [Icon(Icons.notifications)],
          bottom: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.rectangle,
            ),
            tabs: [
              Tab(icon: Icon(Icons.list), text: ("List")),
              Tab(icon: Icon(Icons.favorite), text: ("Saved")),
              Tab(icon: Icon(Icons.calendar_today), text: ("Booking")),
              Tab(icon: Icon(Icons.person), text: ("Profile")),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("SomeOne"),
                accountEmail: Text("someone@gmail.com"),
                decoration: BoxDecoration(color: Colors.blue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30),
                ),otherAccountsPictures: [
                  CircleAvatar(backgroundColor: Colors.pink[300],
                  child: Icon(Icons.account_circle_rounded,color: Colors.white,))
              ],
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                selected: selectedDrawerIndex == 0,
                onTap: () {
                  setState(() => selectedDrawerIndex ==0 );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                selected: selectedDrawerIndex == 0,
                onTap: () {
                  setState(() => selectedDrawerIndex ==0 );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contact"),
                selected: selectedDrawerIndex == 0,
                onTap: () {
                  setState(() => selectedDrawerIndex ==0 );
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/details",);
                },
              )
            ],
          ),
        ),
        body: TabBarView(children: [HomePage(), TabScn1(), TabScn2()]),
      ),
    );
  }
}
