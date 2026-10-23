import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

/// Provider de autenticación que conecta AuthService con la UI.
/// Notifica a los widgets cuando el estado de autenticación cambia.
class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Stream del estado de autenticación de Firebase.
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  /// Usuario actualmente autenticado.
  User? get currentUser => _authService.currentUser;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Inicia sesión. Retorna true si fue exitoso, false si hubo error.
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _setError(null);
    try {
      await _authService.login(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _setError(_authErrorMessage(e.code));
      return false;
    } catch (e) {
      _setError('Error inesperado. Intenta nuevamente.');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Registra una nueva cuenta. Retorna true si fue exitoso.
  Future<bool> register(String email, String password) async {
    _setLoading(true);
    _setError(null);
    try {
      await _authService.register(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _setError(_authErrorMessage(e.code));
      return false;
    } catch (e) {
      _setError('Error inesperado. Intenta nuevamente.');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Cierra la sesión actual.
  Future<void> logout() async {
    await _authService.logout();
  }

  /// Traduce códigos de error de Firebase Auth a mensajes en español.
  String _authErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No existe una cuenta con ese correo electrónico.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'email-already-in-use':
        return 'Ya existe una cuenta con ese correo electrónico.';
      case 'weak-password':
        return 'La contraseña debe tener al menos 6 caracteres.';
      case 'invalid-email':
        return 'El formato del correo electrónico no es válido.';
      case 'network-request-failed':
        return 'Error de conexión. Verifica tu internet.';
      case 'too-many-requests':
        return 'Demasiados intentos fallidos. Espera un momento.';
      case 'invalid-credential':
        return 'Credenciales inválidas. Verifica tu correo y contraseña.';
      default:
        return 'Error de autenticación: $code';
    }
  }
}
