import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  final String title;

  final bool active;

  final void Function(String) onTap;
  
  const myCard(this.title, {super.key, this.active=true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(title),
      child:Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(16.0), // Padding inside the card
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4), // Shadow positioning
            ),
          ],
        ),
        child: Visibility(
          visible: active,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
