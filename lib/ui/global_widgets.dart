import 'package:flutter/material.dart';

import 'cart_screen/cart_screen.dart';

FloatingActionButton btnCart({required BuildContext context}) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CartScreen(),
        ),
      );
    },
    child: const Icon(Icons.shopping_cart_outlined),
  );
}

enum AlertStatus { success, error, warning }

showAlert({required AlertStatus status, required String message, required BuildContext context}) {
  Color? fontColor;
  Color? bgColor;

  switch (status) {
    case AlertStatus.success:
      fontColor = Colors.black;
      bgColor = Colors.greenAccent;
    break;
    case AlertStatus.warning:
      fontColor = Colors.black;
      bgColor = Colors.yellowAccent;
      break;
    case AlertStatus.error:
      fontColor = Colors.white;
      bgColor = Colors.redAccent;
      break;
  }

  var snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: fontColor!, fontWeight: FontWeight.w600),
    ),
    backgroundColor: bgColor,
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
