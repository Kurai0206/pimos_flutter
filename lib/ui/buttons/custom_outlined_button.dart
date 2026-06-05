// custom_outlined_button.dart es un widget personalizado 
//que extiende StatelessWidget para crear un botón con estilo personalizado.
// El botón tiene propiedades para manejar la acción al presionarlo, el texto que se muestra
//el boton es el que es utilizado en el login y register, el color del borde y 
//si el botón está relleno o no.
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
    this.isFilled = false
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: color),
        ),
        backgroundColor: WidgetStatePropertyAll(
          isFilled ? color.withAlpha(50): Colors.transparent
        )
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
