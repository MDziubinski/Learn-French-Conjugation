class Verb {
  String infinitif;
  String participePresent;
  String participePasse;
  String auxiliaire;
  String formePronominale;
  String formeNonPronominale;


  Map<String, List<String>> indicatifConj;
  Map<String, List<String>> subjonctifConj;
  Map<String, List<String>> conditionnelConj;
  Map<String, List<String>> imperatifConj;

  Verb({
    required this.infinitif,
    required this.participePresent,
    required this.participePasse,
    required this.auxiliaire,
    required this.formePronominale,
    required this.formeNonPronominale,

    required this.indicatifConj,
    required this.conditionnelConj,
    required this.imperatifConj,
    required this.subjonctifConj,
  });
}
