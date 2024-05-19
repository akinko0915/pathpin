import 'package:flutter/material.dart';
import 'package:pathpin/ui_core/header.dart';
import 'package:go_router/go_router.dart';
import 'package:pathpin/router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:pathpin/date_page.dart';
import 'package:pathpin/map/map_page.dart';
import 'package:pathpin/record_page.dart';
import 'env/env.dart';

void main() {
  const platform = MethodChannel('com.example.app/api_key');
  platform.invokeMethod('setGoogleMapsApiKey', Env.key);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
   final Widget child;

  // エラーが出たらコメントアウト戻す
  // const MyHomePage({Key? key, required this.child}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  int selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 0) {
      GoRouter.of(context).go('/map');
    } else {
      GoRouter.of(context).go('/record');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: widget.child,
      // body: Center(
      //   child: display[selectedIndex],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(209, 163, 120, 1),
        items: const [
          BottomNavigationBarItem(
             icon: Icon(Icons.map),  
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '旅フォルダ',
          ),
        ],
      ),
    );
  }
}

