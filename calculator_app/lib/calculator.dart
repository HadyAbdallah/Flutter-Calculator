import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';
  String result = '';

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        display = '';
        num1 = 0.0;
        num2 = 0.0;
        operator = '';
        result = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '÷' ||
          buttonText == '%') {
        num1 = double.parse(display);
        operator = buttonText;
        display = '';
      } else if (buttonText == '+/-') {
        if (display[0] != '-') {
          display = '-' + display;
        } else if (display[0] == '-') {
          display = display.replaceFirst('-', '');
        }
      } else if (buttonText == '=') {
        num2 = double.parse(display);
        switch (operator) {
          case '+':
            result = (num1 + num2).toString();
            break;
          case '-':
            result = (num1 - num2).toString();
            break;
          case 'x':
            result = (num1 * num2).toString();
            break;
          case '÷':
            result = (num1 / num2).toString();
            break;
          case '%':
            if (num2 == 0.0)
              result = ((num1 / 100)).toString();
            else
              result = ((num1 / 100) * num2).toString();
        }
        display = result;
      } else {
        display += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(100, 100),
          shape: CircleBorder(),
          backgroundColor: Colors.grey,
        ),
        onPressed: () => onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              display,
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('AC'),
                  buildButton('+/-'),
                  buildButton('%'),
                  buildButton('÷')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('x')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('-')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('+')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(200, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () => onButtonPressed('0'),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                  buildButton('.'),
                  buildButton('=')
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
