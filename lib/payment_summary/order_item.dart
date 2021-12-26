// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class OrderItem extends StatelessWidget {
//   // final ReviewCartModel e;
//   late bool isTrue;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.network(
//         "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1e9.png",
//         width: 60,
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "food name",
//             style: TextStyle(
//               color: Colors.grey[600],
//             ),
//           ),
//           Text(
//             "Small",
//             style: TextStyle(
//               color: Colors.grey[600],
//             ),
//           ),
//           Text(
//             "\$30",
//           ),
//         ],
//       ),
//       subtitle: Text("5"),
//     );
//   }
// }

import 'package:canteen_app/models/review_cart_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({required this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e.cartUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "\$${e.cartPrice}",
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}
