import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants.dart/constants.dart';
import 'package:multi_vendor_app/controllers/tab_index_controller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor_app/views/cart/cart_page.dart';
import 'package:multi_vendor_app/views/home/home_page.dart';
import 'package:multi_vendor_app/views/profile/profile_page.dart';

import 'search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              pageList[controller.tabIndex],
              // Container(
              //   height: height,
              //   width: width,
              //   color: kOfWhite,
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      selectedIconTheme: const IconThemeData(color: kSecondary),
                      onTap: (value) {
                        controller.setTabIndex = value;
                      },
                      currentIndex: controller.tabIndex,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        BottomNavigationBarItem(
                            icon: Badge(
                                child: Icon(Icons.shopping_cart),
                                label: Text('1')),
                            label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: 'Profile'),
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}
