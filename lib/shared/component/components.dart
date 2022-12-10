import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final String label;
  final IconData prefix;
  final bool? isPassword ;
  final IconData? suffix;
  final Function()? suffixPressed;
  final Function()? onTap;
  final Function(String)? onChange;
  final Function(String)? onSubmit;

  const DefaultTextFormField({Key? key, this.isPassword = false, this.suffix, this.suffixPressed,
    this.onTap, this.onChange, this.onSubmit, required this.controller, required this.type, this.validate, required this.label, required this.prefix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      obscureText: isPassword!,
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
