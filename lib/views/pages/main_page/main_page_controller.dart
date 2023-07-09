import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    _initTheAnimationController();
    super.onInit();
  }

  RxInt bottomNavbarSelectedIndex = 0.obs;
  static String get searchBarId => 'searchBarId';
  bool searchIsShown = true;

  /// Simple Animation fro the [_MainAppBar] searchBar for the borderRadius
  late final Animation<double> animation;
  late final AnimationController animationController;

  void _initTheAnimationController() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));

    animation = Tween<double>(begin: 12, end: 0).animate(animationController);
  }
}
