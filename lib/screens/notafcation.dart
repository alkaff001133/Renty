import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Notafcation());

class Notafcation extends StatelessWidget {
  const Notafcation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // قائمة الإشعارات
  List<Map<String, dynamic>> notifications = [
    {
      'leadingIcon': Icons.check,
      'title': 'Booking confirmation',
      'message': 'Your booking  from Oct 10 to Oct 12.',
      'timeAgo': '1h ago',
      'leadingIsCheck': true,
    },
    {
      'leadingIcon': Icons.access_time,
      'title': 'Reminder',
      'message': 'Your car pickup time is in 30 minutes.',
      'timeAgo': '1h ago',
      'leadingIsCheck': false,
    },
    {
      'leadingIcon': Icons.error_outline,
      'title': 'The reservation period',
      'message': 'Please return or extend your booking.',
      'timeAgo': '1h ago',
      'leadingIsCheck': false,
    },
    {
      'leadingIcon': Icons.check,
      'title': 'Booking confirmation',
      'message': 'Your booking from Oct 10 to Oct 12 ',
      'timeAgo': '1h ago',
      'leadingIsCheck': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 120, top: 12),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notif = notifications[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: NotificationCard(
                leadingIcon: notif['leadingIcon'],
                title: notif['title'],
                message: notif['message'],
                timeAgo: notif['timeAgo'],
                leadingIsCheck: notif['leadingIsCheck'],
                onClose: () {
                  setState(() {
                    notifications.removeAt(index);
                  });
                },
              ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String message;
  final String timeAgo;
  final bool leadingIsCheck;
  final VoidCallback onClose; // دالة حذف الكارد

  const NotificationCard({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.message,
    required this.timeAgo,
    this.leadingIsCheck = false,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      leadingIcon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 12,
            child: GestureDetector(
              onTap: onClose, // حذف الكارد عند الضغط
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
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
