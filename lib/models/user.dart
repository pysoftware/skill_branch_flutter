import 'package:FlutterGalleryApp/string_utils.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _lastName;
  String _firstName;

  LoginType _type;

  List<User> friends = <User>[];

  User._({String firstName, String lastName, String phone, String email})
      : this._firstName = firstName,
        this._lastName = lastName,
        this.email = email,
        this.phone = phone {
    print("User is created");
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (name.isEmpty) {
      throw Exception("User name is required");
    }

    if ((phone != null && phone.isEmpty) || (email != null && email.isEmpty)) {
      throw Exception("User phone or email is required");
    }

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: phone != null ? getValidatedPhone(phone) : '',
        email: email != null ? getValidatedEmail(email) : '');
  }

  static String _getFirstName(String userName) => userName.split(' ')[0];

  static String _getLastName(String userName) => userName.split(' ')[1];

  static String getValidatedPhone(String phone) {
    String pattern = r"^(?:[+0])?[0-9]{11}";
    phone = phone.replaceAll(RegExp('[^+\\d]'), "");

    if (phone == null || phone.isEmpty) {
      throw Exception("Телефон обязательное поле");
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception("Введите корректный телефон");
    }

    return phone;
  }

  static String getValidatedEmail(String email) {
    if (email == null || email.isEmpty) {
      throw Exception("Почта обязательное поле");
    }

    return email;
  }

  String get login {
    if (_type == LoginType.phone) {
      return phone;
    } else if (_type == LoginType.email) {
      return email;
    } else {
      return email;
    }
  }

  String get name => "".capitalize(_firstName) + " " + "".capitalize(_lastName);

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
  }

  void addFriends(Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }

  String get userInfo => '''
    name: $name,
    email: $email,
 
    friends: ${friends.toList()}
    ''';

  @override
  String toString() {
    return '''
    name: $name,
    email: $email,
    firstName: $_firstName,
    lastName: $_lastName
    friends: ${friends.toList()}
    ''';
  }
}
