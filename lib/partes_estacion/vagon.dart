import 'package:flutter/material.dart';

class Vagon extends StatefulWidget {
  const Vagon({super.key});

  @override
  State<Vagon> createState() => _VagonState();
}

class _VagonState extends State<Vagon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 8,
          color: Colors.grey,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1.0),
                  top: BorderSide(color: Colors.black, width: 1.0),
                  left: BorderSide(color: Colors.black, width: 1.0),
                  right: BorderSide(color: Colors.black, width: 1.0)),
                  ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 8,
          color: Colors.grey,
        ),
      ],
    );
  }
}
