import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trasmi/layout/busqueda_estaciones.dart';
import 'package:trasmi/layout/esquema_optimizado.dart';
import 'package:trasmi/layout/layout.dart';
import 'package:trasmi/layout/login.dart';
import 'package:trasmi/layout/mapa_interactivo.dart';
import 'package:trasmi/layout/mapa_interactivo2.dart';
import 'package:trasmi/layout/vista_Editor.dart';
import 'package:desktop_window/desktop_window.dart';

//todo widget tiene un metodo build, los widget son CLASES
//que sea el padre la const
// ctrl + punto
// ctrl + space
void main() { 
  runApp(const MyApp());
  setMinWindowSize();
}

void setMinWindowSize() async {
  await DesktopWindow.setMinWindowSize(Size(800, 600));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse},),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Definir la ruta inicial
      routes: {
        '/': (BuildContext context) => const LogIn(),
        '/busqueda': (BuildContext context) => const BusquedaEstaciones(),
        '/editor': (BuildContext context) => const menuEditor(),
        '/vista_esquemas': (BuildContext context) => const vistaEsquema(),
        '/mapa_interactivo': (BuildContext context) => const MapaInteractivo(num: 1),
        '/mapa_interactivo2': (BuildContext context) => const mapaInteractivo2(num: 1)
      },
    );
  }
}