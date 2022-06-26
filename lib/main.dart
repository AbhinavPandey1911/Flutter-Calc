import 'calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String question = "";
  String result = "ANS";
  List<String> rendererr = [
    '1',
    '2',
    '3',
    '+',
    '-',
    '4',
    '5',
    '6',
    '*',
    '/',
    '7',
    '8',
    '9',
    'sqrt',
    '%',
    '(',
    '0',
    ')',
    '.',
    '^',
    'sin',
    'cos',
    'tan',
    '!',
    'ln'
  ];
  String historyAnswer = "ANS";
  String history = "";
  void btnOnClick(String btnVal) {
    if (btnVal != 'ans' && btnVal != 'clr' && btnVal != '<-') {
      setState(() {
        question = question + btnVal;
      });
    } else if (btnVal == 'clr') {
      setState(() {
        question = "";
        result = "ANS";
      });
    } else if (btnVal == 'ans') {
      final String _userquestion = question;
      Parser p = Parser();
      try {
        Expression exp = p.parse(_userquestion);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          result = eval.toString();
          history = (question);
          historyAnswer = (result);
        });
      } catch (_) {
        // <-- removing the on Exception clause
        // ignore: avoid_print
        print("throwing new error");
        setState(() {
          result = "Err";
        });
        throw Exception("Error on server");
      }
    } else if (btnVal == '<-') {
      setState(() {
        if (question.isEmpty) {
          question = "";
        } else if (question.length == 1) {
          question = "";
        } else if (question[question.length - 1] == 't') {
          question = question.substring(0, question.length - 4);
        } else if (question[question.length - 2] == 'a') {
          question = question.substring(0, question.length - 3);
        } else if (question[question.length - 2] == 'i') {
          question = question.substring(0, question.length - 3);
        } else if (question[question.length - 2] == 'o') {
          question = question.substring(0, question.length - 3);
        } else if (question[question.length - 2] == 'l') {
          question = question.substring(0, question.length - 2);
        } else {
          question = question.substring(0, question.length - 1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic calculator'),
          backgroundColor: Colors.brown[900],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              // Within the `FirstRoute` widget
              onPressed: () {
                setState(() {
                  question = history;
                  result = historyAnswer;
                });
              },
            ), //IconButton
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 244, 248, 250),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      question,
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Container(
                height: 100.0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      result,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.brown[700],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: calculator_button(
                                  text: 'clr',
                                  callback: btnOnClick,
                                ),
                              ),
                              Expanded(
                                child: calculator_button(
                                  text: '<-',
                                  callback: btnOnClick,
                                ),
                              ),
                              Expanded(
                                child: calculator_button(
                                  text: 'ans',
                                  callback: btnOnClick,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              for (int i = 0; i < rendererr.length; i = i + 5)
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Expanded(
                                      child: calculator_button(
                                        text: rendererr[i],
                                        //fillColor: 0xFFFFF8e1,

                                        callback: btnOnClick,
                                      ),
                                    ),
                                    Expanded(
                                      child: calculator_button(
                                        text: rendererr[i + 1],
                                        callback: btnOnClick,
                                      ),
                                    ),
                                    Expanded(
                                      child: calculator_button(
                                        text: rendererr[i + 2],
                                        callback: btnOnClick,
                                      ),
                                    ),
                                    Expanded(
                                      child: calculator_button(
                                        text: rendererr[i + 3],
                                        callback: btnOnClick,
                                      ),
                                    ),
                                    Expanded(
                                      child: calculator_button(
                                        text: rendererr[i + 4],
                                        callback: btnOnClick,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
