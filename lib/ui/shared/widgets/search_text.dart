// search_text.dart es un widget que muestra un campo de texto para 
//realizar búsquedas en la barra de navegación (Navbar) del dashboard. 
//El campo de texto tiene un diseño personalizado utilizando el widget Container, 
//con una altura de 40 píxeles, bordes redondeados y un fondo gris claro.
// El TextField dentro del Container utiliza una decoración personalizada 
//definida en CustomInputs.searchInputDecoration, que incluye un icono de búsqueda 
//y un texto de sugerencia ("Search"). Este widget se utiliza para permitir
// a los usuarios realizar búsquedas rápidas y mejorar la experiencia de usuario en el dashboard.
import 'package:e301_login/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
          hint: 'Search', 
          icon: Icons.search_outlined
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withAlpha(20),
  );
}