import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color color;
  var icon;
  
  CustomButton({
    super.key,
    this.color = const Color.fromARGB(255, 241, 237, 237),
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: icon,
    );
  }
}






