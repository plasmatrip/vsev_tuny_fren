import 'package:hive/hive.dart';

part 'employee.g.dart';

@HiveType(typeId: 3)
class Employee extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String middleName;

  @HiveField(2)
  String surname;

  @HiveField(3)
  String post;

  @HiveField(4)
  String experience;

  @HiveField(5)
  DateTime? birthday;

  @HiveField(6)
  String phone;

  @HiveField(7)
  String comment;

  @HiveField(8)
  String photo;

  bool isNotEmpty() {
    return name.isNotEmpty && middleName.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty;
  }

  void copy(Employee employee) {
    name = employee.name;
    middleName = employee.middleName;
    surname = employee.surname;
    phone = employee.phone;
    experience = employee.experience;
    post = employee.post;
    birthday = employee.birthday;
    comment = employee.comment;
    photo = employee.photo;
  }

  static Employee create({Employee? from}) {
    if (from != null) {
      return Employee(
        name: from.name,
        middleName: from.middleName,
        surname: from.surname,
        phone: from.phone,
        experience: from.experience,
        post: from.post,
        birthday: from.birthday,
        photo: from.photo,
        comment: from.comment,
      );
    }
    return Employee(name: '', middleName: '', surname: '', phone: '', experience: '', post: '', comment: '', photo: '');
  }

  void clean() {
    name = '';
    middleName = '';
    surname = '';
    phone = '';
    experience = '';
    post = '';
    birthday = null;
    comment = '';
    photo = '';
  }

  Employee({
    required this.name,
    required this.middleName,
    required this.surname,
    required this.phone,
    required this.experience,
    required this.post,
    required this.comment,
    required this.photo,
    this.birthday,
  });
}
