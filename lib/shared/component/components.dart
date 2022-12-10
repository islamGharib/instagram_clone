import 'package:flutter/material.dart';

// Text Form Field
// Widget defaultTextFormField(
//     {
//       required final TextEditingController? controller,
//       required TextInputType type,
//       required  String? Function(String?)? validate,
//       required String label,
//       required IconData prefix,
//       required OutlineInputBorder inputBorder,
//       bool isPassword = false,
//       IconData? suffix,
//       Function()? suffixPressed,
//       Function()? onTap,
//       Function(String)? onChange,
//       Function(String)? onSubmit,
//
//     }) => TextFormField(
//     controller: controller,
//     keyboardType: type,
//     validator: validate,
//     obscureText: isPassword,
//     onTap: onTap,
//     onChanged: onChange,
//     onFieldSubmitted: onSubmit,
//     decoration: InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(
//           prefix
//       ),
//       suffixIcon: suffix != null?IconButton(
//           onPressed: suffixPressed,
//           icon: Icon(suffix,)):null,
//       border:  inputBorder,
//       focusedBorder: inputBorder,
//       enabledBorder: inputBorder
//
//     )
// );

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final String label;
  final IconData prefix;
  bool isPassword = false;
  IconData? suffix;
  Function()? suffixPressed;
  Function()? onTap;
  Function(String)? onChange;
  Function(String)? onSubmit;

  DefaultTextFormField({Key? key, required this.controller, required this.type,
  required this.validate, required this.label, required this.prefix,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: suffix != null?IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix,)):null,
        border:  inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),

      ),


    );
  }
}
