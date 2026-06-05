// logo.dart es un widget que muestra el logo de la aplicación, que consiste
// en una imagen y un texto con el nombre de la aplicación. Este widget se utiliza 
//en varias partes de la aplicación, como en la pantalla de inicio de sesión 
//y en la barra lateral (Sidebar) del dashboard. El logo se muestra centrado y 
//con un estilo personalizado utilizando la fuente Montserrat Alternates de Google Fonts.
// Es una forma de mantener una identidad visual consistente en toda la aplicación y mejorar
// la experiencia del usuario al reconocer rápidamente el logo de la marca.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/pimos-logo.png',
            width: 80,
            height: 80,
          ),
          SizedBox(height: 10),
          Text(
            "Pimo's",
            style: GoogleFonts.montserratAlternates(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}