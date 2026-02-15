import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/services/workmanager_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class ReminderProvider extends ChangeNotifier {
  final WorkmanagerService workmanagerService;


  static const _reminderKey = 'daily_reminder';
  static const _hourKey = 'reminder_hour';
  static const _minuteKey = 'reminder_minute';

  static const _uniqueName = 'dailyReminderTaskUnique';
  static const _taskName = 'dailyReminderTask';

  bool _isOn = false;
  int _hour = 11;
  int _minute = 0;

  bool get isOn => _isOn;
  TimeOfDay get time => TimeOfDay(hour: _hour, minute: _minute);

  ReminderProvider(this.workmanagerService) {
    // _load();
  }

  Future<void> toggle(bool value) async {
  _isOn = value;
  notifyListeners();

  if (value) {
    await workmanagerService.runDailyReminderTask();
  } else {
    await workmanagerService.cancelAllTask();
  }
}


  // Future<void> updateTime(TimeOfDay newTime) async {
  //   _hour = newTime.hour;
  //   _minute = newTime.minute;

  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt(_hourKey, _hour);
  //   await prefs.setInt(_minuteKey, _minute);

  //   if (_isOn) {
  //     await _scheduleTask();
  //   }

  //   notifyListeners();
  // }

  // Future<void> _load() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   _isOn = prefs.getBool(_reminderKey) ?? false;
  //   _hour = prefs.getInt(_hourKey) ?? 11;
  //   _minute = prefs.getInt(_minuteKey) ?? 0;

  //   if (_isOn) {
  //     await _scheduleTask();
  //   }

  //   notifyListeners();
  // }

  // Duration _initialDelay() {
  //   final now = DateTime.now();
  //   var scheduled = DateTime(
  //     now.year,
  //     now.month,
  //     now.day,
  //     _hour,
  //     _minute,
  //   );

  //   if (!scheduled.isAfter(now)) {
  //     scheduled = scheduled.add(const Duration(days: 1));
  //   }

  //   return scheduled.difference(now);
  // }

  // Future<void> _scheduleTask() async {
  //   final delay = _initialDelay();

  //   await Workmanager().registerPeriodicTask(
  //     _uniqueName,
  //     _taskName,
  //     frequency: const Duration(hours: 24),
  //     initialDelay: delay,
  //     existingWorkPolicy: ExistingPeriodicWorkPolicy.replace,
  //     constraints: Constraints(
  //       networkType: NetworkType.connected,
  //     ),
  //   );
  // }
}
