import 'package:flutter/material.dart';

import 'CustomShapClipper.dart';

void main() => runApp(MaterialApp(
      title: 'Flight List Mock Up',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(),
    ));

ThemeData themeData =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

Color firstColor = Color(0xFFF47015);
Color secondColor = Color(0xFFEF772C);

List<String> locations = ['Abuja, Ng (ABJ)', 'Lagos, Ng (LAG)'];

const TextStyle drowDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle drowDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

var selectedLocationIndex = 0;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[HomeScreenTopPart()],
    ));
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    //Implement a gradient on to blend the colors
    return Stack(
      children: <Widget>[
        //Add a customer Shape by adding a ClipPath
        ClipPath(
          clipper: CustomShapeClipper(),
          //This Paints the Container Orange
          // child: Container(height: 400.0,color :Colors.orange),

          //Add Gradient to the Color
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              firstColor,
              secondColor,
            ])),
            //Implement the widgets within the container
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      //This adds space between the icon and the next widget
                      SizedBox(
                        width: 16.0,
                      ),
                      //Drop down button was not used because it doesn't have a child
                      //the drop down symbol depends on the theme which is restrictive
                      PopupMenuButton(
                        //This sets the current selected drop down as active
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex],
                                style: drowDownLabelStyle)
                          ],
                        ),
                        //Mandate of pop up menu is an implementation of an item builder
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                              child: Text(locations[0],
                                  style: drowDownMenuItemStyle),
                              value: 0),
                          PopupMenuItem(
                              child: Text(locations[1],
                                  style: drowDownMenuItemStyle),
                              value: 1)
                        ],
                      ),
                      Spacer(),//puts up a space between two widgets
                      Icon(Icons.settings, color:Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 50.0,),
                Text('Where would you like to go?', style: TextStyle(fontSize: 24.0, color:Colors.white,),textAlign: TextAlign.center,),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: locations[0]),
                      style: drowDownMenuItemStyle,
                      cursorColor: themeData.primaryColor,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                       suffixIcon: Material(
                         elevation: 2.0,
                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                         child: Icon(Icons.search, color:Colors.black),
                       ),
                       border: InputBorder.none,
                     ),   
                    ),
                  ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
