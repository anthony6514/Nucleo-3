import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../services/weather_service.dart';

/// Card que muestra un destino de viaje con su clima actual.
/// Consulta el clima al construirse usando FutureBuilder.
class DestinationCard extends StatefulWidget {
  final Destination destination;
  final VoidCallback? onDelete;

  const DestinationCard({
    super.key,
    required this.destination,
    this.onDelete,
  });

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  final WeatherService _weatherService = WeatherService();
  late Future<WeatherData?> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.getWeather(widget.destination.city);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Columna izquierda: info del destino
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.destination.country,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Columna derecha: clima
            FutureBuilder<WeatherData?>(
              future: _weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    width: 80,
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }

                if (snapshot.hasError || snapshot.data == null) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.cloud_off, color: Colors.grey, size: 28),
                      SizedBox(height: 4),
                      Text(
                        'Clima no\ndisponible',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  );
                }

                final weather = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          weather.iconUrl,
                          width: 40,
                          height: 40,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.wb_sunny, color: Colors.orange, size: 36),
                        ),
                        Text(
                          '${weather.temperature.toStringAsFixed(1)}°C',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1565C0),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      weather.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
