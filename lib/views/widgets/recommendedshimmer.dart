import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../home/widgets/newsitems.dart';

class RecommendeShimmer extends StatelessWidget {
  RecommendeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.grey[300],
                              child: Icon(Icons.person),
                              maxRadius: 15,
                              minRadius: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 12,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
