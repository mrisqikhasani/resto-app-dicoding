import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/services/workmanager_service.dart';

class ReminderProvider extends ChangeNotifier {
  final WorkmanagerService workmanagerService;

  bool _isOn = false;
  bool get isOn => _isOn;

  ReminderProvider(this.workmanagerService);

  Future<void> toggle(bool value) async {
  _isOn = value;
  notifyListeners();

  if (value) {
    await workmanagerService.runDailyReminderTask();
  } else {
    await workmanagerService.cancelAllTask();
  }
}
}
