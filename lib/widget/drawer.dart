import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/controllers/authentication_controller.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildDrawerHeader(),
            Divider(
              color: Colors.grey,
            ),
            // buildDrawerItem(icon: Icons.power_off, text: 'Log Out',)
            GestureDetector(
              child: Row(children: [Icon(Icons.door_sliding), Text('Log Out')]),
              onTap: (() {
                AuthController.instance.logout();
              }),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildDrawerHeader() {
  return UserAccountsDrawerHeader(
    accountEmail: Text(
      '',
    ),
    accountName: Text(
      'Profile',
      style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
    ),
    currentAccountPicture:
        CircleAvatar(backgroundImage: AssetImage('assets/pokeball.png')),
    currentAccountPictureSize: Size.square(64),
  );
}
