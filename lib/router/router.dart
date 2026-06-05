// router.dart es el archivo principal para configurar las
// rutas de la aplicación utilizando Fluro.
import 'package:e301_login/router/admin_handlers.dart';
import 'package:e301_login/router/dashboard_handlers.dart';
import 'package:e301_login/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';
  static String dashboardRoute = '/dashboard';
  static String nosotrosRoute = '/dashboard/nosotros';
  static String menuRoute = '/dashboard/menu';
  static String promocionesRoute = '/dashboard/promociones';
  static String galeriaRoute = '/dashboard/galeria';
  static String productosRoute = '/dashboard/productos';
  static String sucursalesRoute = '/dashboard/sucursales';
  static String contactoRoute = '/dashboard/contacto';

  static void configRoutes() {
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(nosotrosRoute,
        handler: DashboardHandlers.nosotros, transitionType: TransitionType.none);
    router.define(menuRoute,
        handler: DashboardHandlers.menu, transitionType: TransitionType.none);
    router.define(promocionesRoute,
        handler: DashboardHandlers.promociones, transitionType: TransitionType.none);
    router.define(galeriaRoute,
        handler: DashboardHandlers.galeria, transitionType: TransitionType.none);
    router.define(productosRoute,
        handler: DashboardHandlers.productos, transitionType: TransitionType.none);
    router.define(sucursalesRoute,
        handler: DashboardHandlers.sucursales, transitionType: TransitionType.none);
    router.define(contactoRoute,
        handler: DashboardHandlers.contacto, transitionType: TransitionType.none);

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}