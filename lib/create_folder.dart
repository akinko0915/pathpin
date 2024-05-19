import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathpin/component/back_icon.dart';
import 'package:pathpin/component/page_title.dart';

class CreateFolder extends StatefulWidget {
  final Function(String) onFolderCreated;

  CreateFolder({Key? key, required this.onFolderCreated}) : super(key: key);

  @override
  _CreateFolderState createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  // 以前と同じコード...
  final _formKey = GlobalKey<FormState>();
  String _folderName = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onFolderCreated(_folderName);
      // GoRouterを使用して前の画面に戻る
      context.pop();
    }
  }

  // 以前と同じコード...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [BackIcon()],
              ),
              const PageTitle(title: 'フォルダを作成'),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'フォルダ名',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'フォルダ名を入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  _folderName = value!;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('作成'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}