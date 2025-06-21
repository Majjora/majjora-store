// Modelo que representa a localização geográfica com latitude e longitude em formato de texto.
class GeolocationModel {
  final String lat;
  final String long;

  GeolocationModel({required this.lat, required this.long});

  // Cria um GeolocationModel a partir de um JSON.
  factory GeolocationModel.fromJson(Map<String, dynamic> json) {
    return GeolocationModel(lat: json['lat'], long: json['long']);
  }

  // Converte o GeolocationModel para JSON.
  Map<String, dynamic> toJson() {
    return {'lat': lat, 'long': long};
  }
}
