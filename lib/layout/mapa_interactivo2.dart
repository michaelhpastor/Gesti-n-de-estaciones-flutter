import 'package:flutter/material.dart';
import 'package:trasmi/estacion2.dart';
import 'package:trasmi/layout/Busqueda_Estaciones.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/layout/vista_Editor.dart';
import 'package:trasmi/layout/widget_estacion2.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapaInteractivo2 extends StatefulWidget {
  final num;
  const mapaInteractivo2({super.key, required this.num});

  @override
  State<mapaInteractivo2> createState() => _mapaInteractivo2State();
}

class _mapaInteractivo2State extends State<mapaInteractivo2> {
  late int numVista;

  @override
  void initState() {
    super.initState();
    numVista = widget.num;
  }

  Future<List<Estacion2>> fetchEstaciones2() async {
    const url = 'http://127.0.0.1:8080/estaciones2';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(
          'Estaciones cargadas correctamente'); // Verifica si los datos se cargan
      return data.map((json) => Estacion2.fromJson(json)).toList();
    } else {
      print('Error al cargar las estaciones: ${response.statusCode}');
      throw Exception('Error al cargar las estaciones');
    }
  }

  Widget vista1o2(int num) {
    if (num == 1) {
      return ListTile(
        title: const Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BusquedaEstaciones()));
        },
      );
    } else if (num == 2) {
      return ListTile(
        title: const Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => menuEditor()));
        },
      );
    } else {
      return Container();
    }
  }

  Color cambiocolor(String t) {
    switch (t) {
      case "A":
        return const Color.fromARGB(255, 32, 65, 154);

      case "B":
        return const Color.fromARGB(255, 122, 193, 67);

      case "C":
        return const Color.fromARGB(255, 253, 187, 48);

      case "D":
        return const Color.fromARGB(255, 122, 104, 174);

      case "E":
        return const Color.fromARGB(255, 171, 101, 13);

      case "F":
        return const Color.fromARGB(255, 227, 27, 35);

      case "G":
        return const Color.fromARGB(255, 0, 164, 228);

      case "H":
        return const Color.fromARGB(255, 246, 137, 31);

      case "J":
        return const Color.fromARGB(255, 221, 155, 165);

      case "K":
        return const Color.fromARGB(255, 207, 171, 122);

      case "L":
        return const Color.fromARGB(255, 0, 170, 166);

      case "M":
        return const Color.fromARGB(255, 162, 25, 132);
      default:
        return Colors.grey;
    }
  }

  final myPosition = const LatLng(4.65, -74.12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 227, 27, 35),
          titleSpacing: 0.0,
          title: Row(
            children: [
              Expanded(
                flex: 100, // Este ocupa el 95% del ancho
                child: Container(
                  //color: Colors.green,
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
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
          shape: const Border(
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
                child: const DrawerHeader(
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
                title: const Text('Cerrar sesion'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LogIn()));
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
              image: const AssetImage(
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
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<Estacion2>>(
                    future: fetchEstaciones2(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No se encontraron estaciones'));
                      } else {
                        // Si se cargan correctamente las estaciones, creamos los marcadores
                        List<Marker> markers = snapshot.data!.map((estacion) {
                          return Marker(
                            point: LatLng(
                              estacion.latitud ,estacion.longitud 
                            ),
                            rotate: true,
                            child: widgetEst2(
                              zona: estacion.zona,
                              estacion: estacion.nombre,
                              color: estacion.troncal,
                              numVagones: estacion.numVagones.toInt(),
                              secuencia: estacion.secuencia
                            ),
                          );
                        }).toList();

                        return FlutterMap(
                          options: MapOptions(
                            initialCenter: myPosition,
                            minZoom: 5,
                            maxZoom: 25,
                            initialZoom: 12,
                            initialRotation: 270,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: const ['a', 'b', 'c'],
                            ),
                            MarkerLayer(markers: markers),
                          ],
                        );
                      }
                    }),
              )),
        ));
  }
}
