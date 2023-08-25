import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLogo extends StatelessWidget {
  const ShimmerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).accentColor,
      highlightColor: const Color.fromARGB(255, 192, 202, 207),
      period: const Duration(seconds: 10),
      child: Text(
        'News App',
        style: TextStyle(
            fontFamily: 'cursive',
            fontSize: 35,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor),
      ),
    );
  }
}
