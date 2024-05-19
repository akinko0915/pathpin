import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final backIcon = IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.pop();
      },
    );
    return backIcon;
  }
}