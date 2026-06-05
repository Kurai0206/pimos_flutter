// register_form_provider.dart es para manejar el estado
// del formulario de registro (RegisterForm).
// Proporciona un método para validar el formulario y almacenar los
// valores de correo electrónico, contraseña y nombre ingresados por el usuario.
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid...Login');
      print('$email -> $password -> $name');
    } else {
      print('Form not valid!');
    }
  }
}
