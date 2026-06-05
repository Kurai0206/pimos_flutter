//navbar de la app, se muestra en la parte superior de la pantalla,
// contiene el icono del menu, el buscador, las notificaciones y el avatar del usuario
import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/ui/shared/widgets/navbar_avatar.dart';
import 'package:e301_login/ui/shared/widgets/notification_indicator.dart';
import 'package:e301_login/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //Icono del menu
          SizedBox(width: 10),
          if(size.width<=700)
            IconButton(
              onPressed: () => SidemenuProvider.openMenu(),
              icon: Icon(Icons.menu_outlined)
            ),
          
          SizedBox(width: 10),

          //Búsqueda
          if(size.width>400)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),

          Spacer(),
          NotificationIndicator(),
          SizedBox(width: 20),
          NavbarAvatar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 5)],
  );
}
