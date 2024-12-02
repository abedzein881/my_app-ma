import 'package:flutter/material.dart';
import 'WaitingPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

        title: 'OnlinePharmacyApp',

        debugShowCheckedModeBanner: false,

        home: WaitingPage()

    );

  }

}