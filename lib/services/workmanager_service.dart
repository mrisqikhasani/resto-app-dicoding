import 'package:resto_app_dicoding/services/background_services.dart';
import 'package:workmanager/workmanager.dart';

const String dailyTaskName = "dailyReminderTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == dailyTaskName) {
      await BackgroundService.runDailyTask();
    }

    return Future.value(true);
  });
}

class WorkmanagerService {
  final Workmanager _workmanager = Workmanager();

  Future<void> runDailyReminderTask() async {
    await _workmanager.registerPeriodicTask(
      "dailyReminderUnique", 
      dailyTaskName, 
      frequency: const Duration(minutes: 15), 
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );

  }

  Future<void> cancelAllTask() async {
    await _workmanager.cancelAll();
  }
}
