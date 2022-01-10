// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/admin%20panel/providers/app_states.dart';
import 'package:canteen_app/admin%20panel/providers/products_provider.dart';

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/login/components/login_auth_provider.dart';
import 'package:canteen_app/providers/check_out_provider.dart';
import 'package:canteen_app/providers/product_provider.dart';
import 'package:canteen_app/providers/review_cart_provider.dart';
import 'package:canteen_app/providers/user_provider.dart';
import 'package:canteen_app/providers/wish_list_provider.dart';
import 'package:canteen_app/screens/home/home_screen.dart';

import 'package:canteen_app/signup/components/signup_auth_provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupAuthProvider>(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<LoginAuthProvider>(
          create: (context) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
        ChangeNotifierProvider<AppState>(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider<ProductProviders>(
          create: (context) => ProductProviders(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                //  return HomeScreen();
              }
              return HomeScreen();
            }),
      ),
    );
  }
}
