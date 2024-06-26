import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DistributionPage extends ConsumerStatefulWidget {
  DistributionPage({super.key});

  @override
  ConsumerState<DistributionPage> createState() => _DistributionPage();
}

class _DistributionPage extends ConsumerState<DistributionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play!'),
      ),
      body: const Center(
        child: Text("Guys see their target on this screen"),
      ),
    );
  }
}