import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 51, 61, 246),
              Color.fromARGB(255, 172, 0, 211),
              Color.fromARGB(255, 228, 0, 163),
              Color.fromARGB(255, 255, 0, 115),
              Color.fromARGB(255, 255, 0, 64),
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 255, 0, 64),
              Color.fromARGB(255, 255, 0, 115),
              Color.fromARGB(255, 228, 0, 163),
              Color.fromARGB(255, 172, 0, 211),
              Color.fromARGB(255, 51, 61, 246),
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
              SvgPicture.asset("assets/circle.svg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
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
