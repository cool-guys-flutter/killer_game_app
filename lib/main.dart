import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/pages/hello_page.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/setup_page.dart';
import 'ui/pages/history_page.dart';
import 'ui/pages/distribution_page.dart';
import 'ui/pages/finish_page.dart';

import 'providers/user_provider.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerStatefulWidget {
  MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Killer Game",
        initialRoute: (ref.read(userProvider.notifier).getUserNewness()) ? "/hello" : "/",
        routes: {
          "/": (context) =>  MainPage(),
          "/hello": (context) => HelloPage(),
          "/setup": (context) => SetupPage(),
          "/history": (context) => HistoryPage(),
          "/distribution": (context) => DistributionPage(),
          "/finish": (context) => FinishPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.josefinSansTextTheme(
            
          ),
        ),
      ),
    );
  }
}
