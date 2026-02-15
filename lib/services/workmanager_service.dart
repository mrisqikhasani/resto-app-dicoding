import 'package:resto_app_dicoding/services/background_services.dart';
import 'package:workmanager/workmanager.dart';

const String dailyTaskName = "dailyReminderTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    print("🔥 CALLBACK TRIGGERED: $task");

    if (task == dailyTaskName) {
      await BackgroundService.runDailyTask();
    }

    return Future.value(true);
  });
}

class WorkmanagerService {
  final Workmanager _workmanager = Workmanager();

  /// Register periodic daily reminder
  Future<void> runDailyReminderTask() async {
    await _workmanager.registerPeriodicTask(
      "dailyReminderUnique", // unique name
      dailyTaskName, // MUST match callback
      frequency: const Duration(minutes: 15), 
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );

    print("✅ Daily reminder task registered");
  }

  /// Cancel all background tasks
  Future<void> cancelAllTask() async {
    await _workmanager.cancelAll();
    print("🛑 All Workmanager tasks cancelled");
  }
}
