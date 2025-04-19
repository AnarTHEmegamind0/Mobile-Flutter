import 'package:flutter/material.dart';

// ignore: camel_case_types
class Information_Widget extends StatefulWidget {
  const Information_Widget({super.key});

  @override
  State<Information_Widget> createState() => _Information_WidgetState();
}

// ignore: camel_case_types
class _Information_WidgetState extends State<Information_Widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.blue[100],
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const ListTile(
            leading: Icon(Icons.help_outline, color: Colors.black54),
            title: Text(
              'Help & Support',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black54,
            ),
          ),
        ),
        Card(
          color: Colors.blue[100],
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const ListTile(
            leading: Icon(Icons.privacy_tip_sharp, color: Colors.black54),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
        Card(
          color: Colors.blue[100],
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const ListTile(
            leading: Icon(Icons.add_reaction_sharp, color: Colors.black54),
            title: Text(
              'Invite a Friend',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black54,
            ),
          ),
        ),
        Card(
          color: Colors.blue[100],
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const ListTile(
            leading: Icon(Icons.logout, color: Colors.black54),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
      ],
    );
  }
}
