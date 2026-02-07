import 'package:flutter/material.dart';

class Windows98Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF00BFFF), // Windows 98 Blue
        border: Border.all(color: Color(0xFF000080), width: 3.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Windows 98 Portfolio',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sans Serif',
              color: Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to my Windows 98 styled portfolio! Below are my projects and experiences:',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),
          ),
          // Add more widgets to showcase your portfolio items
        ],
      ),
    );
  }
}