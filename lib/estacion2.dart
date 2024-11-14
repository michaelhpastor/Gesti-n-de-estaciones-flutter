class Estacion2 {
  String _nombre;
  String _troncal;
  double _latitud; // Cambiar a double
  double _longitud;
  int _zona; // Cambiar a double

  Estacion2({
    required String nombre,
    required String troncal,
    required double latitud, // Cambiar a double
    required double longitud,
    required int zona // Cambiar a double
  })   : _nombre = nombre,
        _troncal = troncal,
        _latitud = latitud,
        _longitud = longitud,
        _zona = zona;

  factory Estacion2.fromJson(Map<String, dynamic> json) {
    return Estacion2(
      nombre: json['nombre_estacion'],
      troncal: json['Troncal'],
      latitud: json['latitud_estacion'], // Convertir a double
      longitud: json['longitud_estacion'],
      zona: json['zona'] // Convertir a double
    );
  }

  // Getters y setters
  String get nombre => _nombre;
  set nombre(String value) {
    _nombre = value;
  }

  String get troncal => _troncal;
  set troncal(String value) {
    _troncal = value;
  }

  double get latitud => _latitud; // Cambiar a double
  set latitud(double value) {
    _latitud = value;
  }

  double get longitud => _longitud; // Cambiar a double
  set longitud(double value) {
    _longitud = value;
  }

  int get zona => _zona;
  set zona(int value){
    _zona = value;
  }
}