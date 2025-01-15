import 'package:flutter/material.dart';
//import 'package:FIRSTAPP-COPY/Model/question.dart';
import 'ServerQuestion.dart'; // classe ServerQuestion

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Serverquestion serverQuestion = Serverquestion();
  int score = 0;

  void verifierReponse(int reponseUtilisateur) {
    setState(() {
      if (serverQuestion.getIndexBonneReponse() == reponseUtilisateur) {
        score += serverQuestion.getIndexBonneReponse();
      }

      if (serverQuestion.quizTerminer()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Quiz terminé"),
              content: Text(
                  "Votre score final est de $score. ${serverQuestion.getTotalQuestions()}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      score = 0;
                      serverQuestion.reinitialiser();
                    });
                  },
                  child: const Text("Recommencer"),
                )
              ],
            );
          },
        );
      } else {
        serverQuestion.prochaineQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  serverQuestion.getIntitule(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      serverQuestion.getOptions().asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: ElevatedButton(
                        onPressed: () => verifierReponse(entry.key),
                        child: Text(entry.value,
                            style: const TextStyle(fontSize: 18.0)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Score : $score / ${serverQuestion.getTotalQuestions()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
