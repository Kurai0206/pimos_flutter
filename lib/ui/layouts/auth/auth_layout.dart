// auth_layout.dart es un widget personalizado que extiende StatelessWidget
// para crear una estructura de diseño para las pantallas de autenticación.
//se muestrsa en el navegador web, se muestra una imagen a la izquierda y el formulario 
//de autenticación a la derecha.
// Si el tamaño de la pantalla es menor a 1000 píxeles, se muestra una vista móvil
// con el formulario de autenticación en la parte superior y la imagen en la parte inferior.
//basicamen el archivo para que sea responsivo y se adapte a diferentes tamaños de pantalla,
// proporcionando una experiencia de usuario óptima tanto en dispositivos móviles como en escritorios.
//y es para que sea responsivo en las vistass de autenticación y , mostrando una imagen 
//a la izquierda y el formulario de autenticación a la derecha en pantallas grandes, 
//y una vista móvil con el formulario de autenticación en la parte superior y la imagen 
//en la parte inferior en pantallas pequeñas.
import 'package:e301_login/ui/widgets/background_image.dart';
import 'package:e301_login/ui/widgets/custom_title.dart';
import 'package:e301_login/ui/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            (size.width > 1000)
                ? _DesktopBody(child: child)
                : _MobileBody(child: child),
        
            //Linksbar
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundImage(),
          ),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width,
        height: size.height * 0.9,
        color: Colors.amber,
        child: Row(
          children: [
            //Imagen
            Expanded(child: BackgroundImage()),
            //View
            Container(
              color: Colors.black,
              width: 500,
              height: double.infinity,
              child: Column(
                children: [
                  CustomTitle(),
                  SizedBox(height: 20),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
