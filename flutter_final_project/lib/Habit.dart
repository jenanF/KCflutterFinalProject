class Habit {
  String name;
  int timeSpent;
  int timeGoal;
  bool isDone;
  bool isPaused;

  Habit(
      {required this.isDone,
      required this.name,
      required this.timeGoal,
      required this.timeSpent,
      required this.isPaused});
}
