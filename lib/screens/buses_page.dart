import 'package:final_project/screens/car_rental_map_details_page.dart';
import 'package:final_project/screens/cars_page.dart';
import 'package:final_project/screens/favorites.dart' hide CarCard;
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:flutter/material.dart';

class BusesPage extends StatelessWidget {
  static const String busesPage = 'Buses Page';
  const BusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Choose Your Buses",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.white, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.95,
          ),
          itemCount: buses.length,
          itemBuilder: (context, index) {
            final car = buses[index];
            return CarCard(
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarRentalMapDetailsPage(),
                  ),
                );
              },
              title: car["type"]!,
              price: car["price"]!,
              rating: car["rating"]!,
              imagePath: car["image"]!,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0083A7),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0, // مؤشر الزر المحدد
        
        onTap: (value) {
          switch(value) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              break;
            case 1:
              // زر Notifications
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
              break;
            case 2:
              // زر Favorites
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPage()),
              );
              break;
            case 3:
              // زر Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// بيانات الباصات
const List<Map<String, String>> buses = [
  {
    "type": "Mercedes 2023",
    "price": "\$80.00/h",
    "image": "assets/images/Bus-Rental-Dubai.png",
    "rating": "4.6",
  },
  {
    "type": "Volvo 2022",
    "price": "\$75.00/h",
    "image": "assets/images/Bus-Rental-Dubai.png",
    "rating": "4.5",
  },
  {
    "type": "Scania 2021",
    "price": "\$70.00/h",
    "image": "assets/images/Bus-Rental-Dubai.png",
    "rating": "4.4",
  },
  {
    "type": "Ford 2020",
    "price": "\$65.00/h",
    "image": "assets/images/Bus-Rental-Dubai.png",
    "rating": "4.3",
  },
];

class VehicleCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String rating;

  const VehicleCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("تم الضغط على: $title");
      },
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF0583A3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // صورة الباص
            Container(
              height: 120,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFDDDDDD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
            ),
            // الصندوق الأزرق
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF0583A3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
