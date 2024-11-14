import 'package:flutter/material.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';

class widgetEst2 extends StatelessWidget {
  final estacion;
  final color;
  const widgetEst2({super.key, required this.estacion, required this.color});

  Color cambiocolor(String t) {
    switch (t) {
      case "A":
        return Color.fromARGB(255, 32, 65, 154);

      case "B":
        return Color.fromARGB(255, 122, 193, 67);

      case "C":
        return Color.fromARGB(255, 253, 187, 48);

      case "D":
        return Color.fromARGB(255, 122, 104, 174);

      case "E":
        return Color.fromARGB(255, 171, 101, 13);

      case "F":
        return Color.fromARGB(255, 227, 27, 35);

      case "G":
        return Color.fromARGB(255, 0, 164, 228);

      case "H":
        return Color.fromARGB(255, 246, 137, 31);

      case "J":
        return Color.fromARGB(255, 221, 155, 165);

      case "K":
        return Color.fromARGB(255, 207, 171, 122);

      case "L":
        return Color.fromARGB(255, 0, 170, 166);

      case "M":
        return Color.fromARGB(255, 162, 25, 132);
      default:
        return Colors.grey;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => visualizarEsquema(
                    nombreEst: estacion, colorEst: cambiocolor(color))));
      },
      child: Container(
        child: Tooltip(
          message: estacion,
          preferBelow: false,
          textStyle: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
                bottom: BorderSide(color: Colors.black, width: 1.0),
                top: BorderSide(color: Colors.black, width: 1.0),
                left: BorderSide(color: Colors.black, width: 1.0),
                right: BorderSide(color: Colors.black, width: 1.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // Cambia la sombra del tooltip
              ),
            ],
          ),
          child: Icon(Icons.location_on, size: 20, color: cambiocolor(color)),
        ),
      ),
    ));
  }
}
