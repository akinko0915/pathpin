import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class Place extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dateFormat = DateFormat('yyyy/M/d');
    final date = dateFormat.format(today);
    final styledDate = Text(
      date,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );

    final img = Image.asset('assets/images/kobe-harbarland.png', fit: BoxFit.cover);
    final styledImg = 
    SizedBox(
      height: 140,
      width: 170,
      child: Container(
        child: 
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: img,
        ),
      ),
      );
  
    final place = 
    Text('神戸', style: TextStyle( fontSize: 10, fontWeight: FontWeight.bold,)
    );

    final col = 
    GestureDetector(
      onTap: () {
        context.go('/record/show/place');
      },
      child: 
      Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                styledDate,
                styledImg,
                place,
              ],
            )
    );
            
    return col;
  }
}