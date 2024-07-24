import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';

class ClientRepo with ChangeNotifier {
  Box repo = Hive.box<Client>(Boxes.client);

  Client _client = Client.create();

  bool editMode = false;
  int editKey = 0;

  String get name => _client.name;
  set name(String value) {
    _client.name = value;
    notifyListeners();
  }

  String get middleName => _client.middleName;
  set middleName(String value) {
    _client.middleName = value;
    notifyListeners();
  }

  String get surname => _client.surname;
  set surname(String value) {
    _client.surname = value;
    notifyListeners();
  }

  String get phone => _client.phone;
  set phone(String value) {
    _client.phone = value;
    notifyListeners();
  }

  String get telegram => _client.telegram;
  set telegram(String value) {
    _client.telegram = value;
    notifyListeners();
  }

  String get email => _client.email;
  set email(String value) {
    _client.email = value;
    notifyListeners();
  }

  String get comment => _client.comment;
  set comment(String value) {
    _client.comment = value;
    notifyListeners();
  }

  void clean() {
    _client.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Client client = repo.get(editKey);
      client.copy(_client);
    } else {
      Client client = Client.create(from: _client);
      repo.add(client);
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
    Client client = repo.get(key);
    client.delete();
    notifyListeners();
  }

  void edit(int key) {
    _client.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _client.isNotEmpty();
  }

  Iterable clients() {
    return repo.values;
  }
}
