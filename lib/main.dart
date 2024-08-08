// import 'package:flutter/material.dart';
// //TODO: Step 2 - Import the rFlutter_Alert package here.
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// import 'quiz_brain.dart';
//
// QuizBrain quizBrain = QuizBrain();
//
// void main() => runApp(Quizzler());
//
// class Quizzler extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.cyan,
//           title: Title(
//             color: Colors.black,
//             child: Text('QUIZZ'),
//           ),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [];
//
//   void checkAnswer(bool userPickedAnswer) {
//     bool correctAnswer = quizBrain.getCorrectAnswer();
//
//     setState(() {
//       if (quizBrain.isFinished()) {
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();
//
//         quizBrain.reset();
//         scoreKeeper = [];
//       } else {
//         if (userPickedAnswer == correctAnswer) {
//           scoreKeeper.add(Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//         } else {
//           scoreKeeper.add(Icon(
//             Icons.close,
//             color: Colors.red,
//           ));
//         }
//         quizBrain.nextQuestion();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizBrain.getQuestionText(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.green,
//               ),
//               child: Text(
//                 'True',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 checkAnswer(true);
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//               child: Text(
//                 'False',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 checkAnswer(false);
//               },
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         ),
//       ],
//     );
//   }
// }

//adding new ui version

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'QUIZZ',
            style: TextStyle(fontSize: 24.0),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: QuizPage(),
          ),
        ),
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
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              child: Text(
                'Restart',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
              color: Colors.blueGrey,
            )
          ],
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
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
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
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
