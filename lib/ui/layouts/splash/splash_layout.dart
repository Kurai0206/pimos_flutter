// splash_layout.dart es el layout que se muestra mientras se verifica el
// estado de autenticación del usuario.
// Muestra un CircularProgressIndicator y un mensaje de "Checking..." 
//para indicar que se está realizando la verificación. Este layout se utiliza como 
//pantalla de carga mientras se determina si el usuario está autenticado o no, y luego redirige
// a la pantalla correspondiente (dashboard o autenticación) según el resultado de la verificación.
// Es una forma de proporcionar una experiencia de usuario fluida y evitar mostrar contenido 
//no autorizado mientras se realiza la verificación.
import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Checking...')
          ],
        ),
      ),
    );
  }
}