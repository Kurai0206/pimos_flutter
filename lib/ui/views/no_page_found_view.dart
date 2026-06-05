// vista de página no encontrada, se muestra un mensaje indicando que la página no fue encontrada.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '404 - Página No Encontrada',
        style: GoogleFonts.montserratAlternates(
          fontSize: 50,
          fontWeight:FontWeight.w600
          )
        ),
    );
  }
}