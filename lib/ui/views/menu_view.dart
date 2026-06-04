import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String? _selectedPapas;
  String? _selectedBoneless;
  String? _selectedAlitas;
  String? _selectedExtra;
  String? _selectedBebida;
  String? _selectedSalsa;

  // Resumen del pedido para mostrar en el botón / snackbar
  Map<String, String> get _resumenPedido => {
        if (_selectedPapas != null) 'Pimobby Fries': _selectedPapas!,
        if (_selectedBoneless != null) 'Boneless': _selectedBoneless!,
        if (_selectedAlitas != null) 'Alitas': _selectedAlitas!,
        if (_selectedExtra != null) 'Extra': _selectedExtra!,
        if (_selectedBebida != null) 'Bebida': _selectedBebida!,
        if (_selectedSalsa != null) 'Salsa': _selectedSalsa!,
      };

  void _realizarPedido() {
    if (_resumenPedido.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade900,
          content: Text(
            'Selecciona al menos un producto antes de pedir.',
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
        ),
      );
      return;
    }

    final resumen = _resumenPedido.entries
        .map((e) => '• ${e.key}: ${e.value}')
        .join('\n');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xff1a1a1a),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Resumen del pedido',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          resumen,
          style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar',
                style: GoogleFonts.montserrat(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green.shade800,
                  content: Text(
                    '¡Pedido realizado con éxito!',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
              );
            },
            child: Text('Confirmar',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HERO SECTION ---
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pimos-bg8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 450,
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
                Positioned(
                  left: 40,
                  bottom: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elige lo que te gusta',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        "Elige Pimo's",
                        style: GoogleFonts.montserrat(
                          fontSize: 52,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // --- TÍTULO MENÚ ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Column(
                children: [
                  Text(
                    'Menú',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),

            // --- TARJETAS DE PRODUCTOS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildMenuCards(context),
              ),
            ),

            const SizedBox(height: 70),

            // --- DIVISOR ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(color: Colors.red.shade900.withOpacity(0.4)),
            ),

            const SizedBox(height: 50),

            // --- EXTRAS, BEBIDAS Y SALSAS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: screenWidth > 800
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SeccionTituloMenu(titulo: 'Extras'),
                              _RadioList(
                                items: const ['Salsa Ranch', 'Salsa Picante'],
                                groupValue: _selectedExtra,
                                onChanged: (val) =>
                                    setState(() => _selectedExtra = val),
                              ),
                              const SizedBox(height: 40),
                              const _SeccionTituloMenu(titulo: 'Bebidas'),
                              _RadioList(
                                items: const ['Malteada', 'Refresco'],
                                groupValue: _selectedBebida,
                                onChanged: (val) =>
                                    setState(() => _selectedBebida = val),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SeccionTituloMenu(titulo: 'Salsas'),
                              _RadioList(
                                items: const [
                                  'Ajo Parmesano',
                                  'BBQ',
                                  'BBQ Miel',
                                  'Lemon Pepper',
                                  'Red Hot',
                                  'Mango Habanero',
                                  'Smoky Hot',
                                ],
                                groupValue: _selectedSalsa,
                                onChanged: (val) =>
                                    setState(() => _selectedSalsa = val),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  // Layout vertical en móvil
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SeccionTituloMenu(titulo: 'Extras'),
                        _RadioList(
                          items: const ['Salsa Ranch', 'Salsa Picante'],
                          groupValue: _selectedExtra,
                          onChanged: (val) =>
                              setState(() => _selectedExtra = val),
                        ),
                        const SizedBox(height: 40),
                        const _SeccionTituloMenu(titulo: 'Bebidas'),
                        _RadioList(
                          items: const ['Malteada', 'Refresco'],
                          groupValue: _selectedBebida,
                          onChanged: (val) =>
                              setState(() => _selectedBebida = val),
                        ),
                        const SizedBox(height: 40),
                        const _SeccionTituloMenu(titulo: 'Salsas'),
                        _RadioList(
                          items: const [
                            'Ajo Parmesano',
                            'BBQ',
                            'BBQ Miel',
                            'Lemon Pepper',
                            'Red Hot',
                            'Mango Habanero',
                            'Smoky Hot',
                          ],
                          groupValue: _selectedSalsa,
                          onChanged: (val) =>
                              setState(() => _selectedSalsa = val),
                        ),
                      ],
                    ),
            ),

            // --- BOTÓN REALIZAR PEDIDO ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Column(
                children: [
                  // Contador de selecciones activas
                  if (_resumenPedido.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        '${_resumenPedido.length} item(s) seleccionado(s)',
                        style: GoogleFonts.montserrat(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 56, vertical: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      elevation: 8,
                      shadowColor: Colors.red.shade900.withOpacity(0.5),
                    ),
                    onPressed: _realizarPedido,
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.white, size: 22),
                    label: Text(
                      'Realizar pedido',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const _PimosFooter(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuCards(BuildContext context) {
    return [
      _MenuCard(
        titulo: 'Pimobby Fries',
        imagen: 'assets/papas.jpeg',
        opciones: const [
          'Orden grande: Papas · boneless · queso · 1 aderezo',
          'Orden pequeña: Papas · boneless · queso · 1 aderezo',
        ],
        groupValue: _selectedPapas,
        onChanged: (value) => setState(() => _selectedPapas = value),
      ),
      _MenuCard(
        titulo: 'Boneless',
        imagen: 'assets/bonless.jpeg',
        opciones: const [
          'Orden grande: 15 - 18 pz',
          'Orden pequeña: 7 - 9 pz',
        ],
        groupValue: _selectedBoneless,
        onChanged: (value) => setState(() => _selectedBoneless = value),
      ),
      _MenuCard(
        titulo: 'Alitas',
        imagen: 'assets/alitas2.jpeg',
        opciones: const [
          'Orden grande: 15 - 17 pz',
          'Orden mediana: 8 - 11 pz',
          'Orden pequeña: 5 - 6 pz',
        ],
        groupValue: _selectedAlitas,
        onChanged: (value) => setState(() => _selectedAlitas = value),
      ),
    ];
  }
}

// ─────────────────────────────────────────────
// COMPONENTES
// ─────────────────────────────────────────────

class _MenuCard extends StatelessWidget {
  final String titulo;
  final String imagen;
  final List<String> opciones;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const _MenuCard({
    required this.titulo,
    required this.imagen,
    required this.opciones,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = groupValue != null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 340,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.red.shade900.withOpacity(0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected
              ? Colors.red.shade800.withOpacity(0.5)
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Título con indicador de selección
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(Icons.check_circle, color: Colors.red.shade700, size: 18),
              ],
            ],
          ),
          const SizedBox(height: 18),

          // Imagen más grande
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagen,
              height: 220,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Radio buttons con mejor estilo
          ...opciones.map(
            (opt) => Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey.shade600,
              ),
              child: RadioListTile<String>(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                title: Text(
                  opt,
                  style: TextStyle(
                    color: groupValue == opt
                        ? Colors.white
                        : Colors.white60,
                    fontSize: 14,
                    fontWeight: groupValue == opt
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                value: opt,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: Colors.red.shade700,
                dense: true,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioList extends StatelessWidget {
  final List<String> items;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const _RadioList({
    required this.items,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey.shade600,
              ),
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  item,
                  style: TextStyle(
                    color: groupValue == item ? Colors.white : Colors.white60,
                    fontSize: 15,
                    fontWeight: groupValue == item
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                value: item,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: Colors.red.shade700,
                dense: true,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SeccionTituloMenu extends StatelessWidget {
  final String titulo;
  const _SeccionTituloMenu({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 160,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade800, Colors.transparent],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 14),
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
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff0d0d0d),
        border: Border(
          top: BorderSide(color: Colors.red.shade900.withOpacity(0.3), width: 1),
        ),
      ),
      child: Column(
        children: [
          // Logo / nombre
          Text(
            "Pimo's",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          // Redes sociales
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FooterIcon(icon: Icons.facebook, label: 'Facebook'),
              const SizedBox(width: 28),
              _FooterIcon(icon: Icons.camera_alt_outlined, label: 'Instagram'),
              const SizedBox(width: 28),
              _FooterIcon(icon: Icons.chat_bubble_outline, label: 'WhatsApp'),
            ],
          ),
          const SizedBox(height: 24),
          Text(
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
        Icon(icon, color: Colors.red.shade700, size: 28),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white38, fontSize: 10)),
      ],
    );
  }
}
