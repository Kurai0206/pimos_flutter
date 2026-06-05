// vista de contacto, se muestra la información de contacto del restaurante,
// como la dirección, el número de teléfono, el correo electrónico y las redes sociales.
// También se muestra un mapa con la ubicación del restaurante y un formulario de contacto 
//para que los usuarios puedan enviar sus dudas o sugerencias directamente desde la app.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoView extends StatelessWidget {
  const ContactoView({super.key});

  void _abrirEnlace(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
                    image: AssetImage('assets/pimos-bg6.jpg'),
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
                      '¿Dudas o sugerencias?',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Contáctanos',
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

          // Título Contacto
          Container(
            width: double.infinity,
            color: Color(0xff111111),
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                'Contacto',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Visítanos + Mapa
          Container(
            color: Color(0xff111111),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visítanos',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                // Mapa como imagen clickeable
                GestureDetector(
                  onTap: () => _abrirEnlace(
                    'https://www.google.com/maps/place/La+Mansion+Restaurant/@19.7060887,-101.1918329,17z',
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red.withAlpha(80)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://maps.googleapis.com/maps/api/staticmap?center=19.7060887,-101.1918329&zoom=15&size=600x200&markers=color:red%7C19.7060887,-101.1918329&key=YOUR_API_KEY',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Color(0xff1a1a1a),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.map_outlined, color: Colors.red, size: 40),
                                      SizedBox(height: 10),
                                      Text(
                                        'Ver en Google Maps',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Toca para abrir',
                                        style: TextStyle(color: Colors.red, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.open_in_new, color: Colors.white, size: 14),
                                  SizedBox(width: 5),
                                  Text(
                                    'Abrir en Maps',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.red, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Ciudad Hidalgo, Michoacán',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Redes Sociales
          Container(
            color: Color(0xff1a1a1a),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Redes sociales',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _RedSocial(
                  icon: Icons.facebook_outlined,
                  texto: 'facebook.com/Pimo\'s',
                  url: 'https://facebook.com',
                  onTap: _abrirEnlace,
                ),
                SizedBox(height: 15),
                _RedSocial(
                  icon: Icons.camera_alt_outlined,
                  texto: 'instagram.com/Pimo\'s',
                  url: 'https://instagram.com',
                  onTap: _abrirEnlace,
                ),
                SizedBox(height: 15),
                _RedSocial(
                  icon: Icons.chat_outlined,
                  texto: '78611022089',
                  url: 'https://wa.me/78611022089',
                  onTap: _abrirEnlace,
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
                Text('Dirección', style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(width: 10),
                Text("Derechos Reservados Pimo's 2026",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RedSocial extends StatelessWidget {
  final IconData icon;
  final String texto;
  final String url;
  final Function(String) onTap;

  const _RedSocial({
    required this.icon,
    required this.texto,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(url),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(30),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.withAlpha(80)),
            ),
            child: Icon(icon, color: Colors.red, size: 20),
          ),
          SizedBox(width: 15),
          Text(
            texto,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white30,
            ),
          ),
        ],
      ),
    );
  }
}