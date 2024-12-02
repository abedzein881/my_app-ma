import 'dart:async';
import 'package:flutter/material.dart';
import 'PharmacyFormPage.dart';

class WaitingPage extends StatefulWidget {
  @override _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
  Navigator.pushReplacement(
    context, MaterialPageRoute(
      builder: (context) => PharmacyFormPage()
  ),
   );
}
);

}
@override Widget build(BuildContext context) {
  return const Scaffold(

    body: Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text( 'Welcome to Zein Pharmacy',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      CircularProgressIndicator(),
    ],
      ),
    ),
  );

  }


}