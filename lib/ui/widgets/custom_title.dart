//custom_title.dart es un widget que se encarga de mostrar
// el título de la aplicación en la pantalla de inicio de sesión. 
//El título se compone de dos partes: "Happening" y "Now". 
//La primera parte se muestra en color rojo y la segunda parte se muestra en color blanco.
// Además, el widget también muestra el logo de Pimos en la parte superior del título. 
//El widget utiliza un Column para organizar el logo y el título, y un RichText
// para mostrar el título con diferentes estilos.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60), // <- agrega esta línea
        Image.asset(
          'assets/pimos-logo.png',
          width: 80,
          height: 80,
        ),
        SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Happening ',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: 'Now',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}