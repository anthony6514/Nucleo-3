import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/destination.dart';

/// Servicio de base de datos usando Cloud Firestore.
/// Maneja los destinos de viaje del usuario con actualizaciones en tiempo real.
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Nombre de la colección en Firestore.
  static const String _collection = 'destinations';

  /// Stream en tiempo real de los destinos del usuario.
  /// Cualquier cambio en Firestore se reflejará automáticamente.
  Stream<List<Destination>> getDestinations(String userId) {
    return _db
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Destination.fromMap(doc.id, doc.data()))
          .toList();
    });
  }

  /// Agrega un nuevo destino a Firestore.
  Future<void> addDestination(Destination destination) async {
    await _db.collection(_collection).add(destination.toMap());
  }

  /// Elimina un destino por su ID de documento.
  Future<void> deleteDestination(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }
}
