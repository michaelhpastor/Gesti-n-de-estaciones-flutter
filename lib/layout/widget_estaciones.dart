import 'package:flutter/material.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';

class EstacionMapa extends StatefulWidget {
  final String nombreEstacion;
  final Color colEst;
  const EstacionMapa({super.key, required this.nombreEstacion, required this.colEst});

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
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>visualizarEsquema(nombreEst: nombreEst, colorEst: colEst,)));
      },
      child: Tooltip(
        message: nombreEst,
        child: Container(
          width: 10,
          height: 10,
          //color: Colors.amber,   
        ),
      ),
    );
  }
}