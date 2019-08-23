import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    final Path path = Path();
    //Draw a line from top right left of the container to the bottom right left of the container
    path.lineTo(0.0, size.height);

    //This sets the curve midway of the bottom line and takes the height 30inches upward
    var firstEndPoint = Offset(size.width * 0.5, size.height - 30.0);

    //This sets the the middle of the curve 50 inches upward
    // (0.25 is Screens divided into four parts and one part divided into two)
    var firstControlpoint = Offset(size.width* 0.25, size.height - 50.0);
    
    //This draws a curve from the current point to a given point
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    //This  takes the end of the curve  80inches upward
    var secondEndPoint = Offset(size.width, size.height - 80.0);

    //This sets the the t5th quater of the curve 10 inches upward
    // (0.75 is towards the end of the curve)
    var secondControlpoint = Offset(size.width * 0.75, size.height - 10.0);
    //This draws a curve from the current point to a given point
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy, secondEndPoint.dx, secondEndPoint.dy);


    //Draw a line from the bottom left part of a container to the bottom right part of the container
    path.lineTo(size.width, size.height);
    //Draw a line from the top right part of a container to the bottom right part of the container
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) =>  true;

}