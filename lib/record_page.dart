import 'package:flutter/material.dart';
import 'package:pathpin/component/travel_folder.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final addButton = Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'フォルダを追加',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    final folders = 
    Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 30,
      children: [
        TravelFolder(),
        TravelFolder(),
        TravelFolder(),
      ],
    );

    final folderRow = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [addButton],
          ),
          folders,
        ],
      ),
    );
    

    return folderRow;
  }
}