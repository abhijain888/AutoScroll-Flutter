import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PositionScroll extends StatefulWidget {
  const PositionScroll({super.key});

  @override
  State<PositionScroll> createState() => _PositionScrollState();
}

class _PositionScrollState extends State<PositionScroll> {
  final _random = Random();

  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable Positioned List"),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.cyan[(index * 100)],
            child: Text('$index'),
          ),
          title: const Text('Item '),
        ),
        itemScrollController: itemScrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int i = _random.nextInt(50);
          print(i);
          itemScrollController.scrollTo(
            index: i,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubic,
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
