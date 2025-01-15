import 'model/question.dart';

class Serverquestion {
  int indexQuestion = 0;
  List<Question> questions = [
    Question(
      intitule: "Je me fais facilement des amis.",
      options: [
        "Pas d'accord",
        "Pas du tout d'accord",
        "Neutre",
        "D'accord",
        "Tout à fait d'accord"
      ],
      indexbonnereponse: 3,
    ),
    Question(
      intitule: "J’ai beaucoup d’imagination.",
      options: [
        "Pas d'accord",
        "Pas du tout d'accord",
        "Neutre",
        "D'accord",
        "Tout à fait d'accord"
      ],
      indexbonnereponse: 4,
    ),
    // Ajoutez plus de questions ici
  ];

  String getIntitule() => questions[indexQuestion].intitule;

  List<String> getOptions() => questions[indexQuestion].options;

  int getIndexBonneReponse() => questions[indexQuestion].indexbonnereponse;

  bool quizTerminer() => indexQuestion >= questions.length - 1;

  int getTotalScorePossible() {
    return questions.fold(
        0, (sum, question) => sum + question.indexbonnereponse);
  }

  void prochaineQuestion() {
    if (!quizTerminer()) indexQuestion++;
  }

  void reinitialiser() {
    indexQuestion = 0;
    questions.shuffle();
  }

  int getTotalQuestions() {
    return questions.length;
  }
}
