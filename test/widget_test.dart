// Este archivo es un placeholder para los tests del proyecto.
// Los tests reales requieren Firebase configurado.
// Para correr tests unitarios de los modelos, añade los tests aquí.

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_weather/models/destination.dart';

void main() {
  group('Destination model', () {
    test('toMap convierte correctamente', () {
      final destination = Destination(
        id: 'test-id',
        userId: 'user-123',
        city: 'Quito',
        country: 'Ecuador',
        lat: -0.2295,
        lon: -78.5243,
      );

      final map = destination.toMap();

      expect(map['userId'], 'user-123');
      expect(map['city'], 'Quito');
      expect(map['country'], 'Ecuador');
      expect(map['lat'], -0.2295);
      expect(map['lon'], -78.5243);
    });

    test('fromMap crea Destination correctamente', () {
      final map = {
        'userId': 'user-456',
        'city': 'Paris',
        'country': 'Francia',
        'lat': 48.8566,
        'lon': 2.3522,
      };

      final destination = Destination.fromMap('doc-id', map);

      expect(destination.id, 'doc-id');
      expect(destination.userId, 'user-456');
      expect(destination.city, 'Paris');
      expect(destination.country, 'Francia');
      expect(destination.lat, 48.8566);
      expect(destination.lon, 2.3522);
    });

    test('fromMap maneja campos nulos gracefully', () {
      final destination = Destination.fromMap('id', {});
      expect(destination.city, '');
      expect(destination.lat, null);
    });
  });
}
