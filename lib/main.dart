import 'package:flutter/material.dart';
import 'package:trasmi/layout/busqueda_estaciones.dart';
import 'package:trasmi/layout/login.dart';
import 'package:trasmi/layout/vista_Editor.dart';

//todo widget tiene un metodo build, los widget son CLASES
//que sea el padre la const
// ctrl + punto
// ctrl + space
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Definir la ruta inicial
      routes: {
        '/': (BuildContext context) => const LogIn(),
        '/busqueda': (BuildContext context) => const BusquedaEstaciones(),
        '/editor': (BuildContext context) => const menuEditor(),
      },
    );
  }
}