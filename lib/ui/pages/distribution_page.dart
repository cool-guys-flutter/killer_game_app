import 'dart:ui';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:killer_game_app/providers/game_provider.dart';
import 'package:neon_widgets/neon_widgets.dart';

class DistributionPage extends ConsumerStatefulWidget {
  DistributionPage({super.key});

  @override
  ConsumerState<DistributionPage> createState() => _DistributionPage();
}

class _DistributionPage extends ConsumerState<DistributionPage>
    with SingleTickerProviderStateMixin {
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
      backgroundColor: Color(0x212121),
      body: GestureDetector(
        onTap: _flipCard,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.98,
            height: MediaQuery.of(context).size.height * 0.92,
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
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        margin: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 255, 0, 64),
              Color.fromARGB(255, 255, 0, 115),
              Color.fromARGB(255, 228, 0, 163),
              Color.fromARGB(255, 172, 0, 211),
              Color.fromARGB(255, 51, 61, 246),
            ],
            stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            center: Alignment.topLeft,
            radius: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 37, 30, 233),
              spreadRadius: 10,
              blurRadius: 35,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 190,
              width: 190,
              child: DropShadow(
                child: SvgPicture.asset("assets/images/aims.svg"),
                color: Color(0xffFF0B4C),
                opacity: 0.3,
                blurRadius: 4,
              ),
            ),
            Text(
              'PLAYER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "$name",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            SizedBox(
              height: 80,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: const Color.fromARGB(169, 255, 255, 255),
                  fontSize: 26,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'CLICK TO FIND OUT\n WHO YOUR TARGET IS'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.white),
              ),
              onPressed: () {},
              child: Text(
                'FIND OUT',
                style: TextStyle(
                  height: 2,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack(String name, String target) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.14),
      child: Container(
        margin: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 255, 0, 64),
              Color.fromARGB(255, 255, 0, 115),
              Color.fromARGB(255, 228, 0, 163),
              Color.fromARGB(255, 172, 0, 211),
              Color.fromARGB(255, 51, 61, 246),
            ],
            stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            center: Alignment.topLeft,
            radius: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 233, 30, 30),
              spreadRadius: 10,
              blurRadius: 35,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOUR TARGET',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 230,
                  width: 230,
                  child: DropShadow(
                    child: SvgPicture.asset("assets/images/aims.svg"),
                    color: Color(0xffFF0B4C),
                    opacity: 0.3,
                    blurRadius: 4,
                  ),
                ),
                Text(
                  '$target',
                  style: TextStyle(color: Colors.white, fontSize: 70),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.white),
              ),
              onPressed: () {},
              child: Text(
                'OKAY',
                style: TextStyle(
                  height: 2,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
