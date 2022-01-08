// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService1 {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'famousProduct';

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    _firestore.collection(ref).doc(productId).set(data);
  }
}
