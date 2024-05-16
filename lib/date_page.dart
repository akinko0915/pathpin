import 'package:flutter/material.dart';

class DatePage extends StatelessWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('日付から探す')),
      color: Colors.green[200],
    );
  }
}