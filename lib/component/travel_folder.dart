import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pathpin/data/dummy_data.dart';


class TravelFolder extends StatelessWidget {
  final Folder folder;

  const TravelFolder({Key? key, required this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy/M/d');
    final date = dateFormat.format(DateTime.parse(folder.createdAt));
    final styledDate = Text(
      date,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );

    final place = Text(folder.name, style: const TextStyle( fontSize: 10, fontWeight: FontWeight.bold,));
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
  

    final col = 
    GestureDetector(
      onTap: () {
        context.go('/record/places');
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

class $ {
}