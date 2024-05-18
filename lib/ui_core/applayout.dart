import 'package:flutter/material.dart';
import 'package:pathpin/component/page_title.dart';
import 'package:pathpin/ui_core/header.dart';

class AppLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;
  final Function(int) onTap;

  const AppLayout({
    Key? key,
    required this.title,
    required this.body,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(height: 10),
            PageTitle(title: title),
            Expanded(child: body),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '旅フォルダ',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(209, 163, 120, 1),
        onTap: onTap,
      ),
    );
  }
}