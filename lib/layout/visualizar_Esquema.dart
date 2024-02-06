import 'package:flutter/material.dart';

class visualizarEsquema extends StatefulWidget {

  final String nombreEst;
  final Color colorEst;
  const visualizarEsquema({super.key, required this.nombreEst, required this.colorEst});

  

  @override
  State<visualizarEsquema> createState() => _visualizarEsquemaState();
}

class _visualizarEsquemaState extends State<visualizarEsquema> {
  ScrollController _controller = ScrollController();
  late String nombreEst;
  late Color colorEst;

  @override
  void initState() {
    super.initState();
    nombreEst = widget.nombreEst;
    colorEst = widget.colorEst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: colorEst,
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
                    '$nombreEst',
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
      //Esquema
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          controller: _controller,
          child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    //Salida izq
                    Padding(
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
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Image.asset(
                                        'assets/imagenes/triangulo_salida20.png'),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      'Salida',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
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
                                  'Diagonal 40a',
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          //Rutas parte superior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 10),
                                  child: Container(
                                      color: Colors.black,
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      child: Center(
                                        child: Text(
                                          '6',
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      color: Colors.black,
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      child: Center(
                                        child: Text(
                                          '8',
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Vagon
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 5.0),
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
                                      left: BorderSide(
                                          color: Colors.grey, width: 5.0),
                                      right: BorderSide(
                                          color: Colors.grey, width: 5.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [Text('AM'), Text('PM')],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 43, right: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('10'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('10'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('11'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('13'))),
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
                                        height:MediaQuery.of(context).size.height / 15,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '23 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '21 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              22,
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
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
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '55 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '49 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
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
                                    left: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                    right: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                  ),
                                ),
                                // am pm rutas inferiores
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('AM'), Text('PM')],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('14'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('14'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('26'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('25'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('15'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('10'))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          //Rutas Parte inferior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Container(
                                    color: Colors.black,
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Center(
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    color: Color.fromARGB(255, 246, 137, 31),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'PORTAL TUNAL',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'H13',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  color: Color.fromARGB(255, 246, 137, 31),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'PORTAL TUNAL',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                      Text(
                                        'H73',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

//--------------------------------------------------------------------------------------------------------------Vagon 2--------------------------------------------------------------------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.grey,
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          //Rutas parte superior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Container(
                                    color: Color.fromARGB(255, 253, 187, 48),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Center(
                                      child: Text(
                                        'C17',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    color: Color.fromARGB(255, 122, 104, 174),
                                    child:Center(
                                      child: Text(
                                        'D21',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                       ),
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  color: Color.fromARGB(255, 122, 104, 174),
                                  child: Center(
                                      child: Text(
                                        'D24',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                       ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Vagon
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 5.0),
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
                                      left: BorderSide(
                                          color: Colors.grey, width: 5.0),
                                      right: BorderSide(
                                          color: Colors.grey, width: 5.0)),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('AM'), Text('PM')],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('18'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('21'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('-'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('-'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('27'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('17'))),
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
                                        height:MediaQuery.of(context).size.height / 15,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '45 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '38 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              22,
                                      color: Colors.yellow,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'Vagón 2',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Text('/')),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'Wagon 2',
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
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '37 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '49 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
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
                                    left: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                    right: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                  ),
                                ),
                                // am pm rutas inferiores
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('AM'), Text('PM')],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('8'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('11'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('14'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('27'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('15'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('11'))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          //Rutas Parte inferior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Container(
                                    color: Colors.black,
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Center(
                                      child: Text(
                                        '6',
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    color: Color.fromARGB(255, 221, 155, 165),
                                    child: Center(
                                      child: Text(
                                        'J24',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                       ),
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  color: Color.fromARGB(255, 221, 155, 165),
                                  child: Center(
                                      child: Text(
                                        'J74',
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                       ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.grey,
                      ),
                    ),


//--------------------------------------------------------------------------------------------------------------Vagon 3--------------------------------------------------------------------------------



                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          //Rutas parte superior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Container(
                                    color: Color.fromARGB(255, 32, 65, 154),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Center(
                                      child: Text(
                                        'A61',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    color: Color.fromARGB(255, 122, 193, 67),
                                    child: Center(
                                      child: Text(
                                        'B13',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  color: Color.fromARGB(255, 122, 193, 67),
                                  child:  Center(
                                      child: Text(
                                        'B74',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Vagon
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 5.0),
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
                                      left: BorderSide(
                                          color: Colors.grey, width: 5.0),
                                      right: BorderSide(
                                          color: Colors.grey, width: 5.0)),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('AM'), Text('PM')],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('29'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('0'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('20'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('17'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('9'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('19'))),
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
                                        height:MediaQuery.of(context).size.height / 15,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '58 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '36 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              22,
                                      color: Colors.yellow,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'Vagón 1',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Text('/')),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'Wagon 1',
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
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '24 B/H am',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 6,
                                              height:MediaQuery.of(context).size.height / 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border(
                                                  top: BorderSide(color: Colors.black, width: 1.0),
                                                  left: BorderSide(color: Colors.black, width: 1.0),
                                                  right: BorderSide(color: Colors.black, width: 1.0),
                                                  bottom: BorderSide(color: Colors.black, width: 1.0)
                                                )
                                              ),

                                              child: Center(
                                                child: Text(
                                                  '44 B/H pm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                  ),
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
                                    left: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                    right: BorderSide(
                                        color: Colors.grey, width: 5.0),
                                  ),
                                ),
                                // am pm rutas inferiores
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text('AM'), Text('PM')],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('0'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('24'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('24'))),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                            width: 1.0)),
                                                  ),
                                                  child: Center(
                                                      child: Text('20'))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('-'))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                          width: 1.0)),
                                                ),
                                                child:
                                                    Center(child: Text('-'))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          //Rutas Parte inferior
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Row(
                              children: [
                                Container(
                                    color: Color.fromARGB(255, 227, 27, 35),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Center(
                                      child: Text(
                                        'F61',
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    color: Color.fromARGB(255, 246, 137, 31),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'PORTAL USME',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'H17',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  color: Color.fromARGB(255, 246, 137, 31),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'PORTAL TUNAL',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                      Text(
                                        'H21',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
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
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
