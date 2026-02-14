import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/Notification/reminder_provider.dart';

class ReminderSection extends StatefulWidget {
  const ReminderSection({super.key});

  @override
  State<ReminderSection> createState() => _ReminderSectionState();
}

class _ReminderSectionState extends State<ReminderSection> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReminderProvider>();

    return Column(
      children: [
        SwitchListTile(
          title: const Text('Daily Reminder'),
          subtitle: Text('Jam ${provider.time.format(context)}'),
          value: provider.isOn,
          onChanged: provider.toggle,
        ),

        ListTile(
          title: const Text('Pilih Waktu'),
          trailing: Text(provider.time.format(context)),
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: provider.time,
            );

            if (picked != null) {
              provider.updateTime(picked);
            }
          },
        ),

        ListTile(
          title: const Text('Check Pending Notification'),
          trailing: const Icon(Icons.notifications),
          onTap: () async {
            await provider.checkPendingNotificationRequests(context);

            if (!context.mounted) return;

            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  '${provider.pendingNotificationRequests.length} Pending Notifications',
                ),
                content: SizedBox(
                  height: 300,
                  width: 300,
                  child: ListView.builder(
                    itemCount:
                        provider.pendingNotificationRequests.length,
                    itemBuilder: (context, index) {
                      final item =
                          provider.pendingNotificationRequests[index];

                      return ListTile(
                        title: Text(item.title ?? ''),
                        subtitle: Text(item.body ?? ''),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await provider.cancel(item.id);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
