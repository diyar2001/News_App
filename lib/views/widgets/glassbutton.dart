import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/utils/api_auth.dart';

class GlassButton extends StatelessWidget {
  Icon icon;
  GlassButton({super.key,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.2),
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
