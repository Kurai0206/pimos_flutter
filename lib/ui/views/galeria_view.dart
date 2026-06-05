// vista de galería, se muestra una grilla de imágenes con las diferentes
// categorías de productos del restaurante,

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GaleriaView extends StatefulWidget {
  const GaleriaView({super.key});

  @override
  State<GaleriaView> createState() => _GaleriaViewState();
}

class _GaleriaViewState extends State<GaleriaView> {
  String _filtroActivo = 'Todos';

  // Todas las imágenes con categoría y etiqueta
  final List<Map<String, String>> _todasLasImagenes = [
    {'path': 'assets/alitas.jpeg',              'categoria': 'Comida',  'label': 'Alitas'},
    {'path': 'assets/alitas2.jpeg',             'categoria': 'Comida',  'label': 'Alitas'},
    {'path': 'assets/bonless.jpeg',            'categoria': 'Comida',  'label': 'Boneless'},
    {'path': 'assets/hamburguesas.jpeg',        'categoria': 'Comida',  'label': 'Hamburguesas'},
    {'path': 'assets/papas.jpeg',               'categoria': 'Comida',  'label': 'Papas'},
    {'path': 'assets/abarrotes.jpeg',           'categoria': 'Comida',  'label': 'Abarrotes'},
    {'path': 'assets/pimos-bg.jpeg',            'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg1.jpeg',           'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg2.jpeg',           'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg3.jpeg',           'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg4.jpg',            'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg5.jpeg',           'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg7.jpeg',           'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/pimos-bg8.jpg',            'categoria': 'Comida',  'label': 'Pimo\'s'},
    {'path': 'assets/gomitas_en_bolsitas.jpeg', 'categoria': 'Gomitas', 'label': 'Gomitas en bolsitas'},
    {'path': 'assets/gomitas_granel.jpeg',      'categoria': 'Gomitas', 'label': 'Gomitas a granel'},
    {'path': 'assets/pimos-bg6.jpg',            'categoria': 'Gomitas', 'label': 'Gomitas'},
  ];

  final List<String> _categorias = ['Todos', 'Comida', 'Gomitas'];

  List<Map<String, String>> get _imagenesFiltradas => _filtroActivo == 'Todos'
      ? _todasLasImagenes
      : _todasLasImagenes.where((img) => img['categoria'] == _filtroActivo).toList();

  void _abrirImagen(BuildContext context, int index, List<Map<String, String>> imagenes) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.92),
      builder: (_) => _VisorImagen(imagenes: imagenes, indiceInicial: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // --- HERO HEADER ---
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pimos-bg8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NUESTRA GALERÍA',
                          style: GoogleFonts.montserrat(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                          ),
                        ),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 12),
                        Text(
                          '${_todasLasImagenes.length} fotos',
                          style: GoogleFonts.montserrat(
                            color: Colors.white38,
                            fontSize: 13,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // --- FILTROS ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: _categorias.map((cat) {
                  final bool activo = _filtroActivo == cat;
                  return GestureDetector(
                    onTap: () => setState(() => _filtroActivo = cat),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                      decoration: BoxDecoration(
                        color: activo ? Colors.red.shade900 : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: activo ? Colors.red.shade900 : Colors.white24,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: GoogleFonts.montserrat(
                          color: activo ? Colors.white : Colors.white54,
                          fontSize: 13,
                          fontWeight: activo ? FontWeight.w700 : FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // --- CONTADOR DE RESULTADOS ---
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_imagenesFiltradas.length} resultado${_imagenesFiltradas.length != 1 ? 's' : ''}',
                  style: GoogleFonts.montserrat(
                    color: Colors.white30,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            // --- GRILLA DE IMÁGENES ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.0,
                ),
                itemCount: _imagenesFiltradas.length,
                itemBuilder: (context, index) {
                  final img = _imagenesFiltradas[index];
                  return _ImagenCard(
                    imagePath: img['path']!,
                    label: img['label']!,
                    onTap: () => _abrirImagen(context, index, _imagenesFiltradas),
                  );
                },
              ),
            ),

            const SizedBox(height: 50),
            const _PimosFooter(),
          ],
        ),
      ),
    );
  }
}

// --- TARJETA DE IMAGEN CON HOVER ---
class _ImagenCard extends StatefulWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const _ImagenCard({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ImagenCard> createState() => _ImagenCardState();
}

class _ImagenCardState extends State<_ImagenCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _hover
                    ? Colors.red.shade900.withOpacity(0.5)
                    : Colors.black.withOpacity(0.4),
                blurRadius: _hover ? 18 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Imagen
                Image.asset(widget.imagePath, fit: BoxFit.cover),

                // Overlay al hacer hover
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 220),
                  opacity: _hover ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.75),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.zoom_in, color: Colors.white70, size: 18),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            widget.label,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
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
    );
  }
}

// --- VISOR DE IMAGEN A PANTALLA COMPLETA ---
class _VisorImagen extends StatefulWidget {
  final List<Map<String, String>> imagenes;
  final int indiceInicial;

  const _VisorImagen({required this.imagenes, required this.indiceInicial});

  @override
  State<_VisorImagen> createState() => _VisorImagenState();
}

class _VisorImagenState extends State<_VisorImagen> {
  late int _indiceActual;

  @override
  void initState() {
    super.initState();
    _indiceActual = widget.indiceInicial;
  }

  void _anterior() {
    if (_indiceActual > 0) setState(() => _indiceActual--);
  }

  void _siguiente() {
    if (_indiceActual < widget.imagenes.length - 1) setState(() => _indiceActual++);
  }

  @override
  Widget build(BuildContext context) {
    final img = widget.imagenes[_indiceActual];
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Imagen principal
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              img['path']!,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ),

          // Etiqueta
          Positioned(
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${img['label']}  ·  ${_indiceActual + 1} / ${widget.imagenes.length}',
                style: GoogleFonts.montserrat(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          // Flecha izquierda
          if (_indiceActual > 0)
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: _anterior,
                icon: const Icon(Icons.chevron_left, color: Colors.white, size: 40),
              ),
            ),

          // Flecha derecha
          if (_indiceActual < widget.imagenes.length - 1)
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: _siguiente,
                icon: const Icon(Icons.chevron_right, color: Colors.white, size: 40),
              ),
            ),

          // Botón cerrar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Colors.white70, size: 28),
            ),
          ),
        ],
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
              _FooterIcon(icon: Icons.chat_outlined, label: 'WhatsApp'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, color: Colors.red.shade800, size: 16),
              const SizedBox(width: 6),
              const Text('Dirección',
                  style: TextStyle(color: Colors.white38, fontSize: 12)),
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
