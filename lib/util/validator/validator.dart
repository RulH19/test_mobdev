String? cekFormatEmail(String email) {
  if (email.isEmpty) {
    return 'Email Wajib Diisi';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
    return "Format email tidak valid";
  }
  return null;
}

String? cekPassword(String cekPassword) {
  if (cekPassword.isEmpty) {
    return "Password wajib diisi";
  } else if (cekPassword.length < 4) {
    return "Password minimal 4 karakter";
  }
  return null;
}
