import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import 'package:killer_game_app/providers/game_provider.dart';

class DistributionPage extends ConsumerStatefulWidget {
  DistributionPage({super.key});

  @override
  ConsumerState<DistributionPage> createState() => _DistributionPage();
}

class _DistributionPage extends ConsumerState<DistributionPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _animation;
  bool _isFront = true;
  late String name;
  late String target;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    
    ref.read(gameProvider.notifier).startGame();
    
    ref.read(gameProvider.notifier).distributeTargets();
    name = ref.read(gameProvider.notifier).getNextPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _flipCard() {
    if (_controller.status != AnimationStatus.forward) {
      if (_isFront) {
        target = ref.read(gameProvider.notifier).getTarget(name);
        _controller.forward();
      } else {
        name = ref.read(gameProvider.notifier).getNextPlayer();
        if (name == 'None') {
          Navigator.of(context).pushNamed("/finish");
        }
        _controller.reverse();
      }
      _isFront = !_isFront;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play!'),
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: _flipCard,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.80,
            child: Transform(
              transform: Matrix4.rotationY(_animation.value * math.pi),
              alignment: Alignment.center,
              child: _isFront ? _buildFront(name) : _buildBack(name, target),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFront(String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
              child: Text(
                "$name takes phone",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
        ),
      ),
    );
  }

  Widget _buildBack(String name, String target) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.14),
      child: Container(
        decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
              child: Text(
                '$name kills $target',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
        ),
      ),
    );
  }
}