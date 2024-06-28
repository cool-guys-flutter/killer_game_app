import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/objects/game.dart';

class GameState extends StateNotifier<KillerGame> {
  GameState() : super(KillerGame());

  void addPlayer(String name) {
    state.addPlayer(name);
  }

  List<String> getPlayers() {
    return state.players;
  }

  String getTarget(String name)  {
    return state.getTarget(name);
  }
}

final gameProvider = StateNotifierProvider<GameState, KillerGame>((ref) {
  return GameState();
});