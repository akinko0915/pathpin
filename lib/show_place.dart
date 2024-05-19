import 'package:flutter/material.dart';
import 'package:pathpin/component/back_icon.dart';

// class Place {
//   final String imagePath;
//   final String placeName;
//   final String folderName;
//   final String address;
//   final String date;
//   final String memo;

//   Place({
//     required this.imagePath,
//     required this.placeName,
//     required this.folderName,
//     required this.address,
//     required this.date,
//     required this.memo,
//   });
// }

class ShowPlace extends StatelessWidget {
  // final Place place;

  const ShowPlace({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIcon(),
            Image.asset('assets/images/kobe-harbarland.png', fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // place.placeName,
                    "神戸",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text("旅フォルダ：兵庫県"),
                  // Text('旅フォルダ: ${place.folderName}'),
                  SizedBox(height: 8),
                  Text('住所: 東京都港区芝公園4丁目2-8'),
                  SizedBox(height: 8),
                  Text('日付: 2023年5月1日'),
                  SizedBox(height: 8),
                  Text('メモ：夜のライトアップがきれいでした。'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 編集ボタンが押された時の処理
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

// class PlaceDetailPage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   // 仮データを作成
  //   final places = [
  //     Place(
  //       imagePath: 'assets/images/place1.jpg',
  //       placeName: '東京タワー',
  //       folderName: '東京旅行',
  //       address: '東京都港区芝公園4丁目2-8',
  //       date: '2023年5月1日',
  //       memo: '夜のライトアップがきれいでした。',
  //     ),
  //     Place(
  //       imagePath: 'assets/images/place2.jpg',
  //       placeName: '金閣寺',
  //       folderName: '京都旅行',
  //       address: '京都府京都市北区金閣寺町1',
  //       date: '2023年6月10日',
  //       memo: '金色に輝く姿が印象的でした。',
  //     ),
  //   ];

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('場所の詳細'),
  //     ),
  //     body: ListView.builder(
  //       itemCount: places.length,
  //       itemBuilder: (context, index) {
  //         return ShowPlace(place: places[index]);
  //       },
  //     ),
  //   );
  // }
// }