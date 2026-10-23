import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Widget que muestra un overlay semitransparente con indicador de carga.
/// Úsalo sobre cualquier pantalla mientras se procesa una operación.
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.4),
            child: const Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 60.0,
              ),
            ),
          ),
      ],
    );
  }
}
