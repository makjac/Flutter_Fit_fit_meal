import 'package:fit_fit_meal/constans/appRoute.dart';
import 'package:flutter/material.dart';

class appRouter {
  appRouter();

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME_PAGE:
      default:
        return null;
    }
  }
}
