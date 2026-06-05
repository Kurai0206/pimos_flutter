
// text_separator.dart es un widget que muestra un texto con un estilo específico,
// utilizado como separador o título en diferentes partes de la aplicación. 
//El texto se muestra con una fuente Roboto de tamaño 12 y un color blanco con una opacidad del 100%.
// Este widget se utiliza para proporcionar una forma visual de separar secciones o destacar 
//títulos en la interfaz de usuario, mejorando la organización y la legibilidad del contenido.
//en la ejec ucucion se ve en la pantalla en las opciones del menu lateral (Sidebar)
// del dashboard, como "Main" y "UI Elements", para indicar las diferentes secciones del menú 
//y facilitar la navegación del usuario. es decir contacto, menu etc
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  final String text;

  const TextSeparator({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.white.withAlpha(100),
        ),
      ),
    );
  }
}
