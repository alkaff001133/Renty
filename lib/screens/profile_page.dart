import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(buildContext);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person, color: Color(0xFF0083A7)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNearestCarCard(buildContext),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildHistoryCard(buildContext),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildProfileInfoCard(buildContext),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Save Filters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            _buildFilterCard(
              context: buildContext,
              title: 'Not less than 20 liters',
              subtitle: 'Full',
              details: 'Used 7 liters',
            ),
            SizedBox(height: 15),
            _buildFilterCard(
              context: buildContext,
              title: 'Tesla only',
              subtitle: 'Model',
              details: '',
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(buildContext, 3),
    );
  }

  Widget _buildNearestCarCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BMW 8 Series Gran Coupe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'UIF 0804',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.directions_car, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text('284km', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.access_time, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text('5 min', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$10.20/h',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NEAREST CAR',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/Cover 1.png',
                  width: 150,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'History',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Total time: 48',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              print('Clear history tapped!');
            },
            child: Text(
              'Cleare history',
              style: TextStyle(color: Color(0xFF0083A7), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Keira Smith',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Balancer: \$384',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print('Change profile tapped!');
              },
              child: Text(
                'Change pofile',
                style: TextStyle(color: Color(0xFF0083A7), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    String details = '',
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0083A7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (subtitle.isNotEmpty) // Only show subtitle if it exists
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                if (details.isNotEmpty) // Only show details if it exists
                  Text(
                    details,
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                  ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: Colors.white.withOpacity(0.7)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0083A7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              // زر Favorites
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPage()),
              );
              break;
            case 3:
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
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