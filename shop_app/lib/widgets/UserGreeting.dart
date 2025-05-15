import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/models/users.dart';
import 'package:shop_app/widgets/LanguageToggle.dart';

class UserGreeting extends StatelessWidget {
  final UserModel? user;

  const UserGreeting({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red[300],
          child: const Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'home.greeting'.tr(), 
              style: GoogleFonts.exo2(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user?.name?.firstname ?? ''}',
              style: GoogleFonts.exo2(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        const LanguageToggle(),
        const SizedBox(width: 10),
      ],
    );
  }
}
