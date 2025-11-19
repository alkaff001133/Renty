import 'package:flutter/material.dart';

class Cardss extends StatelessWidget {
  const Cardss({super.key});

  Padding Cards({
    required String title,
    required String subtitle,
    required IconData iconData,
    required Color iconColor,
    required IconData iconData2,
  }) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        elevation: 20,
        child: ListTile(
          leading: Icon(iconData, size: 50, color: iconColor),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, style: TextStyle(fontSize: 20)),
          trailing: Icon(iconData2, size: 50, color: iconColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: Column(
        children: [
          Cards(
            title: 'Al-ahgaff university',
            subtitle: 'i am a student in ahgaff university',
            iconData: Icons.account_circle,
            iconColor: Colors.green,
            iconData2: Icons.arrow_forward_ios,
          ),
          Cards(
            title: 'Al-ahgaff university 2',
            subtitle: 'i am a student in ahgaff university 2',
            iconData: Icons.account_circle,
            iconColor: Colors.blue,
            iconData2: Icons.arrow_forward_ios,
          ),
          Cards(
            title: 'Al-ahgaff university 3',
            subtitle: 'i am a student in ahgaff university 3',
            iconData: Icons.account_circle,
            iconColor: Colors.orange,
            iconData2: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
