import 'package:flutter/material.dart';
import 'package:foody_flutter/screens/%20menuDetails/menu_details_screen.dart';
import 'package:foody_flutter/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/menuDetails':
        return MaterialPageRoute(builder: (_) => MenuDetailScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(appBar: AppBar(title: Text('Error')));
    });
  }
}
