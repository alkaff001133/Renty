import 'package:ahgaff_student/component/authentication/login_page.dart';
import 'package:ahgaff_student/component/authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(
        builder: (context, auth, child) {
          if (!auth.authenticated) {
            return ListView(
              children: [
                ListTile(
                  leading: const Icon(Iconsax.login_1_bold),
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                Divider(),
              ],
            );
          } else {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar-2.webp'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,

                    // image: NetworkImage(
                    //   'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                    // ),
                  ),
                  accountName: Text('John Doe'),
                  accountEmail: Text('t6m1X@example.com'),
                ),
                ListTile(
                  leading: const Icon(Iconsax.home_1_bold),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Iconsax.user_bold),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Iconsax.notification_1_bold),
                  title: const Text('Notifications'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Iconsax.settings_bold),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: const Text('Contact Us'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Iconsax.logout_1_bold),
                  title: const Text('Logout'),
                  onTap: () {
                    Provider.of<Auth>(context, listen: false).logout();
                  },
                ),
                Divider(),
              ],
            );
          }
        },
      ),
    );
  }
}
