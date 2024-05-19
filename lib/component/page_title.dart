import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final titleRow = Row(
      children: [
        const SizedBox(width: 10),
        Text(
          title, 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, )
        )
      ],
    );
    

    final titleCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow,
        const Divider(color: Colors.black, thickness: 2, indent: 10, endIndent: 10,),
        const SizedBox(width: 20),
      ],
    );

    return Align(
      alignment: Alignment.topLeft,
      child: titleCol,
    );
  }
}