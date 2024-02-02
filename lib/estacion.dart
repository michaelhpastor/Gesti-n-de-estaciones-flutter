class Estacion {
  String _nombre;
  String _troncal;
  String _ubicacion;

  Estacion({
    required String nombre,
    required String troncal,
    required String ubicacion,
  })   : _nombre = nombre,
        _troncal = troncal,
        _ubicacion = ubicacion;



  factory Estacion.fromJson(Map<String, dynamic> json) {
    return Estacion(
      nombre: json['nombre'],
      troncal: json['troncal'],
      ubicacion: json['ubicacion'],
    );
  }


  // Getter para nombre
  String get nombre => _nombre;

  // Setter para nombre
  set nombre(String value) {
    _nombre = value;
  }

  // Getter para troncal
  String get troncal => _troncal;

  // Setter para troncal
  set troncal(String value) {
    _troncal = value;
  }

  // Getter para ubicacion
  String get ubicacion => _ubicacion;

  // Setter para ubicacion
  set ubicacion(String value) {
    _ubicacion = value;
  }
}
