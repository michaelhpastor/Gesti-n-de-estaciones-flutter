import 'package:flutter/material.dart';
import 'package:trasmi/layout/editar_esquema.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/estacion.dart';
import 'package:trasmi/layout/mapa_interactivo.dart';
import 'package:trasmi/layout/mapa_interactivo2.dart';

class menuEditor extends StatefulWidget {
  const menuEditor({super.key});

  @override
  State<menuEditor> createState() => _menuEditorState();
}

class _menuEditorState extends State<menuEditor> {

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


  Color Cambiocolor(String t){

    switch(t){
      case "A":
        return Color.fromARGB(255, 32, 65, 154);

      case "B":
        return Color.fromARGB(255, 122, 193, 167);

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
            ListTile(
              title: Text('Mapa interactivo'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MapaInteractivo(num: 2,)));
              },
            ),
             ListTile(
              title: Text('Mapa Interactivo BETA'),
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => mapaInteractivo2(num: 2)));
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
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 1.2)/4,
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 1.2)/4,
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                              top: BorderSide(color: Colors.black, width: 1.0),
                              left: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Center(
                          child: Text('Editar Esquemas',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 1.2)/4,
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                              top: BorderSide(color: Colors.black, width: 1.0),
                              left: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Center(
                          child: Text('Visualizar matriz de distancia',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 1.2)/4,
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                              top: BorderSide(color: Colors.black, width: 1.0),
                              left: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Center(
                          child: Text('Visualizar BH',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
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
                          child: Container(
                            height: 400,
                            width: 500,
                            child: FutureBuilder<List<Estacion>>(
                              future: fetchEstaciones(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push( context,
                                            MaterialPageRoute(
                                              builder: (context) => editarEsquema()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Cambiocolor('${snapshot.data![index].troncal}').withOpacity(0.5),
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
                                                        width: 1.0),),
                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            height: 70,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 39),
                                                        child: Container(
                                                          width: 35,
                                                          height: 35,
                                                          color: Cambiocolor('${snapshot.data![index].troncal}'),
                                                          child: Center(
                                                            child: Text(
                                                                '${snapshot.data![index].troncal}',
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white
                                                                ),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 350,
                                                        child: Center(
                                                          child: Text(
                                                              '${snapshot.data![index].nombre}',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold
                                                              ),
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                          '${snapshot.data![index].ubicacion}')
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                  child: Container(
                                                      height: 18,  
                                                      decoration: BoxDecoration(
                                                        color: Cambiocolor('${snapshot.data![index].troncal}'),
                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                                      ),
                                                      ),
                                                )
                                              ],
                                            )),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
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
