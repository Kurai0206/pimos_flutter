//background_image.dart es un widget que se encarga de mostrar una imagen 
//de fondo en la pantalla de inicio de sesión. La imagen se encuentra 
//en la carpeta assets y se llama pimos-bg1.jpeg. Además, el widget 
//también muestra el logo de Pimos en el centro de la pantalla, }
//que se encuentra en la carpeta assets y se llama pimos-logo.png.
// El widget utiliza un BoxDecoration para establecer 
//la imagen de fondo y un Container para centrar el logo en la pantalla.

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage('assets/pimos-logo.png'),
              width: 300,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/pimos-bg1.jpeg'),
        fit: BoxFit.cover,
      ),
    );
  }
}