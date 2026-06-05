// dashboard_handlers.dart es para manejar las rutas del dashboard y 
//verificar la autenticación del usuario antes de mostrar las vistas correspondientes.
// Si el usuario no está autenticado, se redirige a la vista de inicio de sesión (LoginView).
import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/ui/views/contacto_view.dart';
import 'package:e301_login/ui/views/dashboard_view.dart';
import 'package:e301_login/ui/views/galeria_view.dart';
import 'package:e301_login/ui/views/login_view.dart';
import 'package:e301_login/ui/views/menu_view.dart';
import 'package:e301_login/ui/views/nosotros_view.dart';
import 'package:e301_login/ui/views/productos_view.dart'; // Importado
import 'package:e301_login/ui/views/promociones_view.dart';
import 'package:e301_login/ui/views/sucursales_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler nosotros = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return NosotrosView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler menu = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return MenuView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler promociones = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return PromocionesView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler galeria = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return GaleriaView();
      } else {
        return LoginView();
      }
    },
  );

  // Handler corregido para Productos
  static Handler productos = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      return (authProvider.authStatus == AuthStatus.authenticated) 
          ? const ProductosView() 
          : LoginView();
    },
  );

  static Handler sucursales = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return SucursalesView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler contacto = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ContactoView();
      } else {
        return LoginView();
      }
    },
  );
}