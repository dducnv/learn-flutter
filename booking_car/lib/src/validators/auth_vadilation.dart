class AuthValidations {
  static bool isNotNull(String input) {
    return input.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  static bool isValidVnPhone(String email) {
    final emailRegExp = RegExp(r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$");
    return emailRegExp.hasMatch(email);
  }

}
