import 'package:flutter/material.dart';
import 'package:trasmi/partes_estacion/pasarelas.dart';
import 'package:trasmi/partes_estacion/vagon.dart';

class vistaEsquema extends StatefulWidget {
  final int zona;
  final int numVagones;
  final String nombreEst;
  final Color colorEst;
  const vistaEsquema({
    super.key,
    required this.zona,
    required this.numVagones,
    required this.colorEst,
    required this.nombreEst,
  });

  @override
  State<vistaEsquema> createState() => _vistaEsquemaState();
}

class _vistaEsquemaState extends State<vistaEsquema> {
  ScrollController _controller = ScrollController();
  double _zoomLevel = 1.0; // Nivel inicial de zoom

  // Métodos para manejar el zoom
  void _zoomIn() {
    setState(() {
      _zoomLevel = (_zoomLevel + 0.1).clamp(0.5, 2.0); // Zoom máximo 2x, mínimo 0.5x
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel = (_zoomLevel - 0.1).clamp(0.5, 2.0);
    });
  }

  List<Widget> _Esquema() {
    List<Widget> esquema = [];
    for (int i = 0; i < widget.numVagones; i++) {
      // Padding para el primer y último vagón
      if (i == 0) {
        esquema.add(
          const Padding(
            padding: EdgeInsets.only(left: 30), // Padding izquierdo para el primer vagón
            child: Vagon(),
          ),
        );
      } else if (i == widget.numVagones - 1) {
        esquema.add(
          const Padding(
            padding: EdgeInsets.only(right: 30), // Padding derecho para el último vagón
            child: Vagon(),
          ),
        );
      } else {
        esquema.add(Vagon()); // Vagones intermedios sin padding especial
      }

      // Agregar pasarela si no es el último vagón
      if (i < widget.numVagones - 1) {
        esquema.add(Pasarelas());
      }
    }
    return esquema;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: widget.colorEst,
        titleSpacing: 0.0,
        title: Row(
          children: [
            Expanded(
              flex: 100, // Este ocupa el 95% del ancho
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    widget.nombreEst,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/imagenes/TransMilenio_Logo.png',
                height: 58,
                width: 58,
              ),
            ),
          ],
        ),
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 1.0),
          top: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      body: Stack(
        children: [
          // Contenedor para el esquema con zoom
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              child: Transform.scale(
                scale: _zoomLevel, // Aplicar nivel de zoom
                alignment: Alignment.center,
                child: Row(
                  children: _Esquema(),
                ),
              ),
            ),
          ),
          // Botones de zoom
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
