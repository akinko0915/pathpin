import 'package:flutter/material.dart';
import 'package:pathpin/ui_core/header.dart';
import 'package:go_router/go_router.dart';
import 'package:pathpin/router.dart';

void main() {
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
      // 以下３行を追加
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class MyHomePage extends StatefulWidget {
   final Widget child;

  const MyHomePage({Key? key, required this.child}) : super(key: key);

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
      appBar: Header(),
      body: widget.child,
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

