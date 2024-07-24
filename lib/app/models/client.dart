import 'package:hive/hive.dart';

part 'client.g.dart';

@HiveType(typeId: 2)
class Client extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String middleName;

  @HiveField(2)
  String surname;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String telegram;

  @HiveField(5)
  String email;

  @HiveField(6)
  String comment;

  bool isNotEmpty() {
    return name.isNotEmpty && middleName.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty;
  }

  void copy(Client client) {
    name = client.name;
    middleName = client.middleName;
    surname = client.surname;
    phone = client.phone;
    telegram = client.telegram;
    email = client.email;
    comment = client.comment;
  }

  static Client create({Client? from}) {
    if (from != null) {
      return Client(
        name: from.name,
        middleName: from.middleName,
        surname: from.surname,
        phone: from.phone,
        telegram: from.telegram,
        email: from.email,
        comment: from.comment,
      );
    }
    return Client(name: '', middleName: '', surname: '', phone: '', telegram: '', email: '', comment: '');
  }

  void clean() {
    name = '';
    middleName = '';
    surname = '';
    phone = '';
    telegram = '';
    email = '';
    comment = '';
  }

  Client({
    required this.name,
    required this.middleName,
    required this.surname,
    required this.phone,
    required this.telegram,
    required this.email,
    required this.comment,
  });
}
