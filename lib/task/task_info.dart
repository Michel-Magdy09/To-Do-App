class Task {
  final String name;
  bool isChecked;
  String type;
  int id;

  Task(
      {required this.name,
      this.isChecked = false,
      required this.type,
      this.id=0});

  void toggleChecked() {
    isChecked = !isChecked;
  }
}
