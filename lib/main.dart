import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pathpin/map_page.dart';
import 'package:pathpin/record_page.dart';
import 'package:pathpin/ui_core/header.dart';
import 'package:pathpin/providers/navigation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: MaterialApp(
        title: 'Path Pin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
   MainPage({super.key});

  final List<Widget> _pages = [
    const MapPage(),
    const RecordPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, _) {
        return Scaffold(
          appBar: Header(),
          body: Navigator(
            pages: [
              MaterialPage(child: _pages[navigationProvider.selectedIndex]),
            ],
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
            currentIndex: navigationProvider.selectedIndex,
            selectedItemColor: const Color.fromRGBO(209, 163, 120, 1),
            onTap: (index) => navigationProvider.updateSelectedIndex(index),
          ),
        );
      },
    );
  }
}