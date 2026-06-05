//sidebar de la app, se muestra en la parte izquierda de la pantalla, 
//contiene el logo de la app y los enlaces a las diferentes secciones de la app como
// inicio, nosotros, menú, promociones, galería, contacto y un botón de salir para cerrar sesión

import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:e301_login/ui/shared/widgets/logo.dart';
import 'package:e301_login/ui/shared/widgets/menu_item.dart';
import 'package:e301_login/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigationTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 30),
          const TextSeparator(text: 'Menú Principal'),
          MenuItem(
            text: 'Inicio',
            icon: Icons.home_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Nosotros',
            icon: Icons.info_outline,
            onPressed: () => navigateTo(Flurorouter.nosotrosRoute),
          ),
          MenuItem(
            text: 'Menú',
            icon: Icons.restaurant_menu_outlined,
            onPressed: () => navigateTo(Flurorouter.menuRoute),
          ),
          MenuItem(
            text: 'Promociones',
            icon: Icons.local_offer_outlined,
            onPressed: () => navigateTo(Flurorouter.promocionesRoute),
          ),
          MenuItem(
            text: 'Galería',
            icon: Icons.photo_library_outlined,
            onPressed: () => navigateTo(Flurorouter.galeriaRoute),
          ),
          // Botón de Productos actualizado
          MenuItem(
            text: 'Productos',
            icon: Icons.fastfood_outlined,
            onPressed: () => navigateTo(Flurorouter.productosRoute),
          ),
          MenuItem(
            text: 'Sucursales',
            icon: Icons.location_on_outlined,
            onPressed: () => navigateTo(Flurorouter.sucursalesRoute),
          ),
          MenuItem(
            text: 'Contacto',
            icon: Icons.contact_mail_outlined,
            onPressed: () => navigateTo(Flurorouter.contactoRoute),
          ),
          const SizedBox(height: 30),
          MenuItem(
            text: 'Salir',
            icon: Icons.exit_to_app_outlined,
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1a0000), Color(0xff2d0000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)],
      );
}