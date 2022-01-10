// ignore_for_file: missing_return, prefer_final_fields, must_call_super, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, prefer_const_constructors, avoid_print, unnecessary_new, unused_element, unused_field, unused_local_variable

import 'dart:io';

import 'package:canteen_app/admin%20panel/database/brand.dart';
import 'package:canteen_app/admin%20panel/database/category.dart';
import 'package:canteen_app/admin%20panel/database/product.dart';
import 'package:canteen_app/admin%20panel/providers/products_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductService productService = ProductService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  final priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory = '';
  String _currentBrand = '';
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  List<String> selectedSizes = <String>[];
  List<String> colors = <String>[];
  bool onSale = false;
  bool featured = false;

  File? _image1;
  bool isLoading = false;

  Future pickImage(Widget widget) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _image1 = imageTemporary);
    } on PlatformException catch (e) {
      print('Faild to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProviders>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(
          Icons.close,
          color: black,
        ),
        title: Text(
          "add product",
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              child: OutlineButton(
                                  borderSide: BorderSide(
                                      color: grey.withOpacity(0.5), width: 2.5),
                                  onPressed: () {
                                    pickImage(_image1 != null
                                        ? Image.file(
                                            _image1!,
                                          )
                                        : _displayChild1());
                                  },
                                  child: _displayChild1()),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'enter a product name with 10 characters at maximum',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: red, fontSize: 12),
                      ),
                    ),

                    Text('Available productUnit'),

                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('Chicken'),
                            onChanged: (value) =>
                                changeSelectedSize('Chicken')),
                        Text('Chicken'),
                        Checkbox(
                            value: selectedSizes.contains('Veg'),
                            onChanged: (value) => changeSelectedSize('Veg')),
                        Text('Veg'),
                        Checkbox(
                            value: selectedSizes.contains('Buff'),
                            onChanged: (value) => changeSelectedSize('Buff')),
                        Text('Buff'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('Rolls'),
                            onChanged: (value) => changeSelectedSize('Rolls')),
                        Text('Rolls'),
                        Checkbox(
                            value: selectedSizes.contains('Cheese'),
                            onChanged: (value) => changeSelectedSize('Cheese')),
                        Text('Cheese'),
                        Checkbox(
                            value: selectedSizes.contains('Eggs'),
                            onChanged: (value) => changeSelectedSize('Eggs')),
                        Text('Eggs'),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(hintText: 'Product name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'You must enter the product name';
                          } else if (value.length > 10) {
                            return 'Product name cant have more than 10 letters';
                          }
                        },
                      ),
                    ),

//              select category

//
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),

                    FlatButton(
                      color: red,
                      textColor: white,
                      child: Text('add product'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }

  void changeSelectedCategory(String? selectedCategory) {
    setState(() => _currentCategory = selectedCategory!);
  }

  void changeSelectedBrand(String? selectedBrand) {
    setState(() => _currentCategory = selectedBrand!);
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => _image1 = tempImg);
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1!,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      if (_image1 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl1;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          UploadTask task1 = storage.ref().child(picture1).putFile(_image1!);

          TaskSnapshot snapshot1 = await task1.then((snapshot) => snapshot);

          task1.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();

            productService.uploadProduct({
              "productName": productNameController.text,
              "productPrice": int.parse(priceController.text),
              "productUnit": selectedSizes,
              "productImage": imageUrl1,
            });
            _formKey.currentState!.reset();
            setState(() => isLoading = false);
            Navigator.pop(context);
          });
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}
