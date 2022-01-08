class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String id;
  int productQuantity;
  List<dynamic> productUnit;
  ProductModel(
      {required this.productQuantity,
      required this.id,
      required this.productUnit,
      required this.productImage,
      required this.productName,
      required this.productPrice});
}
