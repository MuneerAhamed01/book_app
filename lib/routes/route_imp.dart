
import 'package:book_store/routes/r_route.dart';
import 'package:book_store/views/pages/main_page/main_page_screen.dart';
import 'package:get/get.dart';

class Routes extends RRoute {
  @override
  List<GetPage> routes() => [
        GetPage(
          name: MainPage.mainPage,
          page: () => const MainPage(),
        ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
        //   GetPage(
        //   name: RoutesName.initialRoute,
        //   page: () => const LandingPage(),
        //   binding: LandingPageBindings(),
        // ),
      ];

  @override
  String get initialRoute => MainPage.mainPage;
}
