import 'package:finance_app/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          height: 80,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 1.4, color: Theme.of(context).hintColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Dark Mode",
                style: Theme.of(context).primaryTextTheme.headlineMedium,
              ),
              Switch(
                value: themeData.getTheme() == themeData.darkTheme,
                onChanged: (value) {
                  themeData.toggleThemeMode();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
