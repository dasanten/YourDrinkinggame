import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/option_viewmodel.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Optionen"),
      ),
      body: Consumer<OptionViewModel>(
        builder: (context, value, child) => Column(
          children: [
            Divider(),
            Center(
              child: ToggleButtons(
                children: ThemeMode.values
                    .map(
                      (themeMode) => MaterialButton(
                        onPressed: () => context
                            .read<OptionViewModel>()
                            .themeMode = themeMode,
                        child: Text(themeMode.name),
                        color:
                            themeMode == value.themeMode ? Colors.green : null,
                      ),
                    )
                    .toList(),
                isSelected:
                    ThemeMode.values.map((e) => e == value.themeMode).toList(),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
