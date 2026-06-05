// login_form_provider.dart es para manejar el estado
// del formulario de inicio de sesión (LoginForm).
// Proporciona un método para validar el formulario y almacenar los
// valores de correo electrónico y contraseña ingresados por el usuario.
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      //print('Form valid...Login');
      //print('$email -> $password');
      return true;
    } else {
      //print('Form not valid!');
      return false;
    }
  }
}
