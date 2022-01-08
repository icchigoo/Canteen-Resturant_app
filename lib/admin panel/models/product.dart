// // ignore_for_file: constant_identifier_names

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   static const String BRAND = 'brand';
//   static const String CATEGORY = 'category';
//   static const String COLORS = 'colors';
//   static const String FEATURED = 'featured';
//   static const String ID = 'id';
//   static const String NAME = 'name';
//   static const String PICTURE = 'picture';
//   static const String PRICE = 'price';
//   static const String QUANTITY = 'quantity';
//   static const String SALE = 'sale';
//   static const String SIZE = 'size';

//   String? _brand;
//   String? _category;
//   String? _id;
//   String? _name;
//   String? _picture;
//   String? _price;
//   String? _quantity;
//   List<String>? _colors;
//   List<String>? _size;
//   bool? _featured;
//   bool? _sale;

//   //getters
//   String? get brand => _brand;
//   String? get category => _category;
//   String? get id => _id;
//   String? get name => _name;
//   String? get picture => _picture;
//   String? get price => _price;
//   String? get quantity => _quantity;
//   List<String>? get colors => _colors;
//   List<String>? get size => _size;
//   bool? get featured => _featured;
//   bool? get sale => _sale;

//   Product.fromSnapShot(DocumentSnapshot snapshot) {
//     _featured = snapshot[FEATURED];
//     _brand = snapshot[BRAND];
//     _category = snapshot[CATEGORY];
//     _name = snapshot[NAME];
//     _id = snapshot[ID];
//     _picture = snapshot[PICTURE];
//     _price = snapshot[PRICE];
//     _colors = snapshot[COLORS];
//     _size = snapshot[SIZE];
//     _sale = snapshot[SALE];
//     _quantity = snapshot[QUANTITY];
//   }
// }
