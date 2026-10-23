/// Modelo que representa un destino de viaje guardado por el usuario.
class Destination {
  final String id;
  final String userId;
  final String city;
  final String country;
  final double? lat;
  final double? lon;

  Destination({
    required this.id,
    required this.userId,
    required this.city,
    required this.country,
    this.lat,
    this.lon,
  });

  /// Convierte el destino a un mapa para guardarlo en Firestore.
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'city': city,
      'country': country,
      'lat': lat,
      'lon': lon,
    };
  }

  /// Crea un Destination desde un documento de Firestore.
  factory Destination.fromMap(String id, Map<String, dynamic> map) {
    return Destination(
      id: id,
      userId: map['userId'] as String? ?? '',
      city: map['city'] as String? ?? '',
      country: map['country'] as String? ?? '',
      lat: (map['lat'] as num?)?.toDouble(),
      lon: (map['lon'] as num?)?.toDouble(),
    );
  }

  @override
  String toString() => 'Destination($city, $country)';
}
