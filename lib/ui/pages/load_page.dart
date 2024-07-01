import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:killer_game_app/providers/user_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
      backgroundColor: Color(0x212121),
      body: Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            'assets/images/logo_load.svg',
            width: 150,
            height: 150,
            semanticsLabel: "logo",
          ),
        ])),
      ),
    );
  }
}
