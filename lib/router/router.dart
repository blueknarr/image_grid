import 'package:go_router/go_router.dart';
import 'package:image_grid/ui/detail/detail_screen.dart';
import 'package:image_grid/ui/main/main_screen.dart';
import 'package:image_grid/ui/photo/photo_screen.dart';

import '../data/model/photo.dart';

final router = GoRouter(initialLocation: '/main', routes: [
  GoRoute(
    path: '/main',
    builder: (context, state) => const MainScreen(),
    routes: [
      GoRoute(
        path: 'photo',
        builder: (context, state) {
          int albumId = state.extra as int;
          return PhotoScreen(id: albumId);
        },
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) {
              Photo photo = state.extra as Photo;
              return DetailScreen(photo: photo);
            },
          ),
        ],
      ),
    ],
  ),
]);
