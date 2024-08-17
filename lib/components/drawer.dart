import 'package:chattingdotcom/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;

  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // header

          Column(
            children: [
              const DrawerHeader(
                child: Text(
                  "H A M D A R D",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // home list tile
              MyListTile(
                icon: Icons.home,
                text: "Home",
                onTap: () => Navigator.pop(context),
              ),

              // profile list tile

              MyListTile(
                icon: Icons.person,
                text: "Profile",
                onTap: onProfileTap,
              ),
            ],
          ),

          // logout tile

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: "Logout",
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
