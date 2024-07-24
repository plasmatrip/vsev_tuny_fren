import 'package:hive/hive.dart';

part 'work.g.dart';

@HiveType(typeId: 1)
class Work extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String comment;

  @HiveField(2)
  HiveList? client;

  @HiveField(3)
  HiveList? employee;

  @HiveField(4)
  DateTime? date;

  @HiveField(5)
  int? time;

  bool isNotEmpty() {
    return name.isNotEmpty && client != null && employee != null && date != null && time != null;
  }

  void copy(Work work) {
    name = work.name;
    comment = work.comment;
    client = work.client;
    employee = work.employee;
    date = work.date;
    time = work.time;
  }

  static Work create({Work? from}) {
    if (from != null) {
      return Work(
        name: from.name,
        comment: from.comment,
        client: from.client,
        employee: from.employee,
        date: from.date,
        time: from.time,
      );
    }
    return Work(name: '', comment: '');
  }

  void clean() {
    name = '';
    comment = '';
    client = null;
    employee = null;
    date = null;
    time = null;
  }

  Work({
    required this.name,
    required this.comment,
    this.client,
    this.employee,
    this.date,
    this.time,
  });
}
