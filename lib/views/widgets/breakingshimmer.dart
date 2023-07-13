import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/newsitems.dart';

class BreakingShimmer extends StatelessWidget {
  BreakingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-50,
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => print(''),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            'General',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 75),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            color: Colors.grey[300],
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: 80,
                            height: 10,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 250,
                        height: 30,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}



