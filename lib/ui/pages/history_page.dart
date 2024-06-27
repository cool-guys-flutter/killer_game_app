import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game History'),
      ),
      body: const Center(
        child: Text("Guy see history of games on this screen"),
      ),
    );
  }
}