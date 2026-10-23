import 'dart:convert';
import 'package:http/http.dart' as http;

// TODO: Reemplaza con tu API key de OpenWeatherMap
// Obtén una gratis en: https://openweathermap.org/api
const String _apiKey = 'YOUR_OPENWEATHER_API_KEY';

/// Datos del clima para un destino.
class WeatherData {
  final double temperature;
  final String description;
  final String icon;

  WeatherData({
    required this.temperature,
    required this.description,
    required this.icon,
  });

  /// URL del ícono del clima de OpenWeatherMap.
  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';
}

/// Servicio para consultar el clima actual de una ciudad usando OpenWeatherMap.
class WeatherService {
  /// Obtiene el clima actual para la ciudad indicada.
  /// Retorna null si la ciudad no se encuentra.
  /// Lanza una excepción descriptiva si hay error de autenticación o red.
  Future<WeatherData?> getWeather(String city) async {
    final uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather'
      '?q=${Uri.encodeComponent(city)}'
      '&appid=$_apiKey'
      '&units=metric'
      '&lang=es',
    );

    try {
      final response = await http.get(uri).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final weather = (data['weather'] as List<dynamic>).first
            as Map<String, dynamic>;
        final main = data['main'] as Map<String, dynamic>;

        return WeatherData(
          temperature: (main['temp'] as num).toDouble(),
          description: weather['description'] as String,
          icon: weather['icon'] as String,
        );
      } else if (response.statusCode == 401) {
        throw Exception(
          'API key de OpenWeatherMap inválida. '
          'Actualiza la constante _apiKey en weather_service.dart.',
        );
      } else if (response.statusCode == 404) {
        // Ciudad no encontrada — retornamos null en lugar de lanzar excepción
        return null;
      } else {
        throw Exception(
          'Error al consultar el clima (código ${response.statusCode}). '
          'Verifica tu conexión a internet.',
        );
      }
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('Error de conexión al consultar el clima: $e');
    }
  }
}
