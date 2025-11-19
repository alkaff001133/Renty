import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/cars_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:final_project/screens/track_page.dart';
import 'package:final_project/screens/buses_page.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  static const String categoryPage = 'Category Page';
  const CategoryPage({super.key});

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
          "Choose Your Category",
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
          padding: const EdgeInsets.only(top: 32, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 30,
            mainAxisSpacing: 40,
            childAspectRatio: 2.0,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            final List<String> titles = ["Cars", "Trucks", "Buses"];
            final List<String> icons = [
              "assets/images/Capture-1.png",
              "assets/images/Rectangle 125.png",
              "assets/images/Bus-Rental-Dubai.png",
            ];

            return TruckCard(
              title: titles[index],
              iconData: icons[index],
              onTap: () {
                if (titles[index] == "Cars") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarsPage()),
                  );
                } else if (titles[index] == "Trucks") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TrackPage()),
                  );
                } else if (titles[index] == "Buses") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BusesPage()),
                  );
                }
              },
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

class TruckCard extends StatelessWidget {
  final String title;
  final String iconData;
  final VoidCallback onTap; // ← أضف هذا

  const TruckCard({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap, // ← أضف هذا
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // ← استخدم الدالة هنا
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: const Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(flex: 3, child: Center(child: Image.asset(iconData))),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
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
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
