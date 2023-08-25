import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final Function function;
  const DialogBox({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), 
      ),
      title: Text('Delete All'),
      content: Text('Do you want delete all favorite items'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Code to handle the action
            function();
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}
