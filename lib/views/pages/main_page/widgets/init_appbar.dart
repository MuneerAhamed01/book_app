import 'package:book_store/views/pages/main_page/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends GetView<MainPageController>
    implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      id: MainPageController.searchBarId,
      builder: (_) {
        return Visibility(
          visible: controller.searchIsShown,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5),
                    focusedBorder: _outlineInputBorder(),
                    enabledBorder: _outlineInputBorder(),
                    disabledBorder: _outlineInputBorder(),
                    errorBorder: _outlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Play Books',
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: _outlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent));
  }

  // void _textFieldOnTap() {
  //   controller.moveToSearchScreen(true);
  // }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}
