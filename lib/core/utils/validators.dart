class Validators {
  Validators._();

  static String? required(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "This field"} is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? number(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "Value"} is required';
    }
    if (num.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  static String? positiveNumber(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "Value"} is required';
    }
    final parsed = num.tryParse(value);
    if (parsed == null || parsed <= 0) {
      return 'Enter a valid number greater than 0';
    }
    return null;
  }

  static String? phone(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "Phone number"} is required';
    }
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 7) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? pincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Pincode is required';
    }
    if (value.trim().length < 4) {
      return 'Enter a valid pincode/ZIP';
    }
    return null;
  }
}
