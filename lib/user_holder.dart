import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void register(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    print(user);

    if (users.containsKey(user.login)) {
      throw Exception('Такой пользователь уже существует');
    }

    users[user.login] = user;
  }

  User registerUserByEmail(String fullName, String email) {
    User newUser = User(name: fullName, email: email);

    if (users.containsKey(newUser.login)) {
      throw Exception('A user with this email already exists');
    } else if (!email.contains('@')) {
        throw Exception('Invalid email');
    }
    users[newUser.login] = newUser;
    return newUser;
  }

  User getUserByLogin(String login) {
      return users[login];
  }
}
