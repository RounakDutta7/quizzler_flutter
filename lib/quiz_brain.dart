import 'package:quizzler_flutter/question.dart';
import 'dart:math';

class QuizBrain {

  int _questionNum = Random().nextInt(17) + 1;
  int _userResult = 0;

  List<QuestionBank> _questionBank = [
    QuestionBank('The earth is the fourth planet from the sun', false),
    QuestionBank('The planet Venus has no moons', true),
    QuestionBank('Jupiter is composed mostly of iron', false),
    QuestionBank('The sun is a star of average size', true),
    QuestionBank('A lunar eclipse occurs when the sun passes', false),
    QuestionBank('Some cats are actually allergic to humans', true),
    QuestionBank('You can lead a cow down stairs but not up stairs.', false),
    QuestionBank(
        'Approximately one quarter of human bones are in the feet.', true),
    QuestionBank('A slug\'s blood is green.', true),
    QuestionBank('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuestionBank('It is illegal to pee in the Ocean in Portugal.', true),
    QuestionBank(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QuestionBank(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QuestionBank(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QuestionBank(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QuestionBank('Google was originally called \"Backrub\".', true),
    QuestionBank(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QuestionBank(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestion() {
    return _questionBank[_questionNum].getQuestion();
  }

  bool getAnswer() {
    return _questionBank[_questionNum].getAnswer();
  }

  void nextQuestion() {
    if (_questionNum == _questionBank.length - 1)
      _questionNum = 0;
    else
      _questionNum++;
  }

  int getQuestionListLength() {
    return _questionBank.length;
  }

  void increaseResult() {
    _userResult++;
  }

  void decreaseResult() {
    _userResult--;
  }

  int getResult() {
    return _userResult;
  }

  void setResult(int num) {
    _userResult = num;
  }
}
