import 'package:flutter/material.dart';

class CustomeTitle extends StatelessWidget {


  late String title="k";

  CustomeTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(Icons.restaurant_menu, color: Colors.black54),
        SizedBox(width: 6.0),
        Text(title, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}

