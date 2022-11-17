class CustomUser {
  final String email;
  final String name;
  final String profilePic;
  final String dailyTaskDate;
  final Map<String, bool> progres;

  const CustomUser({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.progres,
    required this.dailyTaskDate,
  });
}
