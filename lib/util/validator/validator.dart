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

durationToTimeString(Duration value) {
  final minute = value.inMinutes % 60;
  final second = value.inSeconds % 60;

  final minuteString = minute.toString().padLeft(2, '0');
  final secondString = second.toString().padLeft(2, '0');

  return "$minuteString:$secondString";
}
