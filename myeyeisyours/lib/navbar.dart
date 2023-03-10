import 'package:about/about_us.dart';
import 'package:about/auth/authController.dart';
import 'package:flutter/material.dart';
import 'about_us.dart';
import 'view_profile.dart';
import 'notifications.dart';

class NavBar extends StatelessWidget {
  String email;
  NavBar({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Fatma Masmoudi"),
            accountEmail: Text(email),//to make a variable email
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
                'assets/images/person.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: Text(
              "View Profile",
              textScaleFactor: 1.5,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => viewProfile(),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 40,
            ),
            title: Text(
              "Notifications",
              textScaleFactor: 1.5,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => notification(),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              size: 40,
            ),
            title: Text(
              "About Us",
              textScaleFactor: 1.5,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutUs(),
              ),
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.notifications,
                size: 40,
              ),
              title: Text(
                "Log OUT",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                AuthController.instance.logOut();
              }),
        ],
      ),
    );
  }
}
