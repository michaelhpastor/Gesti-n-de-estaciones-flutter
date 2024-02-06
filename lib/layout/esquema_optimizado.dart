import 'package:flutter/material.dart';

class vistaEsquema extends StatefulWidget {
  const vistaEsquema({super.key});

  @override
  State<vistaEsquema> createState() => _vistaEsquemaState();
}

class _vistaEsquemaState extends State<vistaEsquema> {
  ScrollController _controller = ScrollController();

  Widget salidasEstacion(String salida, String orient) {
    if (orient == 'izq') {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: Container(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 15,
                color: Colors.yellow,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child:
                          Image.asset('assets/imagenes/triangulo_salida20.png'),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Salida',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text('/')),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Exit',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 18,
                color: Colors.black,
                child: Center(
                  child: Text(
                    salida,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else if (orient == 'der') {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: Container(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 15,
                color: Colors.yellow,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Salida',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text('/')),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Exit',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                          'assets/imagenes/triangulo_salida_derecha20.png'),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 18,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Calle 37',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget busesHora(int numeroBuses) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.black, width: 1.0),
                top: BorderSide(color: Colors.black, width: 1.0),
                left: BorderSide(color: Colors.black, width: 1.0),
                right: BorderSide(color: Colors.black, width: 1.0)),
          ),
          child: Center(child: Text(numeroBuses.toString()))),
    );
  }

  /* Widget vagonEstacion(int numeroRutas, List busesh) {
    Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 5.0),
          top: BorderSide(color: Colors.grey, width: 5.0),
        ),
      ),
      child: Column(
        children: [
          //am pm rutas superiores
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey, width: 5.0),
                  right: BorderSide(color: Colors.grey, width: 5.0)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('AM'), Text('PM')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 43, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        busesHora(10),
                        busesHora(10),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  top: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  left: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  right: BorderSide(
                                      color: Colors.black, width: 1.0)),
                            ),
                            child: Center(child: Text('11'))),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  top: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  left: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  right: BorderSide(
                                      color: Colors.black, width: 1.0)),
                            ),
                            child: Center(child: Text('13'))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 128.3,
            child: Column(
              children: [
                // Buses hora total parte superior
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border(
                                top:
                                    BorderSide(color: Colors.black, width: 1.0),
                                left:
                                    BorderSide(color: Colors.black, width: 1.0),
                                right:
                                    BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(
                                    color: Colors.black, width: 1.0))),
                        child: Center(
                          child: Text(
                            '23 B/H am',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border(
                                top:
                                    BorderSide(color: Colors.black, width: 1.0),
                                left:
                                    BorderSide(color: Colors.black, width: 1.0),
                                right:
                                    BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(
                                    color: Colors.black, width: 1.0))),
                        child: Center(
                          child: Text(
                            '21 B/H pm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 22,
                  color: Colors.yellow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Vagón 3',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text('/')),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Wagon 3',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.height / 30,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0))),
                            child: Center(
                              child: Text(
                                '55 B/H am',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.height / 30,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0))),
                            child: Center(
                              child: Text(
                                '49 B/H pm',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey, width: 5.0),
                right: BorderSide(color: Colors.grey, width: 5.0),
              ),
            ),
            // am pm rutas inferiores
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('AM'), Text('PM')],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0)),
                              ),
                              child: Center(child: Text('14'))),
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0)),
                              ),
                              child: Center(child: Text('14'))),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0)),
                              ),
                              child: Center(child: Text('26'))),
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    top: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    left: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    right: BorderSide(
                                        color: Colors.black, width: 1.0)),
                              ),
                              child: Center(child: Text('25'))),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  top: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  left: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  right: BorderSide(
                                      color: Colors.black, width: 1.0)),
                            ),
                            child: Center(child: Text('15'))),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  top: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  left: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  right: BorderSide(
                                      color: Colors.black, width: 1.0)),
                            ),
                            child: Center(child: Text('10'))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 */
  
  Widget rutas2(String topOrbot, String ruta1, int ruta1Nombre, String ruta2,
      int ruta2Nombre) {
    if (topOrbot == "top") {
      return Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height / 8,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 10),
              child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width / 15,
                  height: MediaQuery.of(context).size.height / 8,
                  child: nombreRuta(ruta1Nombre, ruta1)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width / 15,
                  height: MediaQuery.of(context).size.height / 8,
                  child: nombreRuta(ruta2Nombre, ruta2)),
            ),
          ],
        ),
      );
    } else if (topOrbot == 'bot') {
      return Container(
        width: MediaQuery.of(context).size.width / 4.8,
        height: MediaQuery.of(context).size.height / 8,
        child: Row(
          children: [
            Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width / 15,
                height: MediaQuery.of(context).size.height / 8,
                child: nombreRuta(ruta1Nombre, ruta1)),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  height: MediaQuery.of(context).size.height / 8,
                  color: Color.fromARGB(255, 246, 137, 31),
                  child: nombreRuta(ruta2Nombre, ruta2)),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget nombreRuta(int numeroNombre, String nombre) {
    if (numeroNombre == 1) {
      return Center(
        child: Text(
          nombre,
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (numeroNombre == 2) {
      List partes = nombre.split(' ');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            partes[0] + ' ' + partes[1],
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Text(
            partes[2],
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.red,
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
                    'Diagrama',
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
        color: Colors.white,
        child: Scrollbar(
          controller: _controller,
          child: ListView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  salidasEstacion('Diagonal 40a', 'izq'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: rutas2('top', '6', 1, '8', 1),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
