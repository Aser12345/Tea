import 'package:flutter/material.dart';

class AlertClearCart extends StatelessWidget {
  const AlertClearCart({super.key, required this.alertText, this.onClick});
  final String alertText;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 152, 112, 30),
      content: Text(
        alertText,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Нет',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        TextButton(
            onPressed: onClick,
            child: const Text(
              'Да',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
