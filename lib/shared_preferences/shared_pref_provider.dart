import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FirstLaunchProvider {
  static const String firstLaunchKey = "first_launch";

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(firstLaunchKey);
  }

  static Future<void> markAsLaunched() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(firstLaunchKey, true);
    print("Marked as launched");
  }
}