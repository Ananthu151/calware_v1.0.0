import 'package:calware/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String textEditingController = '';
  String textEditingControllerresult = '';
  bool isdot = true;
  bool iscal = false;

  void calculateExpression(String expression) {
    if (expression.isEmpty) {
      textEditingControllerresult = '';
    } else {
      expression = expression.replaceAll("×", "*");
      expression = expression.replaceAll("÷", "/");
      try {
        final parser = Parser();
        final exp = parser.parse(expression);
        final context = ContextModel();
        double result = exp.evaluate(EvaluationType.REAL, context);
        textEditingControllerresult = result
            .toStringAsFixed(3)
            .replaceAll(RegExp(r'0+$'), '')
            .replaceAll(RegExp(r'\.$'), '');

        setState(() {});
      } catch (e) {}
    }
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Text(
                textEditingController,
                style: TextStyle(
                    fontSize: 60, fontWeight: FontWeight.w500, color: darkblue),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Text(
                textEditingControllerresult,
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
                  _buildButton4('C'),
                  _buildButton6('%'),
                  _buildButton3("u"),
                  _buildButton1('÷'),
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
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton1('×'),
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
                  _buildButton1('-'),
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
                  _buildButton1('+'),
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
                  _buildButton5('#'),
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
        onTap: () => appendopToController(BText),
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
          calculateExpression(textEditingController);
          textEditingController = textEditingControllerresult;
          textEditingControllerresult = '';
          iscal = false;
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
      color: const Color.fromARGB(255, 248, 248, 248),
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

  Widget _buildButton5(String BText) {
    return Material(
      color: const Color.fromARGB(255, 248, 248, 248),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          try {
            double res = double.parse(textEditingController) / 40.47;
            textEditingControllerresult = res
                .toStringAsFixed(3)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
            setState(() {});
          } catch (e) {}
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Center(
            child: Icon(
              Icons.landscape_rounded,
              color: darkblue,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        ),
      ),
    );
  }

  Widget _buildButton6(String BText) {
    return Material(
      color: const Color.fromARGB(255, 248, 248, 248),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => appendopToController(BText),
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

  void appendCharacterToController(String character) {
    if (character == '.') {
      if (isdot) {
        final currentValue = textEditingController;
        final newValue = currentValue + character;
        textEditingController = newValue;
        isdot = false;
      }
    } else {
      final currentValue = textEditingController;
      final newValue = currentValue + character;
      textEditingController = newValue;
    }
    if (iscal) {
      calculateExpression(textEditingController);
    }

    setState(() {});
  }

  void clearController() {
    textEditingController = '';
    textEditingControllerresult = '';
    isdot = true;
    iscal = false;
    setState(() {});
  }

  void appendopToController(String character) {
    final currentValue = textEditingController;
    final previousChar =
        currentValue.isNotEmpty ? currentValue[currentValue.length - 1] : null;

    if (previousChar == '+' ||
        previousChar == '-' ||
        previousChar == '.' ||
        previousChar == '%' ||
        previousChar == '×' ||
        previousChar == '%' ||
        previousChar == '÷') {
      textEditingController =
          currentValue.substring(0, currentValue.length - 1) + character;
    } else {
      textEditingController = currentValue + character;
    }
    isdot = true;
    iscal = true;
    setState(() {});
  }

  void deleteLastCharacter() {
    final currentText = textEditingController;
    if (currentText.isNotEmpty) {
      final lastCharacter = currentText[currentText.length - 1];
      if (lastCharacter == '.') {
        isdot = true;
      }

      final modifiedText = currentText.substring(0, currentText.length - 1);
      textEditingController = modifiedText;
      if (iscal) {
        calculateExpression(textEditingController);
      }

      setState(() {});
    } else {
      clearController();
    }
  }
}
