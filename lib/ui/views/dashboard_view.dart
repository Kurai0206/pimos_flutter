import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // --- Hero Section ---
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
                    color: Colors.black.withOpacity(0.6),
                  ),
                  Positioned(
                    left: 40,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sabor que domina',
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Tus sentidos',
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Boneless, hamburguesas, alitas, papas fritas y más',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Ordena ya',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // --- Promociones Section ---
              Container(
                color: const Color(0xff1a1a1a),
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      "Pimo's Promos",
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 70,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red.shade900, Colors.red.shade400],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _PromoCard(
                          image: 'assets/pimos-bg4.jpg',
                          title: 'Pimobby Fries',
                          descripcion: 'Papas · boneless · queso · aderezo',
                        ),
                        SizedBox(width: 24),
                        _PromoCard(
                          image: 'assets/pimos-bg2.jpeg',
                          title: 'Spicy Boneless',
                          descripcion: 'Crujientes · salsa · a tu gusto',
                        ),
                        SizedBox(width: 24),
                        _PromoCard(
                          image: 'assets/pimos-bg3.jpeg',
                          title: 'Combo Best Friends',
                          descripcion: 'Comparte el sabor con quien más quieras',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // --- Info Section ---
              Container(
                color: const Color(0xff111111),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/pimos-bg1.jpeg',
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Expanded(
                      child: Text(
                        'En Pimo\'s nos enfocamos en brindarte la mejor calidad en cada bocado. Nuestra pasión por la cocina urbana se refleja en la frescura de nuestros ingredientes y el sazón único que nos caracteriza.',
                        style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.8),
                      ),
                    ),
                  ],
                ),
              ),

              // --- Personaliza tu pedido ---
              Container(
                width: double.infinity,
                color: const Color(0xff1a1a1a),
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white54),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Personaliza tu pedido',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              // --- Footer ---
              const _DashboardFooter(),
            ],
          ),
        );
      },
    );
  }
}

class _PromoCard extends StatefulWidget {
  final String image;
  final String title;
  final String descripcion;

  const _PromoCard({
    required this.image,
    required this.title,
    required this.descripcion,
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? Colors.red.shade900.withOpacity(0.5)
                  : Colors.black.withOpacity(0.4),
              blurRadius: _hover ? 20 : 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  // Overlay sutil al hacer hover
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 220),
                    opacity: _hover ? 1.0 : 0.0,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.red.shade900.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              widget.descripcion,
              style: GoogleFonts.montserrat(
                color: Colors.white38,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

class _DashboardFooter extends StatelessWidget {
  const _DashboardFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
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
              _FooterIcon(icon: Icons.chat_outlined, label: 'WhatsApp'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, color: Colors.red.shade800, size: 16),
              const SizedBox(width: 6),
              const Text('Dirección', style: TextStyle(color: Colors.white38, fontSize: 12)),
              const SizedBox(width: 20),
              const Text("© Derechos Reservados Pimo's 2026",
                  style: TextStyle(color: Colors.white38, fontSize: 12)),
            ],
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