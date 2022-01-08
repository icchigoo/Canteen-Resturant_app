// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String ref = 'brands';

  void createBrand(String name) {
    var id = Uuid();
    String brandId = id.v1();

    _firebaseFirestore.collection('brands').doc(brandId).set({'brand': name});
  }

  Future<List<DocumentSnapshot>> getBrands() =>
      _firebaseFirestore.collection(ref).get().then((snaps) {
        return snaps.docs;
      });

  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firebaseFirestore
          .collection(ref)
          .where('brand', isEqualTo: suggestion)
          .get()
          .then((snap) {
        return snap.docs;
      });
}
