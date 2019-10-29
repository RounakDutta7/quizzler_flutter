import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/image1.png'),
          ),
          title: Text('Quizzler'),
          backgroundColor: Colors.amber,
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    setState(
      () {
        if (quizBrain.getAnswer() == userPickedAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 30.0,
            ),
          );
          quizBrain.increaseResult();
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 30.0,
            ),
          );
          quizBrain.decreaseResult();
        }

        int n = quizBrain.getResult();
        print(n);

        if (scoreKeeper.length == 10) {
          Alert(
            context: context,
            type: AlertType.success,
            title: "Result",
            desc: "Your score is: $n",
            buttons: [
              DialogButton(
                child: Text(
                  "Play Agian!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          scoreKeeper.removeRange(0, 10);
          quizBrain.setResult(0);
        }

        quizBrain.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonTheme(
                minWidth: 200.0,
                height: 80.0,
                child: FlatButton(
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 80.0,
                child: FlatButton(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
