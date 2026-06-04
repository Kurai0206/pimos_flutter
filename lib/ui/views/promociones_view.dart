import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromocionesView extends StatefulWidget {
  const PromocionesView({super.key});

  @override
  State<PromocionesView> createState() => _PromocionesViewState();
}

class _PromocionesViewState extends State<PromocionesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HERO ---
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pimos-bg8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0.4), Colors.black],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PROMOCIONES',
                          style: GoogleFonts.montserrat(
                            fontSize: 42,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 80,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.red.shade900, Colors.red.shade400],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red.shade700.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '¡Solo por tiempo limitado!',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.red.shade300,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // --- TARJETAS DE PROMOCIONES ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _PromoCard(
                    imagen: 'assets/bonless.jpeg',
                    titulo: 'Combo Boneless x2',
                    descripcion: '2 órdenes de bonless\n+ papas por solo \$199',
                    etiqueta: 'HOT DEAL',
                  ),
                  SizedBox(width: 28),
                  _PromoCard(
                    imagen: 'assets/alitas.jpeg',
                    titulo: 'Kilo de Alitas',
                    descripcion: 'Llévate 1kg de nuestras\nmejores alitas por \$200',
                    etiqueta: 'POPULAR',
                  ),
                  SizedBox(width: 28),
                  _PromoCard(
                    imagen: 'assets/alitas2.jpeg',
                    titulo: 'Domingo de Alitas',
                    descripcion: 'Todos los domingos\n½ kilo por solo \$134',
                    etiqueta: 'SEMANAL',
                  ),
                ],
              ),
            ),

            // --- BANNER DOMICILIO ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
              decoration: BoxDecoration(
                color: const Color(0xff111111),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.red.shade900.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade900.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade900.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.delivery_dining,
                            color: Colors.red.shade400, size: 40),
                      ),
                      const SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SERVICIO SOLO A DOMICILIO',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.red.shade400, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                'Llámanos o escribe al: 786 234 0642',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 8,
                      shadowColor: Colors.red.shade900.withOpacity(0.5),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.white, size: 20),
                    label: Text(
                      'ORDENAR AHORA',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),
            const _PimosFooter(),
          ],
        ),
      ),
    );
  }
}

// --- PROMO CARD CON HOVER ---
class _PromoCard extends StatefulWidget {
  final String imagen;
  final String titulo;
  final String descripcion;
  final String etiqueta;

  const _PromoCard({
    required this.imagen,
    required this.titulo,
    required this.descripcion,
    required this.etiqueta,
  });

  @override
  State<_PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<_PromoCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 320,
        decoration: BoxDecoration(
          color: const Color(0xff111111),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hover
                ? Colors.red.shade700.withOpacity(0.7)
                : Colors.red.withOpacity(0.15),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? Colors.red.shade900.withOpacity(0.35)
                  : Colors.black.withOpacity(0.3),
              blurRadius: _hover ? 24 : 10,
              spreadRadius: _hover ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen con badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: _hover ? 1.04 : 1.0,
                    child: Image.asset(
                      widget.imagen,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Badge etiqueta
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.etiqueta,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Contenido
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.titulo,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(width: 40, height: 2, color: Colors.red.shade800),
                  const SizedBox(height: 10),
                  Text(
                    widget.descripcion,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- FOOTER ---
class _PimosFooter extends StatelessWidget {
  const _PimosFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff0d0d0d),
        border: Border(
          top: BorderSide(color: Colors.red.shade900.withOpacity(0.3), width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Pimo's",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FooterIcon(icon: Icons.facebook_outlined, label: 'Facebook'),
              const SizedBox(width: 28),
              _FooterIcon(icon: Icons.camera_alt_outlined, label: 'Instagram'),
              const SizedBox(width: 28),
              _FooterIcon(icon: Icons.chat_bubble_outline, label: 'WhatsApp'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "© Derechos Reservados Pimo's 2026",
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FooterIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.red.shade700, size: 26),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white30, fontSize: 10)),
      ],
    );
  }
}