import 'package:flutter/material.dart';
import 'package:trasmi/layout/busqueda_estaciones.dart';
import 'package:trasmi/layout/vista_Editor.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController usuario = TextEditingController();


void mostrarToast(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(mensaje),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
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
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.0),
                      top: BorderSide(color: Colors.black, width: 1.0),
                      left: BorderSide(color: Colors.black, width: 1.0),
                      right: BorderSide(color: Colors.black, width: 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 227, 27, 35),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Bienvenido",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/imagenes/user.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      controller: usuario,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Usuario',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Tooltip(
                      message: 'En usuario: 1 para la vista normal, 2 vista de editor',
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 227, 27, 35)),
                              minimumSize:
                                  MaterialStatePropertyAll(Size(150, 50))),
                          onPressed: () {
                            String userValue = usuario.text;
                      
                            // Verificar el valor del usuario y realizar la navegación
                            if (userValue == "1") {
                              // Navegar a la vista X
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BusquedaEstaciones(),
                                ),
                              );
                            } else if (userValue == "2") {
                              // Navegar a la otra vista
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => menuEditor(),
                                ),
                              );
                            } else {
                              mostrarToast(context, "ingresa '1' o '2' en usuario");
                            }
                          },
                          child: Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
