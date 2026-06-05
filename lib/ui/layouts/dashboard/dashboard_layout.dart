// dashboard_layout.dart es el layout principal de la aplicación,
// que se encarga de mostrar la barra lateral (Sidebar) y la barra de navegación 
//(Navbar) en todas las páginas del dashboard. El widget hijo (child) se muestra debajo de la Navbar
// y al lado de la Sidebar, dependiendo del tamaño de la pantalla. Si el tamaño de la pantalla
// es menor a 700 píxeles, la Sidebar se oculta y se muestra un botón en la Navbar para abrirla.
//otron archgivo para que sea responsivo y se adapte a diferentes tamaños de pantalla. 
//Además, utiliza un AnimationController para animar la apertura y cierre de la Sidebar en pantallas 
//pequeñas. para el suido de la barra lateral (Sidebar) y la barra de navegación (Navbar) 
//en todas las páginas del dashboard.
import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/ui/shared/navbar.dart';
import 'package:e301_login/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SidemenuProvider.menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    Navbar(),
                    SizedBox(height: 10), // Agrega un espacio entre la Navbar y el contenido
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SidemenuProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  Transform.translate(
                    offset: Offset(SidemenuProvider.movement.value, 0),
                    child: Sidebar(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}