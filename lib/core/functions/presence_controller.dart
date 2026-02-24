import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PresenceService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference? _statusRef;

  Future<void> init() async {
    final user = _auth.currentUser;
    if (user == null) return;

    _statusRef = _database.ref("status/${user.uid}");

    await _statusRef!.onDisconnect().set({
      "is_online": false,
      "last_seen": ServerValue.timestamp,
    });

    // Set user online
    await _statusRef!.set({
      "is_online": true,
      "last_seen": ServerValue.timestamp,
    });
  }

  Future<void> setOffline() async {
    if (_statusRef == null) return;

    await _statusRef!.set({
      "is_online": false,
      "last_seen": ServerValue.timestamp,
    });
  }
}