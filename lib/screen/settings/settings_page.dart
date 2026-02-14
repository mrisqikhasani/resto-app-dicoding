import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/screen/settings/widgets/reminder_section.dart';
import 'package:resto_app_dicoding/screen/settings/widgets/theme_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ThemeSection(),
          Divider(),
          ReminderSection(),
        ],
      ),
    );
  }
}
