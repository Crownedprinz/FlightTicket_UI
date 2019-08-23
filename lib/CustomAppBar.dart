import 'package:flighttickets/main.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {


final List<BottomNavigationBarItem> bottomBarItems = [];
final buttomNavigationBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color:Colors.black);

CustomAppBar(){
  bottomBarItems.add(
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.home, color: themeData.primaryColor),
      icon: Icon(Icons.home, color: Colors.black),
      title: Text("explore", style:TextStyle(color:Colors.black))
    ),
  );
  bottomBarItems.add(
    BottomNavigationBarItem(
      icon: new Icon(Icons.favorite, color: Colors.black),
      title: Text("WatchList", style:buttomNavigationBarItemStyle)
    ),
  );
  bottomBarItems.add(
    BottomNavigationBarItem(
      icon: new Icon(Icons.local_offer, color: Colors.black),
      title: Text("Deals", style:buttomNavigationBarItemStyle)
    ),
  );
  bottomBarItems.add(
    BottomNavigationBarItem(
      icon: new Icon(Icons.notifications, color: Colors.black),
      title: Text("Notifications", style:buttomNavigationBarItemStyle)
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}