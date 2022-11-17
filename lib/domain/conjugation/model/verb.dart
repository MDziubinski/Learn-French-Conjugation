class Verb {
  String infinitif;
  String description;
  int verbGroup;
  List<String> translationExamplesF;
  List<String> translationExamplesEng;
  Map<String, String> mappedSingularForms;
  Map<String, Map<String, List<String>>> mappedConjugations;

  Verb({
    required this.infinitif,
    required this.mappedConjugations,
    required this.mappedSingularForms,
    required this.verbGroup,
    required this.description,
    required this.translationExamplesEng,
    required this.translationExamplesF,
  });
}
