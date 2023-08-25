import 'package:flutter/material.dart';



class Appbar extends StatelessWidget {
  var button1;
  var button2;
  var button3;
 
  Appbar({super.key,this.button1,this.button2,this.button3});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          button1,
         Row(children: [
          button2,
          SizedBox(width: 5,),
          button3
         ],)
        ],
      ),
    );
  }
}