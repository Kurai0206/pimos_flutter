//links_bar.dart es un widget que se encarga de mostrar
// una barra de enlaces en la parte inferior de la pantalla de inicio de sesión.

import 'package:e301_login/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width>1000)?size.height*0.1:null,
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(texto: 'About', onPressed: () => print('Click on About')),
            LinkText(texto: 'Help Center'),
            LinkText(texto: 'Terms of Service'),
            LinkText(texto: 'Privacy Policy'),
            LinkText(texto: 'Cookies Policy'),
            LinkText(texto: 'Ads Info'),
            LinkText(texto: 'Blog'),
            LinkText(texto: 'Status'),
            LinkText(texto: 'Careers'),
            LinkText(texto: 'Brand Resources'),
            LinkText(texto: 'Advertising'),
            LinkText(texto: 'Marketing'),
          ],
        ),
      ),
    );
  }
}
