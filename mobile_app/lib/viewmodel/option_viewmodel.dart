import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_drinking_game_app/viewmodel/async_view_model_base.dart';

class OptionViewModel extends AsyncViewModelBase {
  OptionViewModel() {
    _loadTheme();
  }

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> _loadTheme() async {
    final instance = await SharedPreferences.getInstance();
    final modeIndex = instance.getInt('themeMode') ?? 0;
    _themeMode = ThemeMode.values[modeIndex];
    notifyListeners();
  }

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    SharedPreferences.getInstance()
        .then((instance) => instance.setInt('themeMode', themeMode.index));
    notifyListeners();
  }
}
