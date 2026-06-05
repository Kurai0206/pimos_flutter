// custom_inputs.dart es una clase que proporciona métodos estáticos para 
//crear decoraciones de entrada personalizadas para campos de texto en Flutter.
// La clase tiene dos métodos: loginInputDecoration y searchInputDecoration, que son utilizados 
//para crear decoraciones de entrada específicas para formularios de inicio de sesión y 
//campos de búsqueda, respectivamente. como lo que se muestra en el ejemplo de uso en el
// comentario al final del archivo.
import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withAlpha(100)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withAlpha(100)),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey.withAlpha(150)),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon,color:Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }
}
