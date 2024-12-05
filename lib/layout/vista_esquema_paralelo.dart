import 'package:flutter/material.dart';
import 'package:trasmi/partes_estacion/pasarelas.dart';
import 'package:trasmi/partes_estacion/vagon.dart';

class vistaEsquemaParalelo extends StatefulWidget {
  final int zona;
  final int numVagones; // Debe ser 4 o 6
  final String nombreEst;
  final Color colorEst;

  const vistaEsquemaParalelo({
    super.key,
    required this.zona,
    required this.numVagones,
    required this.colorEst,
    required this.nombreEst,
  });

  @override
  State<vistaEsquemaParalelo> createState() => _vistaEsquemaParaleloState();
}

class _vistaEsquemaParaleloState extends State<vistaEsquemaParalelo> {
  ScrollController _controller = ScrollController();
  double _zoomLevel = 1.0; // Nivel inicial de zoom

  // Generar filas de vagones y pasarelas
  List<Widget> _buildFila(int start, int count) {
    List<Widget> fila = [];
    for (int i = start; i < start + count; i++) {
      // Padding izquierdo para el primer vagón de la fila
      if (i == start) {
        fila.add(
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Vagon(),
          ),
        );
      } else if (i == start + count - 1) {
        // Padding derecho para el último vagón de la fila
        fila.add(
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Vagon(),
          ),
        );
      } else {
        // Vagones intermedios sin padding especial
        fila.add(Vagon());
      }

      // Pasarelas entre vagones
      if (i < start + count - 1) {
        fila.add(Pasarelas());
      }
    }
    return fila;
  }

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

  @override
  Widget build(BuildContext context) {
    // Validar que numVagones sea 4 o 6
    assert(widget.numVagones == 4 || widget.numVagones == 6,
        'El número de vagones en paralelo debe ser 4 o 6.');

    int filaCount = widget.numVagones ~/ 2; // Dividir en dos filas

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: widget.colorEst,
        titleSpacing: 0.0,
        title: Row(
          children: [
            Expanded(
              flex: 100,
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    widget.nombreEst,
                    style: TextStyle(
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
        shape: Border(
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
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.scale(
                  scale: _zoomLevel, // Aplicar nivel de zoom
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Fila superior
                      Row(
                        children: _buildFila(0, filaCount),
                      ),
                      SizedBox(height: 20), // Espaciado entre filas
                      // Fila inferior
                      Row(
                        children: _buildFila(filaCount, filaCount),
                      ),
                    ],
                  ),
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
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: _zoomOut,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
