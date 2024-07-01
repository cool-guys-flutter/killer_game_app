import 'dart:ui';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:killer_game_app/providers/game_provider.dart';
import 'package:neon_widgets/neon_widgets.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:killer_game_app/providers/theme.dart';

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
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: (themeMode == ThemeMode.dark ? Colors.white: Color(0x212121)),
      body: GestureDetector(
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
              Color.fromARGB(255, 181, 0, 0),
              Color.fromARGB(255, 161, 0, 40),
              Color.fromARGB(255, 177, 0, 80),
              Color.fromARGB(255, 149, 0, 107),
              Color.fromARGB(255, 121, 0, 148),
              Color.fromARGB(255, 26, 32, 127),
            ],
            stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            center: Alignment.topLeft,
            radius: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
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
              AppLocalizations.of(context)!.player,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: GoogleFonts.comfortaa().fontFamily,
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
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: AppLocalizations.of(context)!.click,
                      style: TextStyle(
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.white),
              ),
              onPressed: _flipCard,
              child: Text(
                AppLocalizations.of(context)!.find,
                style: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
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
              Color.fromARGB(255, 181, 0, 0),
              Color.fromARGB(255, 161, 0, 40),
              Color.fromARGB(255, 177, 0, 80),
              Color.fromARGB(255, 149, 0, 107),
              Color.fromARGB(255, 121, 0, 148),
              Color.fromARGB(255, 26, 32, 127),
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
              AppLocalizations.of(context)!.target,
              style: TextStyle(
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 70,
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.white),
              ),
              onPressed: _flipCard,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.ok,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: GoogleFonts.comfortaa().fontFamily,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
