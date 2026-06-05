// link_text.dart es un widget personalizado que extiende
// StatefulWidget para crear un texto con estilo de enlace (link).
// El widget tiene propiedades para manejar el texto que se muestra y la acción al presionarlo

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatefulWidget {
  final String texto;
  final Function? onPressed;

  const LinkText({super.key, required this.texto, this.onPressed});

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isOver = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isOver = true),
        onExit: (_) => setState(() => isOver = false),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.texto,
            style: GoogleFonts.montserratAlternates(
              fontSize: 14,
              color: isOver ? Colors.amber : Colors.grey[700],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
