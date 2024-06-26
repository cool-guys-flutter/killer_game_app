import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishPage extends ConsumerStatefulWidget {
  FinishPage({super.key});

  @override
  ConsumerState<FinishPage> createState() => _FinishPage();
}

class _FinishPage extends ConsumerState<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finished!'),
      ),
      body: const Center(
        child: Text("On this screen we ask to write the name of winner and count duration of the game"),
      ),
    );
  }
}