import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/objects/game.dart';

class GameState extends StateNotifier<KillerGame> {
  GameState() : super(KillerGame());

  late List<String> playersRemain;
  late String currentPlayer;

  void addPlayer(String name) {
    state.addPlayer(name);
  }

  void startGame() {
    state.startGame();
  }

  void endGame() {
    state.endGame();
  }

  List<String> getPlayers() {
    return state.players;
  }

  String getTarget(String name)  {
    return state.getTarget(name);
  }

  void distributeTargets() {
    state.distributeTargets();
    playersRemain = state.players;
    currentPlayer = playersRemain.first;
  }

  String getNextPlayer() {
    if (playersRemain.isEmpty) {
      return 'None';
    } else {
      currentPlayer = playersRemain.first;
      playersRemain.removeAt(0);
      return currentPlayer;
    }
  }

  String getCurrentPlayer() {
    return currentPlayer;
  }
}

final gameProvider = StateNotifierProvider<GameState, KillerGame>((ref) {
  return GameState();
});