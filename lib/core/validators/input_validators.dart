class InputValidator {
  static String? emptyValidator({String? value, int? minCharacters = 6}) {
    if (value == null || value.isEmpty) return 'Required field';
    if (value.trim().isEmpty) return 'Required field';
    if (value.length < minCharacters!) {
      return 'Should contain minimum $minCharacters characters';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Required field';
    if (value.trim().isEmpty) return 'Required field';
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegExp.hasMatch(value)) return 'Invalid email format';

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Required field';
    if (value.trim().isEmpty) return 'Required field';
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-.,!@#\$&*~]).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      return 'Should contain: 1 upper case, 1 lower case, 1 special character, min 8 characters';
    }

    return null;
  }

  static String? numberValidator(String? value) {
    if (value == null || value.isEmpty) return 'Required field';
    if (value.trim().isEmpty) return 'Required field';

    if (double.tryParse(value) == null) {
      return 'Should be a number';
    }

    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return 'Required field';
    if (value.trim().isEmpty) return 'Required field';

    if (value.length < 6) {
      return 'Should contain minimum 6 characters';
    }

    if (double.tryParse(value) == null) {
      return 'Should be a number';
    }

    return null;
  }
}
