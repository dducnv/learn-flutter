class Todo {
  String? title;
  DateTime? dateTime;
  bool? isSuccess;
  Todo({this.title, this.dateTime, this.isSuccess});
  String? get getTitle {
    return this.title;
  }
  void set setTitle(String title) {
    this.title = title;
  }
}
