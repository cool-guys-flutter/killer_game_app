 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/user_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelloPage extends ConsumerStatefulWidget {
  HelloPage({super.key});

  @override
  ConsumerState<HelloPage> createState() => _HelloPage();
}

class _HelloPage extends ConsumerState<HelloPage> {
  final controller = PageController(initialPage: 0);
  int currentPage = 1;
  final int _pageCount = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.greating,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          AppLocalizations.of(context)!.rule_1,
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
                      SvgPicture.asset(
                        'assets/images/gun.svg',
                        width: 300,
                        height: 300,
                        semanticsLabel: "Gun",
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
                      SvgPicture.asset(
                        'assets/images/silence.svg',
                        width: 300,
                        height: 300,
                        semanticsLabel: "Silence",
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
                      SvgPicture.asset(
                        'assets/images/new_target.svg',
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
                      SvgPicture.asset(
                        'assets/images/winner.svg',
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
                          )),
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
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pageCount, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ),
    
        );
  }
}
// class HelloPage extends StatefulWidget {
//   @override
//   _HelloPage createState() => _HelloPage();
// }

// class _HelloPage extends State<HelloPage> {
//   int _currentPage = 0;
//   final int _pageCount = 5; // Количество страниц

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Swipe Indicator with Dots'),
//       ),
//       body: PageView.builder(
//         itemCount: _pageCount,
//         onPageChanged: (int page) {
//           setState(() {
//             _currentPage = page;
//           });
//         },
//         itemBuilder: (context, index) {
//           return Center(child: Text('Page ${index + 1}'));
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(_pageCount, (index) {
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               height: 10,
//               width: 10,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _currentPage == index? Colors.blue : Colors.grey,
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }