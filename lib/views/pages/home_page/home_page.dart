import 'package:book_store/views/pages/home_page/home_controller.dart';
import 'package:book_store/views/pages/home_page/widgets/ebooks_tabview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              tabs: _tabs(),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  EbooksTab(),
                  Center(child: Text('Will be update')),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  List<Tab> _tabs() {
    return [
      const Tab(
        text: 'Ebooks',
      ),
      const Tab(
        text: 'Audiobooks',
      )
    ];
  }
}
