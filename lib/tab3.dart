import 'dart:math';

import 'package:calware/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Tab3 extends StatefulWidget {
  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  String _textEditingController = '';
  String _textEditingControllerresult = '';
  bool _isdot = true;
  bool _iscomma = true;
  bool _isplus = true;

  void calculateResult(String input) {
    // Validate input format
    try {
      List<String> parts = input.split(',');
      final parser = Parser();
      final exp = parser.parse(parts[0]);
      final exp2 = parser.parse(parts[1]);
      final context = ContextModel();
      double p1 = exp.evaluate(EvaluationType.REAL, context);
      double p2 = exp2.evaluate(EvaluationType.REAL, context);
      double result = sqrt(pow(p1, 2) + pow(p2, 2));
      _textEditingControllerresult = result
          .toStringAsFixed(3)
          .replaceAll(RegExp(r'0+$'), '')
          .replaceAll(RegExp(r'\.$'), '');

      setState(() {});
    } catch (e) {
      print(e.toString());
    }

    //return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Text(
                _textEditingController,
                style: TextStyle(
                    fontSize: 60, fontWeight: FontWeight.w500, color: darkblue),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Text(
                _textEditingControllerresult,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                    color: lightblue),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton4('C'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton3("u"),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton1('±'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(','),
                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton2('='),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildButton(String BText) {
    return Material(
      color: const Color.fromARGB(255, 248, 248, 248),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => appendCharacterToController(BText),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Text(
              BText,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: darkblue),
            ),
          ),
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        ),
      ),
    );
  }

  Widget _buildButton1(String BText) {
    return Material(
      color: lightestblue,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        splashColor: lightbluespla,
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (_isplus) {
            final currentValue = _textEditingController;
            final previousChar = currentValue.isNotEmpty
                ? currentValue[currentValue.length - 1]
                : null;

            if (previousChar == '+') {
              _textEditingController =
                  currentValue.substring(0, currentValue.length - 1) + '-';
            } else if (previousChar == '-') {
              _textEditingController =
                  currentValue.substring(0, currentValue.length - 1) + '+';
            } else if (previousChar == ',') {
              _textEditingController = currentValue;
            } else {
              _textEditingController = currentValue + '-';
            }

            _isdot = true;
            _isplus = false;
            if (previousChar == ',') {
              _isplus = true;
            }
            setState(() {});
          } else {
            final currentValue = _textEditingController;
            final previousChar = currentValue.isNotEmpty
                ? currentValue[currentValue.length - 1]
                : null;
            if (previousChar == '-') {
              _textEditingController =
                  currentValue.substring(0, currentValue.length - 1) + '+';
            }
            if (previousChar == '+') {
              _textEditingController =
                  currentValue.substring(0, currentValue.length - 1) + '-';
            }
            _isdot = true;
            _isplus = false;
            setState(() {});
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Text(
              BText,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: darkblue),
            ),
          ),
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        ),
      ),
    );
  }

  Widget _buildButton2(String BText) {
    return Material(
      color: lightorange,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        splashColor: darkorange,
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          calculateResult(_textEditingController);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Text(
              BText,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: whiteColor),
            ),
          ),
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        ),
      ),
    );
  }

  Widget _buildButton3(String BText) {
    return Material(
      color: lightestblue,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: deleteLastCharacter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Icon(
              Icons.backspace,
              color: darkblue,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        ),
      ),
    );
  }

  Widget _buildButton4(String BText) {
    return Material(
      color: lightblue,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        splashColor: darkblue,
        borderRadius: BorderRadius.circular(20),
        onTap: clearController,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Text(
              BText,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: whiteColor),
            ),
          ),
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        ),
      ),
    );
  }

  void appendCharacterToController(String character) {
    if (character == '.') {
      if (_isdot) {
        final currentValue = _textEditingController;
        final newValue = currentValue + character;
        _textEditingController = newValue;
        _isdot = false;
      }
    } else if (character == ',') {
      if (_iscomma) {
        final currentValue = _textEditingController;
        final newValue = currentValue + character;
        _textEditingController = newValue;
        _iscomma = false;
        _isplus = true;
        _isdot = true;
      }
    } else {
      final currentValue = _textEditingController;
      final newValue = currentValue + character;
      _textEditingController = newValue;
    }
    setState(() {});
  }

  void clearController() {
    _textEditingController = '';
    _textEditingControllerresult = '';
    _isdot = true;
    _iscomma = true;
    _isplus = true;

    setState(() {});
  }

  void deleteLastCharacter() {
    final currentText = _textEditingController;
    if (currentText.isNotEmpty) {
      final lastCharacter = currentText[currentText.length - 1];
      if (lastCharacter == '.') {
        _isdot = true;
      }
      if (lastCharacter == ',') {
        _iscomma = true;
      }
      if (lastCharacter == '+' || lastCharacter == '-') {
        _isplus = true;
      }

      final modifiedText = currentText.substring(0, currentText.length - 1);
      _textEditingController = modifiedText;

      setState(() {});
    } else {
      clearController();
    }
  }
}
