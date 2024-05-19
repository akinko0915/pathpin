import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import '../env/env.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = []; // predictionsに検索結果を格納
    List LatLng = []; // 経度と緯度を格納するための配列

  @override
  void initState() {
    googlePlace = GooglePlace(Env.key); // ⬅︎GoogleMapと同じAPIキーを指定。
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                offset: Offset(10, 10))
                          ],
                        ),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  autoCompleteSearch(
                                      value); // 入力される毎に引数にその入力文字を渡し、関数を実行
                                } else {
                                  if (predictions.isNotEmpty && mounted) {
                                    // ここで配列を初期化。初期化しないと文字が入力されるたびに検索結果が蓄積されてしまう。
                                    setState(() {
                                      predictions = [];
                                    });
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  color: Colors.grey[500],
                                  icon: const Icon(Icons.arrow_back_ios_new),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                hintText: '場所を検索',
                                hintStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                            ))),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: predictions.length, // 検索結果を格納したpredictions配列の長さを指定
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(predictions[index]
                            .description
                            .toString()), // 検索結果を表示。descriptionを指定すると場所名が表示されます。
                        onTap: () async {
 List? locations = await locationFromAddress(
                              predictions[index]
                                  .description
                                  .toString()); // locationFromAddress()に検索結果のpredictions[index].description.toString()を渡す

                          setState(() { // 取得した経度と緯度を配列に格納
                            LatLng.add(locations.first.latitude);
                            LatLng.add(locations.first.longitude);
                        },
                      );
                      Navigator.pop(context, LatLng);
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// 検索処理
  void autoCompleteSearch(String value) async {
    final result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }
}
