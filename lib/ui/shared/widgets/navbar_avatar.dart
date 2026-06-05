// navbar_avatar.dart es un widget que muestra un 
//avatar en la barra de navegación (Navbar) del dashboard.
// El avatar se muestra como una imagen circular utilizando el widget ClipOval, y se carga desde
//en el navegador es la imagen de un mono negro, que se obtiene a través de una URL. 
//Este widget se utiliza para representar al usuario actual en la barra de navegación,
// proporcionando una forma visual de identificar al usuario y mejorar 
//la experiencia de usuario en el dashboard.

import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.network('https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg='),
      ),
    );
  }
}