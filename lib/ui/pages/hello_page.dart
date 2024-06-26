import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPage();
}

class _HelloPage extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Killer Game'),
      ),
      body: const Center(
        child: Text('Here are screens with rules that greet new users'),
      ),
    );
  }
}