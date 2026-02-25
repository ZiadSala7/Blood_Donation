String maskEmailStrong(String email) {
  final parts = email.split('@');
  if (parts.length != 2) return email;

  final name = parts[0];
  final domain = parts[1];

  return '${name[0]}*****@$domain';
}
