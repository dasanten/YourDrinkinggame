import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/main.dart';
import 'package:your_drinking_game_app/page/game_setup/player_input.dart';
import 'package:your_drinking_game_app/page/tab/card_sets_tab_view.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  void selectPage(int index) {
    if (index == 0) {
      emit(MenuInitial());
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => PlayerInput(),
          ),
          (route) => false);
    } else {
      emit(MenuCardSets());
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => CardSetsTabView(),
          ),
          (route) => false);
    }
  }
}
