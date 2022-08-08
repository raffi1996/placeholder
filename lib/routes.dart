import 'package:eds_task/pages/album_page/album_page.dart';
import 'package:eds_task/pages/current_post_page/current_post_page.dart';
import 'package:flutter/material.dart';

import 'constants/route_names.dart';
import 'models/album_model/album_model.dart';
import 'models/post_model/post_model.dart';
import 'models/user_model/user_model.dart';
import 'pages/home_page/home_page.dart';
import 'pages/posts_page/posts_page.dart';
import 'pages/splash_screen/splash_screen.dart';
import 'pages/user_page/user_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteNames.userPage:
        return MaterialPageRoute(
          builder: (_) => UserPage(
            user: settings.arguments as UserModel,
          ),
        );

      case RouteNames.postsPage:
        return MaterialPageRoute(
          builder: (_) => PostsPage(
            posts: settings.arguments as List<PostModel>,
          ),
        );

      case RouteNames.currentPost:
        return MaterialPageRoute(
          builder: (_) => CurrentPostPage(
            post: settings.arguments as PostModel,
          ),
        );

      case RouteNames.albumPage:
        return MaterialPageRoute(
          builder: (_) => AlbumPage(
            albums: settings.arguments as List<AlbumModel>,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
