import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:killer_game_app/ui/pages/main_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Убедитесь, что путь правильный

void main() {
  testWidgets('MainPage golden test', (WidgetTester tester) async {
    // Оберните ваш виджет в ProviderScope
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('ru', '') // Добавьте нужные локали
            // Другая поддерживаемая локаль
          ],
          home: MainPage(),
        ),
      ),
    );

    // Захват изображения
    await expectLater(
      find.byType(MainPage),
      matchesGoldenFile('golden_files/main_page_golden.png'),
    );
  });
}
