import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrefiredSizeSection extends StatelessWidget {
  final String name;
  const PrefiredSizeSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                name.toString().substring(0, 1),
              ),
              minRadius: 30,
              maxRadius: 30,
              backgroundColor: Color.fromARGB(255, 219, 217, 217),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              name.toString(),
            )
          ],
        ),
      ),
    );
  }
}
