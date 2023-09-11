abstract class Validator {
  bool validate(String value);
}

class EmailValidator implements Validator {
  @override
  bool validate(String value) {
    if (value.trim().isEmpty || !value.contains('@')) {
      return true;
    }
    return false;
  }
}

class FieldRequiredValidator implements Validator {
  @override
  bool validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }
}

class PasswordValidator implements Validator {
  @override
  bool validate(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (regex.hasMatch(value)) {
      return false;
    }
    return true;
  }
}

class PasswordMatcher {
  bool validate(String value1, String value2) {
    if (value1 == value2) {
      return true;
    }
    return false;
  }
}
