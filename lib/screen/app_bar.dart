import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  final Color backgroundColor;
  final double height;

  const MyAppBar({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xFFD97757),
    this.height = 70,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
        letterSpacing: 1,
      ),
      toolbarHeight: 70,
      centerTitle: true,
      backgroundColor: const Color(0xFFD97757),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}