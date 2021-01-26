import 'package:flutter/material.dart';

showLoadingAlertDialog(BuildContext context, {String message}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(
            "Loading",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      );
    },
  );
}
