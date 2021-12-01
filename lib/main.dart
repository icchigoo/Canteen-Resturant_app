import 'package:canteen_app/auth/sign_in.dart';
import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: scaffoldBackgroundColor),
          debugShowCheckedModeBanner: false,
          home: SignIn(),
        ),
      );
}
