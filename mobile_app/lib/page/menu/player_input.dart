import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/component/list/menu_drawer.dart';

import '../game/card_display.dart';

class PlayerInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  final FocusNode _playerInputField = FocusNode();
  final List<String> _players = [];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spieler Auswahl"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: menuDrawer(context),
        ),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(), 
              Flexible(
                flex: 3,
                child:  Image.asset(
                  'assets/images/Dein-Trinkspiel-Full.png',
                ), 
              ),
              Flexible(
                child: playerChips(),
              ),  
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Flexible(
                      flex: 9,
                      child: _inputField,
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () => startGame(context),
                        icon: const Icon(Icons.play_arrow),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget playerChips() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
       Wrap(
        spacing: 6.0, 
        runSpacing: 6.0,
        children: List<Widget>.generate(
          _players.length,
          (index) {
            return Chip(
              label: Text(_players[index]),
              onDeleted: () {
                setState(() {
                  _players.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      ]
    );
  }

  void _addPlayer() {
    final input = _controller.value.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        _players.add(input);
        _controller.clear();
      });
    }
  }

  void startGame(BuildContext context) {
    _addPlayer();
    if (_players.length >= 2) {
      Navigator.pushNamed(context, CardDisplay.routeName, arguments: _players);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Füge mindestens 2 Spieler hinzu"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  TextFormField get _inputField => TextFormField(
      decoration: InputDecoration(
        labelText: 'Spieler hinzufügen',
        suffixIcon: IconButton(
          onPressed: _addPlayer,
          icon: const Icon(Icons.add),
        ),
      ),
      controller: _controller,
      maxLength: 10,
      autofocus: true,
      textInputAction: TextInputAction.next,
      focusNode: _playerInputField,
      onFieldSubmitted: (value) {
        _playerInputField.requestFocus();
        _addPlayer();
      },
    );
    
}
