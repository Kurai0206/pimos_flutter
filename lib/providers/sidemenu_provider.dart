// sidemenu_provider.dart es para manejar el estado del menú lateral (SideMenu) en la aplicación.
// Proporciona métodos para abrir, cerrar y alternar el estado del menú lateral, así
import 'package:flutter/widgets.dart';

class SidemenuProvider {
  static late AnimationController menuController;
  static bool isOpen = false;

  static Animation<double> movement = Tween<double>(
    begin: -200,
    end: 0,
  ).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();
    isOpen = !isOpen;
  }
}
