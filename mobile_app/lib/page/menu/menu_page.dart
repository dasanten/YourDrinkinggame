import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/page/menu/menu_cubit.dart';

NavigationBar menuNavigationBar(BuildContext context) => NavigationBar(
      onDestinationSelected: (value) {
        context.read<MenuCubit>().selectPage(value);
      },
      selectedIndex: context.read<MenuCubit>().state.index,
      destinations: [
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.card_giftcard),
          icon: Icon(Icons.home_outlined),
          label: 'CardSet',
        ),
      ],
    );
