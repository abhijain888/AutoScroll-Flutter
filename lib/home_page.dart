import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  final List<String> listItems = List.generate(100, (i) => "Item $i");

  final double _height = 80;

  void _scrollToIndex(index) {
    _scrollController.animateTo(_height * index,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  int? _destinationIndex;

  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: listItems.length,
        itemBuilder: (_, index) {
          return SizedBox(
            height: _height,
            child: Card(
              color: index == _destinationIndex
                  ? Colors.teal // Highlight item
                  : Colors.blue[100],
              child: Center(
                child: Text(
                  listItems[index],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _destinationIndex = _random.nextInt(100);
          });
          _scrollToIndex(_destinationIndex);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
