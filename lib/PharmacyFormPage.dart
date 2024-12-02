
import 'package:flutter/material.dart';
import 'MedicineCategoryScreen.dart';

class PharmacyFormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Online Pharmacy')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form( key: _formKey, child: SingleChildScrollView(
          child: Column(
            children: [
          const Text( 'Enter your details to continue',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your full name';
            }
             return null;
            },
          ),
          const SizedBox(height: 20),

          TextFormField( decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress, validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
              },
          ),
          const SizedBox(height: 20),

          TextFormField( decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone, validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your phone number';
            }
            return null;
            },
            ),
          const SizedBox(height: 20),

          TextFormField( decoration: const InputDecoration(labelText: 'Address'),
            validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your address';
            }
            return null;
            },
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => MedicineCategoryScreen()
            ),
            );
          }
          },
            child: const Text('Submit'),
          ),
        ],
        ),
        ),
        ),
      ),
    );
  }

}