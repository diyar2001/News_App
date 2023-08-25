import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../data/models/newsapi_model.dart';

class RichTextSection extends StatelessWidget {
  final String content;
  final String url;
   RichTextSection({super.key, required this.content, required this.url});

  @override
  Widget build(BuildContext context) {

    return SelectableText.rich(
      style:
          const TextStyle(fontFamily: 'Times new roman', color: Colors.black),
      TextSpan(
        children: [
          TextSpan(
            text: content.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const TextSpan(
            text: '\n \nRead more \n',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.toNamed('/Webpage', arguments: url),
            text: url,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
