import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/user_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HelloPage extends ConsumerStatefulWidget {
  HelloPage({super.key});

  @override
  ConsumerState<HelloPage> createState() => _HelloPage();
}

class _HelloPage extends ConsumerState<HelloPage> {
  final controller = PageController(initialPage: 0);
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Killer Game',
              style: TextStyle(color: Colors.white)),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff212121),
        ),
        backgroundColor: Color(0xff212121),
        body: Center(
          child: Container(
            child: PageView(
                onPageChanged: (index) => {
                      setState(() {
                        currentPage = index + 1;
                      })
                    },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/phone.svg',
                        width: 400,
                        height: 400,
                        semanticsLabel: "Phone",
                      ),
                      SizedBox(
                        width: 329,
                        height: 120,
                        child: Text(
                          'KILLER IS A GAME THAT WILL TEST YOUR STEALTH',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Josefin Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 333,
                          height: 86,
                          child: Text(
                            "THE GAME WILL REQUIRE THIS PHONE AND AT LEAST THREE PEOPLE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Playwrite NG Modern',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/aim.svg',
                        width: 300,
                        height: 300,
                        semanticsLabel: "Aim",
                      ),
                      SizedBox(
                        width: 329,
                        height: 120,
                        child: Text(
                          'KILLER IS A GAME THAT WILL TEST YOUR STEALTH',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Josefin Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 333,
                          height: 86,
                          child: Text(
                            "THE GAME WILL REQUIRE THIS PHONE AND AT LEAST THREE PEOPLE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Playwrite NG Modern',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.abc, size: 100),
                      Text("Page $currentPage"),
                      ElevatedButton(
                          onPressed: () {
                            ref.read(userProvider.notifier).userReadRules();
                            Navigator.of(context).pushNamed("/");
                          },
                          child: const Text("Continue!"))
                    ],
                  ),
                ]),
          ),
        ));
  }
}
