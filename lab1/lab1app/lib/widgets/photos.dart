import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final List<String> photoPaths = [
    'assets/profile.jpeg',
    'assets/profile.jpeg',
    'assets/profile.jpeg',
    'assets/profile.jpeg',
    'assets/profile.jpeg',
    'assets/profile.jpeg',
    'assets/profile.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 photos per row
        crossAxisSpacing: 5, // Spacing between columns
        mainAxisSpacing: 5, // Spacing between rows
      ),
      itemCount: photoPaths.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(photoPaths[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
