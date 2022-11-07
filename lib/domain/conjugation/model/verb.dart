class Verb {
  String infinitif;

  Map<String, String> mappedSingularForms;
  Map<String, Map<String, List<String>>> mappedConjugations;

  Verb({
    required this.infinitif,
    required this.mappedConjugations,
    required this.mappedSingularForms,
  });
}
