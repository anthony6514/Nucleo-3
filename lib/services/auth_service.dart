import 'package:firebase_auth/firebase_auth.dart';

/// Servicio de autenticación con Firebase Auth.
/// Provee métodos para login, registro, logout y el stream de estado.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Stream que emite el usuario actual (null si no está autenticado).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Usuario actualmente autenticado, o null.
  User? get currentUser => _auth.currentUser;

  /// Inicia sesión con email y contraseña.
  /// Lanza [FirebaseAuthException] si las credenciales son inválidas.
  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  /// Registra una nueva cuenta con email y contraseña.
  /// Lanza [FirebaseAuthException] si el email ya está en uso.
  Future<UserCredential> register(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  /// Cierra la sesión del usuario actual.
  Future<void> logout() async {
    await _auth.signOut();
  }
}
