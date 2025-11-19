import 'package:final_project/screens/date_time_selection_page.dart';
import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/category_page.dart';
import 'package:final_project/screens/cars_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:flutter/material.dart';


// ===== الصفحة الرئيسية =====
class HomePageTabTwo extends StatefulWidget {
  static const String homePageTwo = 'HomePageTabTwo';
  const HomePageTabTwo({super.key});

  @override
  State<HomePageTabTwo> createState() => _HomePageTabTwoState();
}

class _HomePageTabTwoState extends State<HomePageTabTwo> {
  String _selectedDateText = "Select date range";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== الهيدر =====
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Renty",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0083A7),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0083A7),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(24),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "What your next destination?",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ===== الشعار الجديد =====
                  Positioned(
                    top: -10,
                    right: 32,
                    bottom: 50,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0083A7).withOpacity(0.99),
                            blurRadius: 1,
                            spreadRadius: 20,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.directions_car,
                          color: Color(0xFF0083A7),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== أزرار اختيار الموقع =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child:_LocationButtons(
  onSameLocationTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  },
  onDifferentLocationTap: () {
    // هنا ممكن تترك كما هو أو أي إجراء آخر
    print("Different location tapped");
  },
)
            ),    
            const SizedBox(height: 30),

            // ===== حقول الموقع والتاريخ =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  LocationInputField(
                    hintText: "Sana'a , Yemen",
                    icon: Icons.location_on,
                  ),
                  SizedBox(height: 16,),
                  LocationInputField(
                    hintText: "To",
                  ),

                  const SizedBox(height: 40),

                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateTimeSelectionPage(),
                        ),
                      );

                      if (result != null &&
                          result["start"] != null &&
                          result["end"] != null) {
                        setState(() {
                          _selectedDateText =
                              "${result["start"].day}-${result["start"].month}-${result["start"].year} to ${result["end"].day}-${result["end"].month}-${result["end"].year}";
                        });
                      }
                    },
                    child: DateInputField(
                      date: _selectedDateText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
  onPressed: () {
    // الانتقال إلى صفحة Page3 عند الضغط على الزر
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CategoryPage()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF0083A7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
  ),
  child: const Text(
    'Choose Category',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
),

                ],
              ),
            ),

            const SizedBox(height: 50),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // ===== شريط التنقل السفلي =====
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0083A7),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          switch(value) {
            case 0:
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
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// ===== أزرار اختيار الموقع =====
class _LocationButtons extends StatefulWidget {
  final VoidCallback onSameLocationTap;
  final VoidCallback onDifferentLocationTap;

  const _LocationButtons({
    required this.onSameLocationTap,
    required this.onDifferentLocationTap,
  });

  @override
  State<_LocationButtons> createState() => _LocationButtonsState();
}

class _LocationButtonsState extends State<_LocationButtons> {
  bool isSameLocationSelected = false; // افتراضيًا نفس الموقع

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [

          // زر نفس الموقع
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSameLocationSelected = true;
                });
                widget.onSameLocationTap();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: isSameLocationSelected
                      ? const Color(0xFF0A89A1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Same delivery\nlocation",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: isSameLocationSelected
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

         // زر موقع مختلف
// زر موقع مختلف
Expanded(
  child: GestureDetector(
    onTap: () {
      setState(() {
        isSameLocationSelected = false; // يغير اللون فوراً
      });

      // تأخير بسيط قبل الانتقال للسماح للون الأزرق بالظهور
      Future.delayed(const Duration(milliseconds: 100), () {
        widget.onDifferentLocationTap();
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isSameLocationSelected
            ? Colors.white
            : const Color(0xFF0A89A1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          "Delivery at a different\nlocation",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: isSameLocationSelected
                ? Colors.black87
                : Colors.white,
          ),
        ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }   
}

