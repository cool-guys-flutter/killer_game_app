import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:killer_game_app/ui/pages/hello_page.dart';
import 'package:killer_game_app/ui/pages/history_page.dart';
import 'package:killer_game_app/ui/pages/load_page.dart';

import 'package:killer_game_app/ui/pages/main_page.dart';

void main() {
  testWidgets('MainPage Test', (WidgetTester test) async {
    await test.pumpWidget(MaterialApp(
      home: HistoryPage(),
    ));

    expect(find.text("Game History"),
      findsOne
    );
  });
}
