import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/newsitems.dart';

class BreakingShimmer extends StatelessWidget {
  BreakingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 50,
        child: Shimmer(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.5),
              Colors.transparent,
            ],
          ),
          child: Column(
            children: [
              Container(
                height:  MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) => 
              Container(
                height:10,
                width: index==0?30:15,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(100)),)
              ),)
            ],
          ),
        ));
  }
}
