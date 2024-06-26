import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/ui/pages/load_page.dart';

import 'ui/pages/hello_page.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/setup_page.dart';
import 'ui/pages/history_page.dart';
import 'ui/pages/distribution_page.dart';
import 'ui/pages/finish_page.dart';

import 'providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:killer_game_app/providers/theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(userProvider);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Killer Game",
        initialRoute: "/load",
        routes: {
          "/load": (context) => LoadPage(),
          "/": (context) => MainPage(),
          "/hello": (context) => HelloPage(),
          "/setup": (context) => SetupPage(),
          "/history": (context) => HistoryPage(),
          "/distribution": (context) => DistributionPage(),
          "/finish": (context) => FinishPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.playTextTheme(),
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ru'), // Russian
        ],
      ),
    );
  }
}
