import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';

class EstacionMapa extends StatefulWidget {
  final String nombreEstacion;
  final Color colEst;
  const EstacionMapa(
      {super.key, required this.nombreEstacion, required this.colEst});

  @override
  State<EstacionMapa> createState() => _EstacionMapaState();
}

class _EstacionMapaState extends State<EstacionMapa> {
  late String nombreEst;
  late Color colEst;



  @override
  void initState() {
    super.initState();
    nombreEst = widget.nombreEstacion;
    colEst = widget.colEst;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.purple,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => visualizarEsquema(
                      nombreEst: nombreEst,
                      colorEst: colEst,
                    )));
      },
      child: Tooltip(
        message: nombreEst,
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
            right: BorderSide(color: Colors.black, width: 1.0)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Cambia la sombra del tooltip
            ),
          ],
        ),
        child: Container(
          width: 10,
          height: 10,
          //color: Colors.amber,
        ),
      ),
    );
  }
}
