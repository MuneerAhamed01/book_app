import 'package:book_store/views/pages/discover_page/discover_page.dart';
import 'package:book_store/views/pages/home_page/home_page.dart';
import 'package:book_store/views/pages/library_page/library_page.dart';
import 'package:book_store/views/pages/main_page/main_page_controller.dart';
import 'package:book_store/views/pages/main_page/widgets/init_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wishlist_page/wishlist_page.dart';

class MainPage extends GetView<MainPageController> {
  static const String mainPage = '/';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: GetX<MainPageController>(builder: _body),
      bottomNavigationBar: GetX<MainPageController>(builder: _bottomNavBar),
    );
  }

  Widget _bottomNavBar(_) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      onTap: _onTapBottomBar,
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      currentIndex: controller.bottomNavbarSelectedIndex.value,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
      ],
    );
  }

  void _onTapBottomBar(int index) {
    controller.bottomNavbarSelectedIndex(index);
  }

  Widget _body(_) {
    final body = [
      const HomePage(),
      const LibraryPage(),
      const WishlistPage(),
      const DiscoverPage(),
    ];

    return body[controller.bottomNavbarSelectedIndex.value];
  }
}
