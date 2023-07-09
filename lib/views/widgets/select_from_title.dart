import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectFromTitle extends StatelessWidget {
  const SelectFromTitle({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Get.textTheme.titleLarge,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
      ),
      onTap: onTap,
    );
  }
}
