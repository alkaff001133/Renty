import 'package:final_project/screens/car_rental_map_details_page.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/cars_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:final_project/screens/track_page.dart';
import 'package:final_project/screens/buses_page.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static const String favoritesPage = 'Favorites Page';
  const FavoritesPage({super.key});

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Favorites",
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 2/1.2,
          ),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
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
        currentIndex: 0,
        onTap: (value) {
          switch(value) {
            case 0:
              // زر Home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
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
const List<Map<String, String>> cars = [
  {
    "type": "Nissan 2025",
    "price": "\$30.00/h",
    "image": "assets/images/PATROL-NISMO.png",
    "rating": "4.5",
  },
  {
    "type": "Truck 2021",
    "price": "\$320.0/h",
    "image": "assets/images/fh_truck.png",
    "rating": "4.8",
  }
];

class CarCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String rating;
  final void Function() onTab;

  const CarCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF0583A3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // صورة السيارة
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
            // الصندوق الأزرق مع كل المعلومات
            Expanded(
              child: // الصندوق الأزرق مع كل المعلومات
              Container(
                width: double.infinity,
                height: 50, // تقليل ارتفاع الكنتينر الأزرق
                decoration: BoxDecoration(
                  color: const Color(0xFF0583A3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.black, // حد أسود واضح
                    width: 2, // جعل الحد أكثر وضوحاً
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // اسم السيارة
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20, // تصغير الخط قليلاً
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // السعر والتقييم مع عكس أماكنهم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // التقييم أولاً
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              rating,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 60), // المسافة بين التقييم والسعر
                        // السعر بعد التقييم
                        Text(
                          price,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}