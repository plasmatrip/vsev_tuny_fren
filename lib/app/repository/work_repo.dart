import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/utils.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';

const List<String> periods = ['10:00—11:00', '11:00—12:00', '12:00—13:00', '13:00—14:00', '14:00—15:00', '15:00—16:00'];

const List<int> times = [11, 12, 13, 14, 15, 16];

const List<String> workType = ['Все', 'Завершённые', 'Предстоящие'];

enum WorkTypes { all, completed, uncompleted }

class WorkRepo with ChangeNotifier {
  Box repo = Hive.box<Work>(Boxes.work);

  Work _work = Work.create();

  bool editMode = false;
  int editKey = 0;

  String _searchString = '';
  String get searchString => _searchString;
  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

  int _selectedWorkType = 0;
  int get selectedWorkType => _selectedWorkType;
  set selectedWorkType(int value) {
    _selectedWorkType = value;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  String get name => _work.name;
  set name(String value) {
    _work.name = value;
    notifyListeners();
  }

  String get comment => _work.comment;
  set comment(String value) {
    _work.comment = value;
    notifyListeners();
  }

  int? get time => _work.time;
  set time(int? value) {
    _work.time = value;
    notifyListeners();
  }

  DateTime? get date => _work.date;
  set date(DateTime? value) {
    _work.date = value;
    notifyListeners();
  }

  Employee? get employee => _work.employee != null ? _work.employee!.last as Employee : null;
  set employee(Employee? value) {
    _work.employee ??= HiveList(Hive.box<Employee>(Boxes.employee));
    if (_work.employee!.isNotEmpty) {
      _work.employee!.clear();
    }
    _work.employee!.add(value!);
    notifyListeners();
  }

  Client? get client => _work.client != null ? _work.client!.last as Client : null;
  set client(Client? value) {
    _work.client ??= HiveList(Hive.box<Client>(Boxes.client));
    if (_work.client!.isNotEmpty) {
      _work.client!.clear();
    }
    _work.client!.add(value!);
    notifyListeners();
  }

  void clean() {
    _work.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Work work = repo.get(editKey);
      work.copy(_work);
    } else {
      Work work = Work.create(from: _work);
      repo.add(work);
    }
    clean();
    notifyListeners();
  }

  Future<void> delete({int? key}) async {
    if (key == null) {
      if (editMode) {
        key = editKey;
      } else {
        return;
      }
    }
    Work work = repo.get(key);
    work.delete();
    notifyListeners();
  }

  void edit(int key) {
    _work.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _work.isNotEmpty();
  }

  List<int> busyTime(DateTime date, Employee employee) {
    final Iterable busyTime = repo.values
        .where((element) => ((element as Work).employee!.last as Employee).key == employee.key)
        .where((element) => datesIsEqual((element as Work).date, date));
    return List<int>.generate(busyTime.length, (int i) => (busyTime.elementAt(i) as Work).time!);
  }

  Iterable works() {
    Iterable works = repo.values.where((element) => datesIsEqual((element as Work).date, _selectedDate));
    if (_selectedWorkType == WorkTypes.completed.index) {
      if (datesIsEqual(DateTime.now(), _selectedDate)) {
        works = works.where((element) => times[(element as Work).time!] < TimeOfDay.now().hour);
      } else if (dateIsAfter(_selectedDate, DateTime.now())) {
        works = [];
      }
    } else if (_selectedWorkType == WorkTypes.uncompleted.index) {
      if (datesIsEqual(DateTime.now(), _selectedDate)) {
        works = works.where((element) => times[(element as Work).time!] > TimeOfDay.now().hour);
      } else if (dateIsBefore(_selectedDate, DateTime.now())) {
        works = [];
      }
    }
    return works;
  }
}
