import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:killer_game_app/providers/user_provider.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 51, 61, 246).withOpacity(0.75),
              Color.fromARGB(255, 172, 0, 211).withOpacity(0.75),
              Color.fromARGB(255, 228, 0, 163).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 115).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 64).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 0).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 64).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 115).withOpacity(0.75),
              Color.fromARGB(255, 228, 0, 163).withOpacity(0.75),
              Color.fromARGB(255, 172, 0, 211).withOpacity(0.75),
              Color.fromARGB(255, 51, 61, 246).withOpacity(0.75),
            ],
            stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
            center: Alignment.topRight,
            radius: 2.0,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              DropShadow(
                child: SvgPicture.asset("assets/images/aims.svg"),
                color: Color(0xffFF0B4C),
                opacity: 0.3,
                blurRadius: 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    'KILLER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(width: 2, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/setup");
                    },
                    child: Text(
                      'NEW GAME',
                      style: TextStyle(
                        height: 2,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/hello");
                    },
                    child: Text(
                      'RULES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
