import 'package:flutter/material.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(209, 163, 120, 1),
        title: const Text("Path Pin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
      );
  }
}

