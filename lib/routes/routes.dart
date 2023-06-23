import 'package:flutter/material.dart';
import 'package:test_project/blocs/articles/articles_cubit.dart';
import 'package:test_project/blocs/login/login_cubit.dart';
import 'package:test_project/pages/articles_page.dart';
import 'package:test_project/pages/login_page.dart';

class Routes {
  static const String login = '/';
  static const String articles = '/articles';

  Route route(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginPage(),
                ));
      case articles:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => ArticlesCubit()..getArticles(),
                child: const ArticlesPage()));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
