import 'package:flutter/material.dart';
import 'Medicine.dart';
import 'CartPage.dart'; // Import CartPage

class RecPage extends StatelessWidget {
  final Map medicines;
  final List cartItems;
  final Function(Medicine) addToCart;

  RecPage({Key? key, required Medicine m, required this.cartItems, required this.addToCart})
      : medicines = m.RecList(),
        super(key: key);

  String medicineName(int i) {
    return medicines[i]?.name ?? 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    final List<MedicineCategory> categories = medicines.entries.map((entry) {
      return MedicineCategory(
        medicine: entry.value,
        name: entry.value.name,
        imagePath: entry.value.img,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineCategoryDetailsScreen(category: category, addToCart: addToCart),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    category.imagePath,
                    width: 110,
                    height: 110,
                  ),
                  Text(category.name),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MedicineCategory {
  final String name;
  final String imagePath;
  final Medicine medicine;

  MedicineCategory({required this.name, required this.imagePath, required this.medicine});
}

class MedicineCategoryDetailsScreen extends StatelessWidget {
  final MedicineCategory category;
  final Function(Medicine) addToCart;

  const MedicineCategoryDetailsScreen({Key? key, required this.category, required this.addToCart}) : super(key: key);

  void handleAddToCart() {
    addToCart(category.medicine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.imagePath,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                if (category.medicine.CheckAvailability()) {
                  handleAddToCart();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('Purchase done!'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ); //showDialog
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
