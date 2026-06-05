// vista de sucursales, se muestra una sección de héroe con una imagen de fondo y un título,
// también se muestra una sección con el título "Encuentra tu sucursal" 
//y una descripción de cada sucursal, 
//cada sucursal tiene un botón para abrir la ubicación en Google Maps y un mapa estático de la ubicación.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SucursalesView extends StatelessWidget {
  const SucursalesView({super.key});

  // Función para abrir Google Maps en el navegador o app externa
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
          // --- HERO SECTION ---
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pimos-bg6.jpg'), // Asegúrate de tener esta imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black.withOpacity(0.6),
              ),
              Positioned(
                left: 40,
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Encuentra tu sucursal',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Sucursales',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // --- SECCIÓN DE UBICACIONES ---
          Container(
            color: const Color(0xff111111),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              children: [
                // SUCURSAL 1
                _SucursalDetalle(
                  nombre: "Pimo's Central",
                  direccion: 'Calle Melchor Ocampo #123, Centro, Ciudad Hidalgo',
                  urlMaps: 'https://www.google.com/maps/search/?api=1&query=19.6915,-100.5567',
                  latLong: '19.6915,-100.5567',
                  onTap: _abrirEnlace,
                ),
                
                const SizedBox(height: 50),
                const Divider(color: Colors.white10),
                const SizedBox(height: 50),

                // SUCURSAL 2
                _SucursalDetalle(
                  nombre: "Pimo's Norte",
                  direccion: 'Av. Morelos Sur #456, Col. Lindavista, Ciudad Hidalgo',
                  urlMaps: 'https://www.google.com/maps/search/?api=1&query=19.7060,-100.5480',
                  latLong: '19.7060,-100.5480',
                  onTap: _abrirEnlace,
                ),
              ],
            ),
          ),

          // --- FOOTER ---
          const _PimosFooter(),
        ],
      ),
    );
  }
}

class _SucursalDetalle extends StatelessWidget {
  final String nombre;
  final String direccion;
  final String urlMaps;
  final String latLong;
  final Function(String) onTap;

  const _SucursalDetalle({
    required this.nombre,
    required this.direccion,
    required this.urlMaps,
    required this.latLong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nombre,
          style: GoogleFonts.montserratAlternates(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                direccion,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Contenedor del Mapa
        GestureDetector(
          onTap: () => onTap(urlMaps),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  // Imagen estática del mapa (sustituir YOUR_API_KEY si se tiene una real)
                  Image.network(
                    'https://maps.googleapis.com/maps/api/staticmap?center=$latLong&zoom=16&size=800x250&markers=color:red%7C$latLong&key=YOUR_API_KEY',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xff1a1a1a),
                      child: const Center(
                        child: Icon(Icons.map_sharp, color: Colors.white24, size: 50),
                      ),
                    ),
                  ),
                  // Overlay informativo
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.directions, color: Colors.white, size: 16),
                          SizedBox(width: 8),
                          Text('¿Cómo llegar?', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PimosFooter extends StatelessWidget {
  const _PimosFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff0d0d0d),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook_outlined, color: Colors.red, size: 28),
              SizedBox(width: 20),
              Icon(Icons.camera_alt_outlined, color: Colors.red, size: 28),
              SizedBox(width: 20),
              Icon(Icons.chat_outlined, color: Colors.red, size: 28),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Derechos Reservados Pimo's 2026",
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}