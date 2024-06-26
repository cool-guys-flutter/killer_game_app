// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:killer_game_app/providers/game_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetupPage extends ConsumerStatefulWidget {
  SetupPage({super.key});

  @override
  ConsumerState<SetupPage> createState() => _SetupPage();
}

class _SetupPage extends ConsumerState<SetupPage> {
  List<TextFormField> playersList = List.empty(growable: true);
  List<TextEditingController> controllers = List.empty(growable: true);

  TextEditingController _controller = TextEditingController();

  final String key = "game";

  Future<void> setRunGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', 'yes');
  }

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 0, 0).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 64).withOpacity(0.75),
              Color.fromARGB(255, 255, 0, 115).withOpacity(0.75),
              Color.fromARGB(255, 228, 0, 163).withOpacity(0.75),
              Color.fromARGB(255, 172, 0, 211).withOpacity(0.75),
              Color.fromARGB(255, 51, 61, 246).withOpacity(0.75),
            ],
            stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            center: Alignment.topLeft,
            radius: 2.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.settings,
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SvgPicture.asset('assets/players.svg'),
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.num_players,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton(
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(width: 2, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(_controller.text);
                          if (currentValue > 0) {
                            currentValue--;
                            _controller.text = currentValue.toString();
                          }
                        });
                        playersList.remove(playersList.last);
                        controllers.remove(controllers.last);
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        readOnly: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(width: 2, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          int currentValue = int.parse(_controller.text);
                          currentValue++;
                          _controller.text = currentValue.toString();
                        });
                        controllers.add(TextEditingController());
                        playersList.add(
                          TextFormField(
                            controller: controllers.last,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(126, 70, 63, 63),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 275,
                width: 300,
                child: playersList.isEmpty
                    ? Text(
                        AppLocalizations.of(context)!.rule_add,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: GoogleFonts.comfortaa().fontFamily,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    : SizedBox(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: playersList.length,
                          itemBuilder: (context, index) => getRow(index),
                        ),
                      ),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  shape: StadiumBorder(),
                  side: BorderSide(width: 2, color: Colors.white),
                ),
                onPressed: () {
                  if (controllers.length > 2) {
                    setRunGame();
                    for (var contr in controllers) {
                      ref.read(gameProvider.notifier).addPlayer(contr.text);
                    }
                    Navigator.pushNamed(context, "/distribution");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          AppLocalizations.of(context)!.rules_3,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.start,
                  style: TextStyle(
                    height: 2,
                    fontFamily: GoogleFonts.comfortaa().fontFamily,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Column(children: <Widget>[
      playersList[index],
      Divider(
        color: Colors.transparent,
      )
    ]);
  }
}
