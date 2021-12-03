import 'package:canteen_app/auth/sign_in.dart';
import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/providers/product_provider.dart';
import 'package:canteen_app/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:canteen_app/config/colors.dart';
//import 'package:canteen_app/google_sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe

//import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   // ignore: prefer_const_constructors
//   runApp(MyApp());
// }

// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//           theme: ThemeData(
//               primaryColor: primaryColor,
//               scaffoldBackgroundColor: scaffoldBackgroundColor),
//           debugShowCheckedModeBanner: false,
//           // ignore: prefer_const_constructors
//           home: SignIn(),
//         ),
//       );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
