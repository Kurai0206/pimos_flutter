// auth_provider.dart es para manejar la autenticación del usuario en la aplicación.
// Proporciona métodos para iniciar sesión, cerrar sesión y verificar si el usuario está autenticado.
import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/local_storage.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }
// El método login simula un proceso de autenticación exitoso, 
//estableciendo un token ficticio y actualizando el estado de autenticación. Luego,
// redirige al usuario al dashboard.
  login(String email, String password) {
    _token = 'hjasd.hjgshjghsaj.kjjhsjkh';
    LocalStorage.prefs.setString('token', _token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }
// El método logout elimina el token de autenticación,
// actualiza el estado a no autenticado y redirige al usuario a la vista de inicio de sesión.
  logout() {
    _token = null;
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }

// El método isAuthenticated verifica si hay un token de autenticación almacenado.
// Si no hay token, establece el estado como no autenticado. En este ejemplo, incluso si hay un token,
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    await Future.delayed(Duration(milliseconds: 1000));

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // Sin backend real, siempre pide login al reiniciar
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
    return false;
  }
}