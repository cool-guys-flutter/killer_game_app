import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/objects/user.dart';
import 'package:killer_game_app/shared_preferences/local_staorage.dart';

class UserState extends StateNotifier<User> {
  final LocalStorageService _localStorageService;

  UserState(this._localStorageService) : super(User(isNew: true)) {
    loadUser();
  }

  Future<void> loadUser() async {
    state = await _localStorageService.getUser();
  }

  bool getUserNewness() {
    return state.isNew;
  }

  void userReadRules() {
    state.notNew();
    _localStorageService.userReadRules();
  }
}

final userProvider = StateNotifierProvider<UserState, User>((ref) {
  final localStorageService = ref.watch(localStorageServiceProvider);
  return UserState(localStorageService);
});
