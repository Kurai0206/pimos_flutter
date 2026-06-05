// vista de nosotros, se muestra información sobre la empresa, su misión y visión, 
//y un pie de página con información de contacto y redes sociales.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pimos-bg8.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black.withAlpha(150),
              ),
              Positioned(
                right: 40,
                top: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Conoce más sobre',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Pimo's",
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Quiénes somos
          Container(
            color: Color(0xff111111),
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                Text(
                  '¿Quiénes somos?',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(width: 60, height: 2, color: Colors.red),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'En PIMO\'S, nos apasiona la comida urbana de calidad. Somos un equipo dedicado a profesionalizar el sabor de nuestras alitas, hamburguesas y boneless a través de la innovación. Sabemos que el corazón de nuestro negocio es la cocina, pero el cerebro es el orden. Por ello, hemos desarrollado una plataforma propia para gestionar cada pedido con precisión, asegurando que desde que se nos antoja una hamburguesa hasta que llega a la mesa o al domicilio, el proceso sea rápido, organizado y sin errores. No solo vendemos comida; vendemos una experiencia de servicio eficiente y moderna.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/pimos-logo.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Misión y Visión
          Container(
            color: Color(0xff1a1a1a),
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Misión y Visión',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(width: 60, height: 2, color: Colors.red),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Misión
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xff111111),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red.withAlpha(80)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.flag_outlined, color: Colors.red, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Misión',
                                  style: GoogleFonts.montserratAlternates(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Nuestra misión es ofrecer las mejores alitas, hamburguesas y boneless de la zona, respaldados por un sistema de gestión inteligente que garantice que nunca nos falten tus ingredientes favoritos. Nos enfocamos en eliminar la confusión de los pedidos por redes sociales para ofrecerte una respuesta inmediata, un control de inventario exacto y un servicio al cliente que supere cualquier expectativa, haciendo que pedir en PIMO\'S sea tan fácil como disfrutar nuestra comida.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.8,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Visión
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xff111111),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red.withAlpha(80)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.visibility_outlined, color: Colors.red, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Visión',
                                  style: GoogleFonts.montserratAlternates(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Ser la cadena de comida rápida favorita y más avanzada tecnológicamente de nuestra región. Aspiramos a expandir el sabor de PIMO\'S a nuevos horizontes, utilizando nuestras herramientas digitales para mantener la misma calidad y rapidez en cada sucursal. Queremos ser reconocidos no solo por el toque único de nuestras salsas, sino por ser el negocio que mejor entiende y atiende a sus clientes a través de la era digital.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.8,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            color: Color(0xff0d0d0d),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              runSpacing: 10,
              children: [
                Icon(Icons.facebook_outlined, color: Colors.red, size: 30),
                Icon(Icons.camera_alt_outlined, color: Colors.red, size: 30),
                Icon(Icons.chat_outlined, color: Colors.red, size: 30),
                SizedBox(width: 10),
                Icon(Icons.location_on_outlined, color: Colors.red, size: 20),
                Text(
                  'Dirección',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(width: 10),
                Text(
                  "Derechos Reservados Pimo's 2026",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}