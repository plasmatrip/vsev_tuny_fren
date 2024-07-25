import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';

class EmployeeRepo with ChangeNotifier {
  Box repo = Hive.box<Employee>(Boxes.employee);

  Employee _employee = Employee.create();

  bool editMode = false;
  int editKey = 0;

  String get name => _employee.name;
  set name(String value) {
    _employee.name = value;
    notifyListeners();
  }

  String get middleName => _employee.middleName;
  set middleName(String value) {
    _employee.middleName = value;
    notifyListeners();
  }

  String get surname => _employee.surname;
  set surname(String value) {
    _employee.surname = value;
    notifyListeners();
  }

  String get phone => _employee.phone;
  set phone(String value) {
    _employee.phone = value;
    notifyListeners();
  }

  String get experience => _employee.experience;
  set experience(String value) {
    _employee.experience = value;
    notifyListeners();
  }

  String get post => _employee.post;
  set post(String value) {
    _employee.post = value;
    notifyListeners();
  }

  String get comment => _employee.comment;
  set comment(String value) {
    _employee.comment = value;
    notifyListeners();
  }

  String get photo => _employee.photo;
  set photo(String value) {
    _employee.photo = value;
    notifyListeners();
  }

  DateTime? get birthday => _employee.birthday;
  set birthday(DateTime? value) {
    _employee.birthday = value;
    notifyListeners();
  }

  void clean() {
    _employee.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Employee employee = repo.get(editKey);
      employee.copy(_employee);
    } else {
      Employee employee = Employee.create(from: _employee);
      repo.add(employee);
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
    Employee employee = repo.get(key);
    employee.delete();
    notifyListeners();
  }

  void edit(int key) {
    _employee.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _employee.isNotEmpty();
  }

  Iterable employees({String? serarchString}) {
    serarchString ??= '';
    return repo.values
        .where((element) => serarchString!.isEmpty ? true : ((element as Employee).name.contains(serarchString) || element.surname.contains(serarchString)));
  }
}
