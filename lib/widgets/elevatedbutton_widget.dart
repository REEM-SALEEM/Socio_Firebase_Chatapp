import 'package:flutter/material.dart';

customElevatedButton({
  required BuildContext context,
  required void Function()? onPressed,
  required String title,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
  );
}
