import 'package:book_store/views/widgets/book_items/book_item.dart';
import 'package:book_store/views/widgets/select_from_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  late final TabController _mainTabCntrl;
  late final TabController _subTabCntrl;

  @override
  void initState() {
    _mainTabCntrl = TabController(length: 2, vsync: this);
    _subTabCntrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _mainTabCntrl,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: _tabsMain(),
          ),
          SelectFromTitle(onTap: () {}, title: "Genres"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _buildButtons(),
            ),
          ),
          SelectFromTitle(onTap: () {}, title: "eBooks charts"),
          TabBar(
            controller: _subTabCntrl,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: _tabSub(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: _itemBuilder,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }

  List<Tab> _tabsMain() {
    return [
      const Tab(
        text: 'Ebooks',
      ),
      const Tab(
        text: 'Comics',
      ),
    ];
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BookItem(
        image: '',
        title: 'jd jd jd jd',
        rating: 3,
        type: BookItemType.list,
      ),
    );
  }

  List<Tab> _tabSub() {
    return [
      const Tab(
        text: 'Top selling',
      ),
      const Tab(
        text: 'News',
      ),
      const Tab(
        text: 'Free',
      ),
    ];
  }

  List<Widget> _buildButtons() {
    final width = (Get.width / 2) - 20;

    return [
      SizedBox(
        width: width,
        height: 80,
        child: AppButton(
          title: 'Business',
          onTap: () {},
        ),
      ),
      SizedBox(
        width: width,
        height: 80,
        child: AppButton(
          title: 'Business',
          onTap: () {},
        ),
      ),
      SizedBox(
        width: width,
        height: 80,
        child: AppButton(
          title: 'Business',
          onTap: () {},
        ),
      ),
      SizedBox(
        width: width,
        height: 80,
        child: AppButton(
          title: 'Business',
          onTap: () {},
        ),
      ),
    ];
  }
}
