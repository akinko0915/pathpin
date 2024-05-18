import 'package:flutter/material.dart';
import 'package:pathpin/component/page_title.dart';
import 'package:pathpin/map_page.dart';
import 'package:pathpin/record_page.dart';
import 'package:pathpin/ui_core/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<Widget> display = [
    const RecordPage(),
    const MapPage(),
  ];

  List<String> pageTitles = [
    '旅フォルダ',
    'マップ',
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: Header(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(height: 10),
            PageTitle(title: pageTitles[selectedIndex]),
            display[selectedIndex],
          ],
        ),
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '旅フォルダ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(209, 163, 120, 1),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
