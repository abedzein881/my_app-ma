import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List cartItems;

  CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: widget.cartItems.isEmpty ?
      const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.medication),
              title: Text(item.name),
              subtitle: Text(
                'Dose: ${item.dose}mg\nFrequency: ${item.frequency}\n ExpiredDate: ${item.expiryDate}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.cartItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
