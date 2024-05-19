import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  _Edit createState() => _Edit();
}

class _Edit extends State<Edit> {
  final myController = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KBOYのFlutter大学'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: '名前',
              ),
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                name = text;
              },
            ),
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: '趣味',
              ),
            ),
            ElevatedButton(
              child: Text('新規登録'),
              onPressed: () {
                // TODO: 新規登録
              },
            ),
          ],
        ),
      ),
    );
  }
}
