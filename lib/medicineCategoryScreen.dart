import 'package:flutter/material.dart';
import 'Medicine.dart';
import 'RecPage.dart';
import 'CartPage.dart';

class MedicineCategoryScreen extends StatelessWidget {
  final Map medicines;
  final List cardItems;

  MedicineCategoryScreen({Key? key})
      : medicines = Medicine.MedicineList(),
        cardItems = [],
        super(key: key);

  String medicineName(int i) {
    return medicines[i]?.name ?? 'Unknown';
  }

  String medicineCategory(int i) {
    return medicines[i]?.category ?? 'Unknown';
  }

  void addToCart(Medicine medicine) {

      cardItems.add(medicine);

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
        title: const Text('Medicine Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cardItems), // Pass the list of cart items here
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
                  builder: (context) => MedicineCategoryDetailsScreen(
                    category: category,
                    cardItems: cardItems,
                    addToCart: addToCart,
                  ),
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

  MedicineCategory({
    required this.name,
    required this.imagePath,
    required this.medicine,
  });
}

class MedicineCategoryDetailsScreen extends StatelessWidget {
  final MedicineCategory category;
  final List cardItems;
  final Function(Medicine) addToCart;

  const MedicineCategoryDetailsScreen({
    Key? key,
    required this.category,
    required this.cardItems,
    required this.addToCart,
  }) : super(key: key);

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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (category.medicine.CheckAvailability()) {
                  addToCart(category.medicine);
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
                  ); // showDialog
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Out of stock!!'),
                        content: Text('Appropriate suggestions?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecPage(
                                    m: category.medicine,
                                    cartItems: cardItems,
                                    addToCart: addToCart,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ); // showDialog
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

