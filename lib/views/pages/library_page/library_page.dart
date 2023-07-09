import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: _tabs(),
          ),
          const Center(child: Text('Will be update')),
        ],
      ),
    );
  }

  List<Tab> _tabs() {
    return [
      const Tab(
        text: 'Your books',
      ),
      const Tab(
        text: 'Your selves',
      )
    ];
  }
}
