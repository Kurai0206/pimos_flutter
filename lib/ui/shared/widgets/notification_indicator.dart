// notification_indicator.dart es un widget que muestra un indicador de notificaciones 
//en la barra de navegación (Navbar) del dashboard.
// El indicador se muestra como un círculo rojo en la esquina superior derecha del 
//icono de notificaciones.
// Este widget se utiliza para alertar al usuario sobre nuevas notificaciones y 
//mejorar la experiencia de usuario en el dashboard.

import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(Icons.notifications_none_outlined,color: Colors.grey),
          Positioned(
            left: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: buildBoxDecoration(),
            )
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(100)
  );
}