import 'package:flutter/material.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';

class EstacionMapa extends StatefulWidget {
  final nombreEstacion;
  const EstacionMapa({super.key, required this.nombreEstacion});

  @override
  State<EstacionMapa> createState() => _EstacionMapaState();
}

class _EstacionMapaState extends State<EstacionMapa> {

  late String nombreEst;

  @override
  void initState() {
    super.initState();
    nombreEst = widget.nombreEstacion;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>visualizarEsquema(nombreEst: nombreEst, colorEst: Colors.red)));
      },
      child: Tooltip(
        message: nombreEst,
        child: Container(
          width: 10,
          height: 10,
          color: Colors.amber,   
        ),
      ),
    );
  }
}