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
        title: const Text('Welcome to Killer Game', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff212121),
      ),
      backgroundColor: Color(0xff212121),
      body: Center(
        child: 
        Container(
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
                    SvgPicture.asset('assets/images/phone.svg', width: 400, height: 400,semanticsLabel: "Phone",),
                
                    Text("KILLER IS A GAME THAT WILL TEST YOUR STEALTH",style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),)
                  
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.abc, size: 100),
                  Text("Page $currentPage")
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
                    child: const Text("Continue!")
                  )
                ],
              ),  
            ]     
          ),
        ),
      )
    );
  }
}