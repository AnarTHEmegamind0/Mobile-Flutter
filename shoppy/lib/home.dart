import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/bag.dart';
import 'package:shop_app/screens/favorite.dart';

import 'package:shop_app/screens/profile.dart';
import 'package:shop_app/screens/shopping.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> Pages = [
    const ShoppingPage(),
    BagPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<globalProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Pages[provider.currentIdx],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.redAccent, // Set selected color to red
            currentIndex: provider.currentIdx,
            onTap: provider.changeCurrentIdx,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'navigator.shop'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'navigator.cart'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'navigator.favorites'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'navigator.profile'.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
