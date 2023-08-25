import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  var icon;
  var getcontroller;
  var endpoint;
  var query;

  CustomTextField(
      {super.key,
      required this.icon,
      this.getcontroller,
      this.endpoint,
      this.query});

  TextEditingController _searchfieldcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 241, 237, 237),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
              child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _searchfieldcontroller,
            onChanged: ((value) {
              if (value.isEmpty) {
                getcontroller.fetchData(endpoint, query);
              } else {
                getcontroller.fetchData(endpoint, value);
              }
            }),
            onTapOutside: (event) {
              // Remove keyboard focus when tapping outside
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                contentPadding: EdgeInsets.all(10)),
          )),
          icon
        ],
      ),
    );
  }
}
