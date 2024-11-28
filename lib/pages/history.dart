import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My History'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('My History Screen'),
      ),
    );
  }
}
