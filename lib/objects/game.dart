import 'dart:collection';

class KillerGame {
  final List<String> players = ["Karina", "Arthur", "Arina"];
  final HashMap<String, String> targets = HashMap();
  late DateTime startTime;
  late Duration duration;

  KillerGame();

  void addPlayer(String player) {
    players.add(player);
  }

  void removePlayer(String player) {
    players.remove(player);
  }

  void startGame() {
    startTime = DateTime.now();
  }

  void endGame() {
    DateTime endTime = DateTime.now();
    duration = endTime.difference(startTime);
    print("${duration.inHours} hours, ${duration.inMinutes} minutes, ${duration.inSeconds} seconds");
  }

  void distributeTargets() {
    var playersClone = List.from(players);
    playersClone.shuffle();

    targets.clear();
    for (int i = 0; i < playersClone.length; i++) {
      targets[playersClone[i]] = playersClone[(i + 1) % playersClone.length];
    }
  }

  String getTarget(String player) {
    return targets[player]!;
  }
}


void main() {
  KillerGame game = KillerGame();
}
