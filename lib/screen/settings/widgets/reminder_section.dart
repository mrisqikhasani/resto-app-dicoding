import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/Notification/reminder_provider.dart';

class ReminderSection extends StatelessWidget {
  const ReminderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReminderProvider>();

    return Column(
      children: [
        SwitchListTile(
          title: const Text('Daily Reminder'),
          subtitle: const Text(
            'Aktifkan untuk mendapatkan rekomendasi restoran setiap hari',
          ),
          value: provider.isOn,
          onChanged: provider.toggle,
        ),
      ],
    );
  }
}
