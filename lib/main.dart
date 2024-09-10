import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/shared_preferences/shared_pref_provider.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isFirstLaunch = await FirstLaunchProvider.isFirstLaunch();
  if (isFirstLaunch) {
    await FirstLaunchProvider.markAsLaunched();
  }

  
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {

  //@override
  // void initState() {
  //   super.initState();
  //   ref.read(userProvider);
  // }

//   Future<String> checkFirstLaunch(BuildContext context) async {
//     print("i am working");
//   if (await FirstLaunchProvider.isFirstLaunch()) {
//     print("newww");
//     // Первый запуск
//     await FirstLaunchProvider.markAsLaunched();
//     return "/hello";
//   } else {
//     print("old");
//     return "/";
//   }
// }

bool? _isFirstLaunch;

  Future<void> _checkFirstLaunch() async {
    final isFirstLaunch = await FirstLaunchProvider.isFirstLaunch();
    print("Is first launch: $isFirstLaunch");
    setState(() {
      _isFirstLaunch = isFirstLaunch;
    });
    if (!isFirstLaunch) {
      await FirstLaunchProvider.markAsLaunched();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkFirstLaunch());
  }


  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Killer Game",
        // initialRoute: checkFirstLaunch(context).toString(),
        home: _isFirstLaunch == true ? HelloPage() : MainPage(),
        routes: {
          //"/load": (context) => LoadPage(),
          // "/": (context) => MainPage(),
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
