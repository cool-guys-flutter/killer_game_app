import 'package:flutter_test/flutter_test.dart';
import 'package:killer_game_app/objects/game.dart';
import 'package:killer_game_app/objects/user.dart';

bool getPlayers() {
  KillerGame game = KillerGame();
  game.addPlayer("Arthur");
  game.addPlayer("Karina");
  game.addPlayer("Arina");
  return game.players.length == 6;
}

bool userIsNew() {
  User user = User(isNew: true);
  user.notNew();
  return user.isNew == false;
}

void main() {
  group('KillerGame validation', () {
    test('Valid number of players', () {
      expect(getPlayers(), true);
    });
  });

  group('User validation', () {
    test('User came to game', () {
      expect(userIsNew(), true);
    });
  });
}