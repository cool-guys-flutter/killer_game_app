import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPage();
}

class _MainPage extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Killer Game'),
      ),
      body: const Center(
        child: Text('Here are icon of the game, buttons to history, setup and rules'),
      ),
    );
  }
}