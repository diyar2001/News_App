import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final Function function;
  const DialogBox({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete All'),
      content: Text('Do you want delete all favorite items'),
      actions: [
        TextButton(
          onPressed: () {
            // Code to handle the action
            Navigator.of(context).pop(); // Close the dialog
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
