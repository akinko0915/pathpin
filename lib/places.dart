import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathpin/component/back_icon.dart';
import 'package:pathpin/component/page_title.dart';
import 'package:pathpin/component/place.dart';


class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final addButton = Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: ElevatedButton(
        onPressed: () {
          context.go('/record/create/place');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          '場所を追加',
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
        Place(),
        Place(),
        Place(),
      ],
    );

    final folderRow = Container(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [BackIcon()],
          ),
          PageTitle(title: '場所一覧'),
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