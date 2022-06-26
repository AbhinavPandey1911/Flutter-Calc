import 'package:flutter/material.dart';

class calculator_button extends StatelessWidget {
  final String text;
  final Function callback;

  calculator_button({
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 60,
        height: 60,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(text,
              style: text == 'cos'
                  ? const TextStyle(fontSize: 16)
                  : text == 'sqrt'
                      ? const TextStyle(fontSize: 14)
                      : const TextStyle(fontSize: 17)),
          onPressed: () => callback(text),
          color: text == '+' ||
                  text == '-' ||
                  text == '/' ||
                  text == '*' ||
                  text == 'sqrt' ||
                  text == '%' ||
                  text == '.' ||
                  text == '^' ||
                  text == 'sin' ||
                  text == 'cos' ||
                  text == 'tan' ||
                  text == '!' ||
                  text == 'ln'
              ? const Color.fromARGB(255, 75, 163, 244)
              : text == '<-'
                  ? const Color.fromARGB(234, 239, 206, 160)
                  : text == 'ans'
                      ? const Color.fromARGB(255, 46, 146, 9)
                      : text == 'clr'
                          ? const Color.fromARGB(255, 190, 13, 3)
                          : Color.fromARGB(232, 230, 229, 228),
          textColor: Colors.black,
        ),
      ),
    );
  }
}
