import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/pages/hello_page.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/setup_page.dart';
import 'ui/pages/history_page.dart';
import 'ui/pages/distribution_page.dart';
import 'ui/pages/finish_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Killer Game",
        initialRoute: "/",
        routes: {
          "/": (context) =>  MainPage(),
          "/hello": (context) => HelloPage(),
          "/setup": (context) => SetupPage(),
          "/history": (context) => HistoryPage(),
          "/distribution": (context) => DistributionPage(),
          "/finish": (context) => FinishPage(),
        },
      ),
    );
  }
}
