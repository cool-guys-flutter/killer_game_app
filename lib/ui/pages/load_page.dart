import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/providers/user_provider.dart';

class LoadPage extends ConsumerStatefulWidget {
  LoadPage({super.key});

  @override
  ConsumerState<LoadPage> createState() => _LoadPage();
}

class _LoadPage extends ConsumerState<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (ref.read(userProvider.notifier).getUserNewness()) {
        Navigator.of(context).pushNamed("/hello");
      } else {
        Navigator.of(context).pushNamed("/");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Icon(Icons.h_mobiledata, size: 300, color: Colors.white),
        ])),
      ),
    );
  }
}
