class Estacion2 {
  String _nombre;
  String _troncal;
  double _latitud;
  double _longitud;
  int _zona;
  int _numVagones;
  String _secuencia;

  Estacion2({
    required String nombre,
    required String troncal,
    required double latitud,
    required double longitud,
    required int zona,
    required int numVagones, 
    required String secuencia,
  })   : _nombre = nombre,
        _troncal = troncal,
        _latitud = latitud,
        _longitud = longitud,
        _zona = zona,
        _numVagones = numVagones,
        _secuencia = secuencia;

  factory Estacion2.fromJson(Map<String, dynamic> json) {
    return Estacion2(
      nombre: json['nombre_estacion'],
      troncal: json['troncal'],
      latitud: json['latitud_estacion'],
      longitud: json['longitud_estacion'],
      zona: json['zona'],
      numVagones: json['numero_vagones'],
      secuencia: json['secuencia']
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

  int get numVagones => _numVagones;
  set numVagones(int value){
    _numVagones = value;
  }

  String get secuencia => _secuencia;
  set secuencia(String value){
    _secuencia = value;
  }

}