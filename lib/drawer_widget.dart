import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/admin/admin_page.dart';
import 'package:pygmyapp_menu/auth/login_view.dart';
import 'package:pygmyapp_menu/hal_aboutapp.dart';
import 'package:pygmyapp_menu/homebtn.dart';
import 'package:pygmyapp_menu/menu_page.dart';
import 'package:pygmyapp_menu/provider/auth_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/pygmy2.png'),
                fit: BoxFit.cover
                )
            ),
            child: Text('Pygmy Owl Coffee',
            style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const Homebtn();
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('About App'),
            onTap: () {
              // Update the state of the app/
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return About();
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Espresso Based'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MenuPage(category: "Espresso",);
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Non Coffee'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MenuPage(category: "Non Coffee",);
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Kopi Susu'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MenuPage(category: "Kopi Susu",);
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Manual Brew'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MenuPage(category: "Manual Brew",);
              }));
            },
          ),
          Consumer<AuthProvider>(builder: (context, value, child) =>
            (value.role == "admin") 
            ? const Divider()
            : const Visibility(visible: false, child: Divider())
          ),
          Consumer<AuthProvider>(builder: (context, value, child) =>
            (value.role == "admin") 
            ? ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('asset/pygmy_white.png'),
              ),
              title: const Text('Admin Page'),
              onTap: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const AdminPage();
              }));
              },
            )
            : const Visibility(visible: false, child: Divider())
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('asset/pygmy_white.png'),
            ),
            title: const Text('Logout'),
            onTap: () {
              
              authProvider.signOut();

              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
        ],
      ),
    );
  }
}
