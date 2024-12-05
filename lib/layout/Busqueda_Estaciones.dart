import 'package:flutter/material.dart';
import 'package:trasmi/Estacion2.dart';
import 'package:trasmi/layout/controlador_esquema.dart';
import 'package:trasmi/layout/esquema_optimizado.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/layout/mapa_interactivo.dart';
import 'package:trasmi/layout/mapa_interactivo2.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';

class BusquedaEstaciones extends StatefulWidget {
  const BusquedaEstaciones({super.key});

  @override
  State<BusquedaEstaciones> createState() => _BusquedaState();
}

class _BusquedaState extends State<BusquedaEstaciones> {
  Future<List<Estacion2>> fetchEstaciones() async {
    const url = 'http://127.0.0.1:8080/estaciones2';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Estacion2.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las estaciones');
    }
  }


  Color Cambiocolor(String t) {
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

  TextEditingController _searchController = TextEditingController();

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
            ListTile(
              title: Text('Mapa Interactivo'),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MapaInteractivo(num: 1)));
              },
            ),
            ListTile(
              title: Text('Mapa Interactivo BETA'),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => mapaInteractivo2(num: 1)));
              },
            ),
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
              Colors.black.withOpacity(0.5), // Ajusta el nivel de opacidad aquí
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 60, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 49,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1.0),
                        top: BorderSide(color: Colors.black, width: 1.0),
                        left: BorderSide(color: Colors.black, width: 1.0),
                        right: BorderSide(color: Colors.black, width: 1.0)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Center(
                    child: Text('Visualizar esquema',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.0),
                          top: BorderSide(color: Colors.black, width: 1.0),
                          left: BorderSide(color: Colors.black, width: 1.0),
                          right: BorderSide(color: Colors.black, width: 1.0)),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Container(
                                      width: 250,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          'Seleccione la estación',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        80, 20, 80, 10),
                                    child: TextField(
                                        controller: _searchController,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: 'Buscar',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                  Image.asset(
                                    'assets/imagenes/Bustm.png',
                                    width: 300,
                                    height: 280,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              Container(width: 500, child: Align(alignment: Alignment.topRight, child: IconButton(onPressed: (){/* TO DO*/}, icon: Icon(Icons.filter_list)))),
                              Container(
                                height: 400,
                                width: 500,
                                child: FutureBuilder<List<Estacion2>>(
                                  future: fetchEstaciones(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error: ${snapshot.error}'),
                                      );
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Center(
                                        child:
                                            Text('No hay estaciones disponibles.'),
                                      );
                                    } else{
                                      List<Estacion2> filteredEstaciones = snapshot
                                          .data!
                                          .where((estacion) => estacion.nombre
                                              .toLowerCase()
                                              .contains(_searchController.text
                                                  .toLowerCase()))
                                          .toList();
                                      return ListView.builder(
                                        itemCount: filteredEstaciones.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContEsq(
                                                            zona:
                                                              filteredEstaciones[index].zona.toInt(),
                                                            nombreEst:
                                                                '${filteredEstaciones[index].nombre}',
                                                            colorEst: Cambiocolor(
                                                                '${filteredEstaciones[index].troncal}'), 
                                                            numVagones: 
                                                                filteredEstaciones[index].numVagones.toInt(), 
                                                            secuencia: '${filteredEstaciones[index].secuencia}',
                                                          )));
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Cambiocolor(
                                                            '${filteredEstaciones[index].troncal}')
                                                        .withOpacity(0.5),
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.black,
                                                          width: 1.0),
                                                      top: BorderSide(
                                                          color: Colors.black,
                                                          width: 1.0),
                                                      left: BorderSide(
                                                          color: Colors.black,
                                                          width: 1.0),
                                                      right: BorderSide(
                                                          color: Colors.black,
                                                          width: 1.0),
                                                    ),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                height: 70,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(left: 39),
                                                            child: Container(
                                                              width: 35,
                                                              height: 35,
                                                              color: Cambiocolor(
                                                                  '${filteredEstaciones[index].troncal}'),
                                                              child: Center(
                                                                child: Text(
                                                                  '${filteredEstaciones[index].troncal}',
                                                                  style: TextStyle(
                                                                      fontSize: 20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 350,
                                                            child: Center(
                                                              child: Text(
                                                                '${filteredEstaciones[index].nombre}',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                              '${filteredEstaciones[index].zona}')
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              0, 5, 0, 0),
                                                      child: Container(
                                                        height: 18,
                                                        decoration: BoxDecoration(
                                                            color: Cambiocolor(
                                                                '${filteredEstaciones[index].troncal}'),
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight: Radius
                                                                        .circular(
                                                                            10))),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          );
                                        },
                                      );
                                    } 
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
