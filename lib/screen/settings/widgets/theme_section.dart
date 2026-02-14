import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/theme/theme_provider.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: themeProvider.isDark,
      onChanged: (_) => themeProvider.toggleTheme(),
    );
  }
}
