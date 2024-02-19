import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/page/login/login_page.dart';
import 'package:your_drinking_game_app/viewmodel/option_viewmodel.dart';

import '../../data_base/model/user_entity.dart';
import '../../services/user_service.dart';
import '../form/feedback/feedback_page.dart';

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
            ValueListenableBuilder<UserEntity?>(
              builder: (context, value, child) => ListTile(
                title: Text(
                  canUseWorkshop ? "Feedback" : "Für Feedback anmelden",
                  style: TextStyle(fontSize: 17),
                ),
                trailing: const Icon(Icons.note),
                onTap: canUseWorkshop
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackPage()),
                        )
                    : null,
              ),
              valueListenable: userEntity,
            ),
            Divider(),
            ListTile(
              title: const Text(
                "Login",
                style: TextStyle(fontSize: 17),
              ),
              trailing: const Icon(Icons.login),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
