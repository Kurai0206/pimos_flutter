// vista de productos, se muestra una sección de héroe con una imagen de fondo y un título,
// también se muestra una sección con el título "Mis Productos" y una descripción,

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductosView extends StatelessWidget {
  const ProductosView({super.key});

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
                decoration: const BoxDecoration(
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
                left: 40,
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elige lo que te gusta',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Elige Pimo's",
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

          // Título y descripción
          Container(
            color: const Color(0xff111111),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Mis Productos',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(width: 60, height: 2, color: Colors.red),
                const SizedBox(height: 15),
                const Text(
                  'Desde alitas, boneless, hamburguesas y un extra que son nuestras gomitas y tienda de abarrotes.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Productos Grid
          Container(
            color: const Color(0xff111111),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1,
              children: const [
                _ProductoCard(
                  image: 'assets/hamburguesas.jpeg',
                  title: 'Hamburguesas',
                  description: 'Jugosas hamburguesas con los mejores ingredientes, acompañadas de papas fritas.',
                ),
                _ProductoCard(
                  image: 'assets/bonless.jpeg',
                  title: 'Boneless',
                  description: 'Boneless crujientes bañados en tu salsa favorita, la combinación perfecta.',
                ),
                _ProductoCard(
                  image: 'assets/alitas.jpeg',
                  title: 'Alitas',
                  description: 'Alitas doradas y sabrosas en diferentes salsas para todos los gustos.',
                ),
                _ProductoCard(
                  image: 'assets/gomitas_granel.jpeg',
                  title: 'Gomitas a Granel',
                  description: 'Deliciosas gomitas enchiladas a granel, el snack perfecto para botanear.',
                ),
                _ProductoCard(
                  image: 'assets/gomitas_en_bolsitas.jpeg',
                  title: 'Gomitas en Bolsitas',
                  description: 'Gomitas empaquetadas con el sello Pimo\'s, listas para llevar a donde quieras.',
                ),
                _ProductoCard(
                  image: 'assets/abarrotes.jpeg',
                  title: 'Abarrotes',
                  description: 'Tienda de abarrotes con todo lo que necesitas, en un solo lugar.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Extras y Salsas
          Container(
            color: const Color(0xff1a1a1a),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SeccionTitulo(titulo: 'Extras'),
                      SizedBox(height: 15),
                      _ItemLista(texto: 'Salsa Ranch'),
                      _ItemLista(texto: 'Salsa Picante'),
                      SizedBox(height: 30),
                      _SeccionTitulo(titulo: 'Bebidas'),
                      SizedBox(height: 15),
                      _ItemLista(texto: 'Malteada'),
                      _ItemLista(texto: 'Refresco'),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SeccionTitulo(titulo: 'Salsas'),
                      SizedBox(height: 15),
                      _ItemLista(texto: 'Ajo Parmesano'),
                      _ItemLista(texto: 'BBQ'),
                      _ItemLista(texto: 'BBQ Miel'),
                      _ItemLista(texto: 'Lemon Pepper'),
                      _ItemLista(texto: 'Red Hot'),
                      _ItemLista(texto: 'Mango Habanero'),
                      _ItemLista(texto: 'Smoky Hot'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            color: const Color(0xff0d0d0d),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: const Wrap(
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

class _ProductoCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _ProductoCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1a1a1a),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeccionTitulo extends StatelessWidget {
  final String titulo;
  const _SeccionTitulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: GoogleFonts.montserratAlternates(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Container(width: 40, height: 2, color: Colors.red),
      ],
    );
  }
}

class _ItemLista extends StatelessWidget {
  final String texto;
  const _ItemLista({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Colors.red, size: 8),
          const SizedBox(width: 10),
          Text(
            texto,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}