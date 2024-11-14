// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trasmi/layout/Busqueda_Estaciones.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/estacion.dart';
import 'package:trasmi/layout/vista_Editor.dart';
import 'package:trasmi/layout/widget_estaciones.dart';

class MapaInteractivo extends StatefulWidget {
  final num;
  const MapaInteractivo({super.key, required this.num});

  @override
  State<MapaInteractivo> createState() => _MapaInteractivoState();
}

class _MapaInteractivoState extends State<MapaInteractivo> {

  



  late int numVista;

  @override
  void initState() {
    super.initState();
    numVista = widget.num;
  }

  Future<List<Estacion>> fetchEstaciones() async {
    const url = 'http://127.0.0.1:5000/estaciones';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Estacion.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las estaciones');
    }
  }

  Widget vista1o2(int num) {
    if (num == 1) {
      return ListTile(
        title: Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BusquedaEstaciones()));
        },
      );
    }else if(num == 2){
      return ListTile(
        title: Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => menuEditor()));
        },
      );
    }else{
      return Container();
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 227, 27, 35),
        titleSpacing: 0.0,
        title: Row(
          children: [
            Expanded(
              flex: 100, // Este ocupa el 95% del ancho
              child: Container(
                //color: Colors.green,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    'Sistema de gestión de esquemas de estaciones',
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
                //color: Colors.blue,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/imagenes/TransMilenio_Logo.png',
                  height: 58,
                  width: 58,
                )),
          ],
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.black, width: 1.0),
            top: BorderSide(color: Colors.black, width: 1.0)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        // Contenido del Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 27, 35),
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            vista1o2(numVista),
            ListTile(
              title: Text('Cerrar sesion'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
            ),

            // Agrega más opciones según sea necesario
          ],
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/imagenes/Trasmi.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black
                    .withOpacity(0.5), // Ajusta el nivel de opacidad aquí
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1.0),
                        top: BorderSide(color: Colors.black, width: 1.0),
                        left: BorderSide(color: Colors.black, width: 1.0),
                        right: BorderSide(color: Colors.black, width: 1.0)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                      //'assets/imagenes/MapaTrasmi2.jpg'
                      //'assets/imagenes/mapaTrasmi.png'
                        image: AssetImage('assets/imagenes/mapaTrasmi.png'),
                        //fit: BoxFit.cover
                        )),
                    child: CustomPaint(
                      //painter: MyPainter(),
                    ),
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.768,
                  top: MediaQuery.of(context).size.height * 0.022,
                  child: Tooltip(
                    message: "Estaciones 144/144",
                    child: Container(
                      width: 52,
                      height: 53,
                      //color: Colors.amber,
                    ),
                  )),
              //--------------------------------------------------- Troncal norte ----------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.046,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Terminal', colEst: cambiocolor("B"),
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.073,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 187', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.095,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal del Norte', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.111,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Toberin', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.125,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Cardio\nInfantil', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.14,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Mazuren', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.155,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 146', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.169,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 142', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.185,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Alcalá', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.198,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Prado', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.212,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 127', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.227,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Pepe \nSierra', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.242,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 106', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.256,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 100', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.279,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Virrey', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.292,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 85', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.307,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Héroes', colEst: cambiocolor("B")
                  )),
              //---------------------------------------------- Troncal Caracas --------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.34,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 76', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.36,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 72', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.375,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Flores', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.389,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 63', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.404,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 57', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.418,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Marly', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.432,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 45', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.448,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida 39', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Profamilia', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.477,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 26', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.51,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 22', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.522,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 19', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.543,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida Jimenez A', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.554,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Tercer\nMilenio', colEst: cambiocolor("A")
                  )),
              //--------------------------------------------- Troncal Caracas Sur -------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.585,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Hospital', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.6,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Hortua', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.616,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Nariño', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.635,
                  top: MediaQuery.of(context).size.height * 0.222,
                  child: EstacionMapa(
                    nombreEstacion: 'Fucha', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.649,
                  top: MediaQuery.of(context).size.height * 0.249,
                  child: EstacionMapa(
                    nombreEstacion: 'Restrepo', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.66,
                  top: MediaQuery.of(context).size.height * 0.27,
                  child: EstacionMapa(
                    nombreEstacion: 'Olaya', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.673,
                  top: MediaQuery.of(context).size.height * 0.295,
                  child: EstacionMapa(
                    nombreEstacion: 'Quiroga', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.685,
                  top: MediaQuery.of(context).size.height * 0.32,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 40 S', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.698,
                  top: MediaQuery.of(context).size.height * 0.347,
                  child: EstacionMapa(
                    nombreEstacion: 'Santa Lucia', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.725,
                  top: MediaQuery.of(context).size.height * 0.363,
                  child: EstacionMapa(
                    nombreEstacion: 'Socorro', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.741,
                  top: MediaQuery.of(context).size.height * 0.363,
                  child: EstacionMapa(
                    nombreEstacion: 'Consuelo', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.759,
                  top: MediaQuery.of(context).size.height * 0.363,
                  child: EstacionMapa(
                    nombreEstacion: 'Molinos', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.781,
                  top: MediaQuery.of(context).size.height * 0.363,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal Usme', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.725,
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: EstacionMapa(
                    nombreEstacion: 'Biblioteca', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.737,
                  top: MediaQuery.of(context).size.height * 0.422,
                  child: EstacionMapa(
                    nombreEstacion: 'Parque', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.742,
                  top: MediaQuery.of(context).size.height * 0.485,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal Tunal', colEst: cambiocolor("H")
                  )),
              //-------------------------------------------------------------- Troncal NQS -----------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.269,
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: EstacionMapa(
                    nombreEstacion: 'La Castellana', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.341,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'NQS Calle 75', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.362,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida Chile', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.362,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida Chile', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.382,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Simon Bolivar', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.402,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Coliseo', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.423,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Campin -\nU. Antonio Nariño', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.441,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'U. Nacional', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.464,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'AV. El \nDorado', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.506,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'CAD', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.523,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Paloquemao', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.543,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Ricaurte E', colEst: cambiocolor("B")
                  )),
              //------------------------------------------------------- Troncal sur -------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.58,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Comuneros', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.596,
                  top: MediaQuery.of(context).size.height * 0.38,
                  child: EstacionMapa(
                    nombreEstacion: 'Santa isabel', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.614,
                  top: MediaQuery.of(context).size.height * 0.394,
                  child: EstacionMapa(
                    nombreEstacion: 'SENA', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.625,
                  top: MediaQuery.of(context).size.height * 0.418,
                  child: EstacionMapa(
                    nombreEstacion: 'NQS-CL 30 S.', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.638,
                  top: MediaQuery.of(context).size.height * 0.44,
                  child: EstacionMapa(
                    nombreEstacion: 'NQS-CL 38A S.', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.65,
                  top: MediaQuery.of(context).size.height * 0.463,
                  child: EstacionMapa(
                    nombreEstacion: 'General Santander', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.48,
                  child: EstacionMapa(
                    nombreEstacion: 'Alqueria', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.501,
                  child: EstacionMapa(
                    nombreEstacion: 'Venecia', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.535,
                  child: EstacionMapa(
                    nombreEstacion: 'Sevillana', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.57,
                  child: EstacionMapa(
                    nombreEstacion: 'Madelena', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.605,
                  child: EstacionMapa(
                    nombreEstacion: 'Perdomo', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.658,
                  top: MediaQuery.of(context).size.height * 0.638,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal Del Sur', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.672,
                  top: MediaQuery.of(context).size.height * 0.69,
                  child: EstacionMapa(
                    nombreEstacion: 'Bosa', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.69,
                  top: MediaQuery.of(context).size.height * 0.727,
                  child: EstacionMapa(
                    nombreEstacion: 'La Despensa', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.705,
                  top: MediaQuery.of(context).size.height * 0.757,
                  child: EstacionMapa(
                    nombreEstacion: 'Leon XIII', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.718,
                  top: MediaQuery.of(context).size.height * 0.781,
                  child: EstacionMapa(
                    nombreEstacion: 'Terreros Hospital C.V.', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.732,
                  top: MediaQuery.of(context).size.height * 0.811,
                  child: EstacionMapa(
                    nombreEstacion: 'San Mateo', colEst: cambiocolor("B")
                  )),
              //--------------------------------------------------------------------- Troncal 80 ------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.325,
                  top: MediaQuery.of(context).size.height * 0.303,
                  child: EstacionMapa(
                    nombreEstacion: 'POLO', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.29,
                  top: MediaQuery.of(context).size.height * 0.395,
                  child: EstacionMapa(
                    nombreEstacion: 'Esc Militar', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.278,
                  top: MediaQuery.of(context).size.height * 0.42,
                  child: EstacionMapa(
                    nombreEstacion: 'Carrera 47', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.264,
                  top: MediaQuery.of(context).size.height * 0.449,
                  child: EstacionMapa(
                    nombreEstacion: 'Carrera 53', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.252,
                  top: MediaQuery.of(context).size.height * 0.473,
                  child: EstacionMapa(
                    nombreEstacion: 'AV 68', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.24,
                  top: MediaQuery.of(context).size.height * 0.496,
                  child: EstacionMapa(
                    nombreEstacion: 'Ferias', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.228,
                  top: MediaQuery.of(context).size.height * 0.52,
                  child: EstacionMapa(
                    nombreEstacion: 'Boyaca', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.557,
                  child: EstacionMapa(
                    nombreEstacion: 'Minuto De Dios', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.586,
                  child: EstacionMapa(
                    nombreEstacion: 'Granja - Carrera 77', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.616,
                  child: EstacionMapa(
                    nombreEstacion: 'AV Cali', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.647,
                  child: EstacionMapa(
                    nombreEstacion: 'Carrera 90', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.677,
                  child: EstacionMapa(
                    nombreEstacion: 'Quirigua', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.218,
                  top: MediaQuery.of(context).size.height * 0.709,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal 80', colEst: cambiocolor("B")
                  )),
              //----------------------------------------------------------------------- Troncal Suba ---------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'San Martin', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.249,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'Rio Negro', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.233,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'Suba - CL 45', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.216,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'Suba - CL 100', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.199,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'Puentelargo', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.183,
                  top: MediaQuery.of(context).size.height * 0.381,
                  child: EstacionMapa(
                    nombreEstacion: 'Shaio', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.165,
                  top: MediaQuery.of(context).size.height * 0.396,
                  child: EstacionMapa(
                    nombreEstacion: 'Humedal Cordoba', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.155,
                  top: MediaQuery.of(context).size.height * 0.42,
                  child: EstacionMapa(
                    nombreEstacion: 'Niza - CL 127', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.142,
                  top: MediaQuery.of(context).size.height * 0.442,
                  child: EstacionMapa(
                    nombreEstacion: 'Suba - AV. Boyaca', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.138,
                  top: MediaQuery.of(context).size.height * 0.467,
                  child: EstacionMapa(
                    nombreEstacion: 'Gratamira', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.138,
                  top: MediaQuery.of(context).size.height * 0.498,
                  child: EstacionMapa(
                    nombreEstacion: '21 Angeles', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.138,
                  top: MediaQuery.of(context).size.height * 0.528,
                  child: EstacionMapa(
                    nombreEstacion: 'Suba - TV 91', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.138,
                  top: MediaQuery.of(context).size.height * 0.557,
                  child: EstacionMapa(
                    nombreEstacion: 'la Campiña', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.138,
                  top: MediaQuery.of(context).size.height * 0.586,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal De Suba', colEst: cambiocolor("B")
                  )),
              //------------------------------------------------------------- Troncal el Dorado ---------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.491,
                  top: MediaQuery.of(context).size.height * 0.008,
                  child: EstacionMapa(
                    nombreEstacion: 'Universidades', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.491,
                  top: MediaQuery.of(context).size.height * 0.278,
                  child: EstacionMapa(
                    nombreEstacion: 'Centro Memoria', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.491,
                  top: MediaQuery.of(context).size.height * 0.325,
                  child: EstacionMapa(
                    nombreEstacion: 'Plaza De La Democracia', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.464,
                  top: MediaQuery.of(context).size.height * 0.445,
                  child: EstacionMapa(
                    nombreEstacion: 'Ciudad Universitaria', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.45,
                  top: MediaQuery.of(context).size.height * 0.482,
                  child: EstacionMapa(
                    nombreEstacion: 'Corferias', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.435,
                  top: MediaQuery.of(context).size.height * 0.519,
                  child: EstacionMapa(
                    nombreEstacion: 'Quinta Paredes', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.552,
                  child: EstacionMapa(
                    nombreEstacion: 'Gobernacion', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.589,
                  child: EstacionMapa(
                    nombreEstacion: 'CAN', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.626,
                  child: EstacionMapa(
                    nombreEstacion: 'Salitre El Greco', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.665,
                  child: EstacionMapa(
                    nombreEstacion: 'El Tiempo Maloka', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.702,
                  child: EstacionMapa(
                    nombreEstacion: 'AV Rojas', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.738,
                  child: EstacionMapa(
                    nombreEstacion: 'Normandia', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.775,
                  child: EstacionMapa(
                    nombreEstacion: 'Modelia', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.424,
                  top: MediaQuery.of(context).size.height * 0.818,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal El Dorado', colEst: cambiocolor("B")
                  )),
              //------------------------------------------------------------------------- Centro ---------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.502,
                  top: MediaQuery.of(context).size.height * 0.008,
                  child: EstacionMapa(
                    nombreEstacion: 'Las Aguas', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.525,
                  top: MediaQuery.of(context).size.height * 0.053,
                  child: EstacionMapa(
                    nombreEstacion: 'Museo Del Oro', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.202,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida Jimenez J', colEst: cambiocolor("B")
                  )),
              //----------------------------------------------------------------------- Troncal Americas -------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.275,
                  child: EstacionMapa(
                    nombreEstacion: 'De La Sabana', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.32,
                  child: EstacionMapa(
                    nombreEstacion: 'San Facon - KR 22', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.365,
                  child: EstacionMapa(
                    nombreEstacion: 'Ricaurte F', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.431,
                  child: EstacionMapa(
                    nombreEstacion: 'CDS - Carrera 32', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.458,
                  child: EstacionMapa(
                    nombreEstacion: 'Zona Industrial', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.485,
                  child: EstacionMapa(
                    nombreEstacion: 'Carrera 43', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.535,
                  top: MediaQuery.of(context).size.height * 0.515,
                  child: EstacionMapa(
                    nombreEstacion: 'Puente Aranda', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.542,
                  top: MediaQuery.of(context).size.height * 0.544,
                  child: EstacionMapa(
                    nombreEstacion: 'Americas -KR 53A', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.555,
                  top: MediaQuery.of(context).size.height * 0.571,
                  child: EstacionMapa(
                    nombreEstacion: 'Pradera', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.57,
                  top: MediaQuery.of(context).size.height * 0.598,
                  child: EstacionMapa(
                    nombreEstacion: 'Marsella', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.581,
                  top: MediaQuery.of(context).size.height * 0.622,
                  child: EstacionMapa(
                    nombreEstacion: 'Mundo Aventura', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.595,
                  top: MediaQuery.of(context).size.height * 0.65,
                  child: EstacionMapa(
                    nombreEstacion: 'Mandalay', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.6,
                  top: MediaQuery.of(context).size.height * 0.682,
                  child: EstacionMapa(
                    nombreEstacion: 'Banderas', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.6,
                  top: MediaQuery.of(context).size.height * 0.717,
                  child: EstacionMapa(
                    nombreEstacion: 'Transversal 86', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.602,
                  top: MediaQuery.of(context).size.height * 0.75,
                  child: EstacionMapa(
                    nombreEstacion: 'Biblioteca Tintal', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.621,
                  top: MediaQuery.of(context).size.height * 0.75,
                  child: EstacionMapa(
                    nombreEstacion: 'Patio Bonito', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.641,
                  top: MediaQuery.of(context).size.height * 0.75,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal Americas', colEst: cambiocolor("B")
                  )),
              //---------------------------------------------------------------- Troncal 20 de julio -----------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.473,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Museo Nacional', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.5,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'San Diego', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.521,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Las Nieves', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.543,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'San Victorino', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.579,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Bicentenario', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.592,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Hospitales', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.612,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Policarpa', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.629,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Ciudad Jardin UAN', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.649,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'AV. 1 Mayo', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.666,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Country Sur', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.688,
                  top: MediaQuery.of(context).size.height * 0.108,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal 20 De Julio', colEst: cambiocolor("A")
                  )),
              //------------------------------------------------------------------------ ?? --------------------------------------------------
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.569,
                  top: MediaQuery.of(context).size.height * 0.324,
                  child: EstacionMapa(
                    nombreEstacion: 'Guatoque - Veraguas', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.569,
                  top: MediaQuery.of(context).size.height * 0.272,
                  child: EstacionMapa(
                    nombreEstacion: 'Tygua - San Jose', colEst: cambiocolor("B")
                  )),   
            ]),
          )),
    );
  }
}

/* class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width*0.058,size.height*0.375)
      ..lineTo(size.width*0.417, size.height*0.227)
      ..lineTo(size.width*0.419,size.height*0.235)
      
      ..lineTo(size.width*0.061,size.height*0.3819)

      ..close();
    
    /* final radians = 20 * (pi / 180); // Convertir grados a radianes
    final rotationMatrix = Matrix4.rotationZ(radians);
    canvas.transform(rotationMatrix.storage); */

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
} */
