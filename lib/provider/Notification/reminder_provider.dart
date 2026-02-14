import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:resto_app_dicoding/services/local_notification_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderProvider extends ChangeNotifier {
  static const _reminderKey = 'daily_reminder';
  static const _hourKey = 'reminder_hour';
  static const _minuteKey = 'reminder_minute';

  final LocalNotificationService notificationService;

  bool _isOn = false;
  int _hour = 11;
  int _minute = 0;
  int _notificationId = 1;
  bool? _permission = false;
  bool? get permission => _permission;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  bool get isOn => _isOn;
  TimeOfDay get time => TimeOfDay(hour: _hour, minute: _minute);

  ReminderProvider(this.notificationService) {
    _load();
  }

  Future<void> toggle(bool value) async {
    _isOn = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_reminderKey, value);

    if (value) {
      await notificationService.scheduleDailyReminder(
        id: _notificationId,
        hour: _hour,
        minute: _minute,
      );
    } else {
      await notificationService.cancelNotification(_notificationId);
    }
  }

  Future<void> updateTime(TimeOfDay newTime) async {
    _hour = newTime.hour;
    _minute = newTime.minute;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_hourKey, _hour);
    await prefs.setInt(_minuteKey, _minute);

    if (_isOn) {
      await notificationService.scheduleDailyReminder(
        id: _notificationId,
        hour: _hour,
        minute: _minute,
      );
    }

    notifyListeners();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();

    _isOn = prefs.getBool(_reminderKey) ?? false;
    _hour = prefs.getInt(_hourKey) ?? 11;
    _minute = prefs.getInt(_minuteKey) ?? 0;

    if (_isOn) {
      await notificationService.scheduleDailyReminder(
        id: _notificationId,
        hour: _hour,
        minute: _minute,
      );
    }

    notifyListeners();
  }

  Future<void> checkPendingNotificationRequests(BuildContext context) async {
    pendingNotificationRequests = await notificationService
        .pendingNotificationRequests();
    notifyListeners();
  }

  Future<void> cancel(int id) async {
    await notificationService.cancelNotification(id);
    // await checkPendingNotificationRequests(context);
  }
}
