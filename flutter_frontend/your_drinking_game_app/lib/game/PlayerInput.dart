import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/cardSetsView/CardSetsTabView.dart';

import 'CardDisplay.dart';

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
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              child: Image.asset(
                'assets/images/Dein-Trinkspiel-Full.png',
              ),     
            ),
            ListTile(
              title: const Text("Kartensets",
                style: TextStyle(
                  fontSize: 17
                ),),
              trailing: const Icon(Icons.folder),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => CardSetsTabView()),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Feedback !IN DEVELOPMENT!",
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              trailing: const Icon(Icons.note),
              onTap: () {}
            ),
            const Divider(),
            ListTile(
              title: const Text("Optionen !IN DEVELOPMENT!",
                style: TextStyle(
                  fontSize: 17
                ),),
              trailing: const Icon(Icons.settings),
              onTap: () {}
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
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
                      child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Spieler hinzufügen',
                        border: OutlineInputBorder(),
                      ),
                      controller: _controller,
                      maxLength: 10,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      focusNode: _playerInputField,
                      onFieldSubmitted: (value) {
                        _playerInputField.requestFocus();
                        addPlayer();
                      },
                    ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: addPlayer,
                        icon: const Icon(Icons.add),
                      ),
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

  void addPlayer() {
    final input = _controller.value.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        _players.add(input);
      _controller.text = "";
      });
    }
  }

  void startGame(BuildContext context) {
    addPlayer();
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
}
