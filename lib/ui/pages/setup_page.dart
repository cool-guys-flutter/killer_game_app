import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupPage extends ConsumerStatefulWidget {
  SetupPage({super.key});

  @override
  ConsumerState<SetupPage> createState() => _SetupPage();
}

class _SetupPage extends ConsumerState<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup game'),
      ),
      body: const Center(
        child: Text("Guys add players' name on this page"),
      ),
    );
  }
}