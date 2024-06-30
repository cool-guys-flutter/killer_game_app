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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 240,
          ),
          Text(
            "THE GAME IS ON",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 330,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            },
            child: Text(
              'FINISH!',
              style: TextStyle(
                height: 2,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
