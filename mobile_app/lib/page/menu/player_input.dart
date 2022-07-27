import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/component/list/menu_drawer.dart';
import 'package:your_drinking_game_app/page/login/login_page.dart';

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
        actions: [
          _loginButton(context),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: menuDrawer(context),
        ),
      ),
      body: _body(context),
    );
  }

  Center _body(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(MediaQuery.of(context).orientation==Orientation.portrait) 
            ...[
              const SizedBox(height: 20),
              Flexible(
                flex: 3,
                child:  Image.asset(
                  'assets/images/Dein-Trinkspiel-Full.png',
                ), 
              ),
            ],
            Flexible(
              child: playerChips(),
            ),  
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: [ 
                  Row(
                    children: [
                      Flexible(
                        flex: 9,
                        child: _inputField,
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () => startGame(context),
                          child: const Icon(Icons.play_arrow),
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ],
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

  _loginButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.login),
      onPressed: () => _login(context),
    );
  }

  _login(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );

  TextFormField get _inputField => TextFormField(
      decoration: InputDecoration(
        labelText: 'Spieler hinzufügen',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        suffixIcon: IconButton(
          onPressed: _addPlayer,
          icon: const Icon(Icons.add),
        ),
      ),
      controller: _controller,
      autofocus: true,
      textInputAction: TextInputAction.next,
      focusNode: _playerInputField,
      onFieldSubmitted: (value) {
        _playerInputField.requestFocus();
        _addPlayer();
      },
    );
    
}
