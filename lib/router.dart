import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:gsm_inside_flutter/views/gallery/gallery_page.dart';
import 'package:gsm_inside_flutter/views/gallery/make_gallery_page.dart';
import 'package:gsm_inside_flutter/views/home/home_page.dart';
import 'package:gsm_inside_flutter/views/search/search_page.dart';

class PageRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => const CupertinoPage(
          child: Homepage(),
        ),
        routes: [
          GoRoute(
            path: 'gallery',
            name: 'gallery',
            pageBuilder: (context, state) => const CupertinoPage(
              child: GalleryPage(),
            ),
          ),
          GoRoute(
            path: 'make',
            name: 'make',
            pageBuilder: (context, state) => const CupertinoPage(
              child: MakeGalleryPage(),
            ),
          ),
          GoRoute(
            path: 'search',
            name: 'search',
            pageBuilder: (context, state) => CupertinoPage(
              child: SearchPage(),
            ),
          )
        ],
      ),
    ],
  );
}
