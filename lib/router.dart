import 'package:go_router/go_router.dart';
import 'package:gsm_inside_flutter/views/gallery/gallery_page.dart';
import 'package:gsm_inside_flutter/views/gallery/make_gallery_page.dart';
import 'package:gsm_inside_flutter/views/home/home_page.dart';
import 'package:gsm_inside_flutter/views/search/search_page.dart';
import 'package:gsm_inside_flutter/views/splash/splash_page.dart';

class PageRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Homepage(),
        routes: [
          GoRoute(
            path: 'splash',
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            path: 'gallery',
            builder: (context, state) => const GalleryPage(),
          ),
          GoRoute(
            path: 'make',
            builder: (context, state) => const MakeGalleryPage(),
          ),
          GoRoute(
            path: 'search',
            builder: (context, state) => SearchPage(),
          )
        ],
      ),
    ],
  );
}
