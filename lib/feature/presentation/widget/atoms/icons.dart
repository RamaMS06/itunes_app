import 'package:flutter/material.dart';

class IconTemplate extends StatelessWidget {
  final Icon icon;
  final Function()? onTap;
  const IconTemplate({required this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: icon);
  }
}
