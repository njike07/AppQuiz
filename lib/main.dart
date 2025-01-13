import 'package:flutter/material.dart';
import 'package:quiz/ServerQuestion.dart';

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
  ServerQuestion serveurQuestion = ServerQuestion();
  int score = 0;

  void verifierReponse(int reponseUtilisateur) {
    setState(() {
      if (serveurQuestion.quizTermine()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Quiz terminé"),
              content: Text("Votre score est $score"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      score = 0;
                      serveurQuestion.reinitialiser();
                    });
                  },
                  child: Text("Recommencer le quiz"),
                )
              ],
            );
          },
        );
      } else {
        if (reponseUtilisateur == serveurQuestion.getIndexeBonneReponse()) {
          score++;
        }
        serveurQuestion.prochaineQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  serveurQuestion.getIntitule(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: serveurQuestion
                        .getOptions()
                        .asMap()
                        .entries
                        .map((entry) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    minimumSize: Size(double.infinity, 50.0)),
                                child: Text(
                                  entry.value,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                onPressed: () => verifierReponse(entry.key),
                              ),
                            ))
                        .toList()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Score: $score',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
