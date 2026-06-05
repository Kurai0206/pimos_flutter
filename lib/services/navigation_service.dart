// navigation_service.dart es para manejar la navegación entre vistas en la aplicación.
// Proporciona métodos para navegar a una ruta específica o reemplazar la ruta actual.
import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigationTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName){
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
