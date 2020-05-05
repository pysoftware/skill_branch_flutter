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

  User registerUserByPhone(String fullName, String phone) {
    User newUser = User(name: fullName, email: phone);
    String pattern = r"^(?:[+0])?[0-9]{11}";
    phone = phone.replaceAll(RegExp('[^+\\d]'), "");
    if (users.containsKey(newUser.login)) {
      throw Exception('A user with this phone already exists');
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter a valid phone number starting with a + and containing 11 digits");
    } else if (phone == null || phone.isEmpty) {
      throw Exception('Enter don\'t empty phone number');
    }
    users[newUser.login] = newUser;
    return newUser;
  }

  void setFriends(String login, List<User> friends) {
    User user = users[login];
    user.friends.addAll(friends);
  }

  User findUserInFriends(String login, User friend) {
    User user = users[login];

    if (!user.friends.contains(friend)) {
      throw Exception("${user.login} is not a friend of the login");
    }

    return user.friends.where((item) => item == friend).first;
  }

  List<User> importUsers(List<String> dataList) {
    List<User> usersData = [];
    for (var item in dataList) {
      List<String> userData = item.split(';').map((item) => item.trim()).toList();
      User user =
          User(name: userData[0], phone: userData[2], email: userData[1]);
      usersData.add(user);
    }

    return usersData;
  }

  User getUserByLogin(String login) {
    return users[login];
  }
}
