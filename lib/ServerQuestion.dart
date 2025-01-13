import 'package:firstapp/model/question.dart';

class Serverquestion {
  int indexQuestion = 0;
  List<Question> questions = [
    Question(
        intitule: "quel est la capital de france ",
        options: ["Douala", "Paris", "Quebeck city"],
        indexbonnereponse: 1),
    Question(
        intitule: "la monnaie du japon est ? ",
        options: ["oui", "non", "Aucun"],
        indexbonnereponse: 1),
    Question(
        intitule: "quel est la capital du Cameroun ",
        options: ["Douala", "Paris", "Yaounde"],
        indexbonnereponse: 1),
    Question(
        intitule: "quel est la monnaie de france ",
        options: ["euro", "Dollar", "Francs"],
        indexbonnereponse: 1),
    Question(
        intitule: "quel est la capital de france ",
        options: ["Douala", "Paris", "Quebeck city"],
        indexbonnereponse: 1),
  ];

  // Fonction pour obtenir l'intitulé de la question actuelle
  String getintitule() {
    return questions[indexQuestion].intitule;
  }

  // Fonction pour passer à la question suivante
  void prochaineQuestion() {
    if (indexQuestion < (questions.length - 1)) {
      indexQuestion++;
    }
  }

  // Fonction pour obtenir une option spécifique d'une question
  String getOption(int index) {
    // Vérifie si l'index demandé est valide

    if (index >= 0 && index < questions[indexQuestion].options.length) {
      return questions[indexQuestion].options[index];
    } else {
      return "Option invalide";
    }
  }

  // Fonction pour vérifier si le quiz est terminé
  bool quizTerminer() {
    return indexQuestion >= questions.length - 1;
  }

  // Fonction pour obtenir la bonne réponse de la question actuelle
  String getBonneReponse() {
    return questions[indexQuestion]
        .options[questions[indexQuestion].indexbonnereponse];
  }
}

  // fonction get option
  // fonction quiz terminer
  // fonction get bonnereponse
  // commencer l'interface

