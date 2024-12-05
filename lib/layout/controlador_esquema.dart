import 'package:flutter/material.dart';
import 'package:trasmi/layout/esquema_optimizado.dart';
import 'vista_esquema_paralelo.dart';

class ContEsq extends StatelessWidget {
  final int zona;
  final String nombreEst;
  final Color colorEst;
  final int numVagones;
  final String secuencia; // "serie" o "paralelo"

  const ContEsq({super.key,required this.zona, required this.nombreEst, required this.colorEst, required this.numVagones, required this.secuencia});

  @override
  Widget build(BuildContext context) {
    // Redirige según el tipo de estación
    if (secuencia == "SERIE") {
      return vistaEsquema(zona: zona, nombreEst: nombreEst, numVagones: numVagones,  colorEst: colorEst,);
    } else if (secuencia == "PARALELO") {
      return vistaEsquemaParalelo(numVagones: numVagones*2, zona: zona, colorEst: colorEst, nombreEst: nombreEst);
    } else {
      return vistaEsquema(zona: zona, nombreEst: nombreEst, numVagones: numVagones,  colorEst: colorEst,);
    }
  }
}
