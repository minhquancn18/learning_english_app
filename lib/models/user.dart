import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String _email;
  late final String _name;
  late final String _uid;

  User({required String email, required String name, required String uid}) {
    _email = email;
    _name = name;
    _uid = uid;
  }
  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  Map<String, dynamic> toJson() =>
      {'email': _email, 'name': _name, 'uid': _uid};
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'], name: snapshot['name'], uid: snapshot['uid']);
  }
}