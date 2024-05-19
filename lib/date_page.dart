import 'package:flutter/material.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: const Center(child: Text('日付から探す')),
    );
  }
}