import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';

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
        title: const Text('Welcome to Killer Game'),
        automaticallyImplyLeading: false
      ),
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
                  const Icon(Icons.abc, size: 100),
                  Text("Page $currentPage")
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