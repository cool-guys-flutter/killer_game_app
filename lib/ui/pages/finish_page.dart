import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:killer_game_app/providers/theme.dart';

class FinishPage extends ConsumerStatefulWidget {
  FinishPage({super.key});

  @override
  ConsumerState<FinishPage> createState() => _FinishPage();
}

class _FinishPage extends ConsumerState<FinishPage> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor:
          (themeMode == ThemeMode.dark ?  Colors.white: Color(0x212121)),
      body: Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 240,
          ),
          Text(
            AppLocalizations.of(context)!.game_on,
            style: TextStyle(
              color: (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 40,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 330,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: (themeMode == ThemeMode.dark ? Colors.black : Colors.white)),
            ),
            onPressed: () => Navigator.of(context).pushNamed("/"),
            child: Text(
              AppLocalizations.of(context)!.finish,
              style: TextStyle(
                height: 2,
                color: (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 30,
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
