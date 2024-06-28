import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetupPage extends ConsumerStatefulWidget {
  SetupPage({super.key});

  @override
  ConsumerState<SetupPage> createState() => _SetupPage();
}

class _SetupPage extends ConsumerState<SetupPage> {
  List<TextFormField> playersList = List.empty(growable: true);

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SvgPicture.asset('assets/players.svg'),
              SizedBox(
                height: 10,
              ),
              Text(
                'NUMBER OF PLAYERS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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

                        playersList.add(
                          TextFormField(
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
                height: 300,
                width: 250,
                child: playersList.isEmpty
                    ? Text(
                        'Add players to start game',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    : Expanded(
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
                  shape: StadiumBorder(),
                  side: BorderSide(width: 2, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/distribution");
                },
                child: Text(
                  'START',
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
