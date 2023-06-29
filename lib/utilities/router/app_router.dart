import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/screens/details.dart';
import 'package:netapp/app/presentation/screens/error.dart';
import 'package:netapp/app/presentation/screens/home.dart';
import 'package:netapp/app/presentation/screens/new/data_capture_form.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/screens/products.dart';
import 'package:netapp/utilities/router/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
        );
      case Routes.todayDetails:
        return MaterialPageRoute(
          builder: (_) => const TodayDetails(),
        );

      case Routes.dataCapture:
        return MaterialPageRoute(
          builder: (_) => const DataCatureScreen(),
        );
      case Routes.details:
        var data = routeSettings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            data: data,
          ),
        );
      // case Routes.payNowScreen:
      //   var data = routeSettings.arguments as CardModel;
      //   return MaterialPageRoute(
      //     builder: (_) => PayNowScreen(card: data),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
