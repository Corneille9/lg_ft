import 'package:flutter/material.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.controller, this.hintText, this.prefixIcon, this.obscureText=false, this.suffixIcon, this.keyboardType, this.maxLines=1, this.readOnly = false, this.fillColor, this.textAlign, this.onTap}) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool readOnly;
  final Color? fillColor;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 62,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        autofocus: false,
        maxLines: maxLines,
        textAlign: textAlign??TextAlign.start,
        onSaved: (value) {},
        style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText2?.color?.withOpacity(0.7)),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor??Colors.black.withOpacity(0.05),
          hintText: hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText2?.color?.withOpacity(0.4)),
          suffixIcon: suffixIcon,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          prefixIcon: (prefixIcon!=null)?Padding(
              padding: const EdgeInsets.all(14),
              child: prefixIcon
          ):null,
        ),
      ),
    );
  }
}

class TaskActionBuilder extends StatelessWidget {
  const TaskActionBuilder({Key? key, required this.name, required this.onTap}) : super(key: key);
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Text(name, style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}
