import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathpin/create_folder.dart';
import 'package:pathpin/create_place.dart';
import 'package:pathpin/main.dart';
import 'package:pathpin/map_page.dart';
import 'package:pathpin/places.dart';
import 'package:pathpin/record_page.dart';
import 'package:pathpin/show_place.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/map',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          MyHomePage(child: child),
          routes: [
            GoRoute(
              path: '/map',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const MapPage(),
            ),
            GoRoute(
              path: '/record',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const RecordPage(),
              routes: [
                GoRoute(
                  path: 'places',
                  builder: (context, state) => const PlacesPage(),
                ),
                GoRoute(
                  path: 'create/folder',
                  builder: (context, state) => CreateFolder(
                    onFolderCreated: (folderName) {
                      // print('新しいフォルダ名: $folderName');
                      // // 前の画面に戻る
                      context.pop();
                    },
                  ),
                ),
                GoRoute(
                  path: 'create/place',
                  builder: (context, state) => const CreatePlace(),
                ),
                GoRoute(
                  path: 'show/place',
                  builder: (context, state) => const ShowPlace(),
                ),
              ],
            ),
          ],
    ),
  ],
);
    
