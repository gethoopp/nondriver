extension StringValidate on String? {
  String? get validateEmail {
    if (this == null) {
      return null;
    }

    // if (this!.isEmpty) {
    //   return "Email tidak boleh kosong";
    // }
    if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(this!)) {
      return "Format email tidak valid";
    }

    if (this!.length < 6) {
      return "Masukkan email dengan benar";
    }

    return null;
  }

  String? get validatePassword {
    if (this == null) {
      return null;
    }

    // Uncomment the following lines to check for empty password
    // if (this!.isEmpty) {
    //   return "Password tidak boleh kosong";
    // }

    if (this!.length < 5) {
      return "Password harus lebih dari 5 karakter";
    }

    return null;
  }
}
