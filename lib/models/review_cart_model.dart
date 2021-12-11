class ReviewCartModel {
  String cartId;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuantity;
  var cartUnit;
  ReviewCartModel({
    required this.cartId,
    this.cartUnit,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
  });
}
