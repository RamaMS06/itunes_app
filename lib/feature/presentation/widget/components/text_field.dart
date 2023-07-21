import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../atoms/colors.dart';

class TextFormFieldTemplate extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const TextFormFieldTemplate(
      {required this.controller,
      this.hint,
      this.onChanged,
      this.onFieldSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 16),
      onFieldSubmitted: onFieldSubmitted,
      cursorWidth: 1,
      decoration: InputDecoration(
          prefixIcon:
              const Icon(CupertinoIcons.search, color: AtomColors.primaryColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: hint ?? 'search music..',
          hintStyle: const TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.black26, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                  color: AtomColors.primaryColor, width: 0.5))),
    );
  }
}
