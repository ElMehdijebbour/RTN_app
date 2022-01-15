import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('hashes');
class Database {

static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection = _mainCollection.doc("12").collection("hash");
    return notesItemCollection.snapshots();
  }
}