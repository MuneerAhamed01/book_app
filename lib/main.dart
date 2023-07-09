import 'package:book_store/routes/r_route.dart';
import 'package:book_store/routes/route_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inital_bindings.dart';

void main() {
  runApp(
    MyApp(
      routes: Routes(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routes});
  final RRoute routes;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: routes.routes(),
      title: 'Book App',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}
