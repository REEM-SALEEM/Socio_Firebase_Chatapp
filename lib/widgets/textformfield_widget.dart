import 'package:firebase_chatapp/constants/color/colors.dart';
import 'package:flutter/material.dart';

customTextFormField({
  required BuildContext context,
  IconData? iconData,
  String? Function(String?)? validator,
  required String labelText,
  TextEditingController? controller,
}) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primarycolor, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primarycolor, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redcolor, width: 2),
          ),
          labelText: labelText,
          prefixIcon: Icon(
            iconData,
            color: Theme.of(context).primaryColor,
          )),
      validator: validator);
}
