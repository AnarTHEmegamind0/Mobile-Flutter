import 'dart:io';

class Question {
  String questionText;
  String correctAnswer;

  Question(this.questionText, this.correctAnswer);
}

class Quiz {
  List<Question> _questions = [];
  int _score = 0;

  void addQuestion(Question question) {
    _questions.add(question);
  }

  void startQuiz() {
    print('Welcome to the Quiz!');
    for (var i = 0; i < _questions.length; i++) {
      print('\nQuestion ${i + 1}: ${_questions[i].questionText}');
      stdout.write('Your answer: ');
      String? userAnswer = stdin.readLineSync();

      if (userAnswer != null &&
          userAnswer.toLowerCase() ==
              _questions[i].correctAnswer.toLowerCase()) {
        print('Correct!');
        _score++;
      } else {
        print('Wrong! The correct answer is: ${_questions[i].correctAnswer}');
      }
    }
    print('\nQuiz finished! Your score: $_score/${_questions.length}');
  }
}

void main() {
  Quiz quiz = Quiz();


  quiz.addQuestion(Question('What is the capital of France?', 'Paris'));
  quiz.addQuestion(Question('What is 5 + 3?', '8'));
  quiz.addQuestion(Question('What is the color of the sky?', 'Blue'));


  quiz.startQuiz();
}
