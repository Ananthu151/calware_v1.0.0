import 'dart:math';

import 'package:calware/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculatorScreen1 extends StatefulWidget {
  @override
  _CalculatorScreen1State createState() => _CalculatorScreen1State();
}

class _CalculatorScreen1State extends State<CalculatorScreen1> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  @override
  void dispose() {
    // Dispose editing controllers to avoid memory leaks
    textEditingController1.dispose();
    textEditingController2.dispose();
    textEditingController3.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  String tab2textEditingController = '';
  String tab2textEditingControllerresult = '';
  bool isdot1 = true;
  bool isdot2 = true;
  bool isdot3 = true;
  bool iscal = true;
  bool showtotal = false;
  void calculateTriangleArea(
    TextEditingController side1Controller,
    TextEditingController side2Controller,
    TextEditingController side3Controller,
  ) {
    final side1 = double.tryParse(side1Controller.text);
    final side2 = double.tryParse(side2Controller.text);
    final side3 = double.tryParse(side3Controller.text);
    try {
      if (side1 != null && side2 != null && side3 != null) {
        final s = (side1 + side2 + side3) / 2;
        final area = sqrt(s * (s - side1) * (s - side2) * (s - side3));
        tab2textEditingControllerresult = area
            .toStringAsFixed(3)
            .replaceAll(RegExp(r'0+$'), '')
            .replaceAll(RegExp(r'\.$'), '');
      }
    } catch (e) {
      tab2textEditingControllerresult = '0';
    }

    setState(() {});
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                alignment: Alignment.topCenter,
                child: showtotal
                    ? InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          tab2textEditingControllerresult =
                              tab2textEditingController;
                          setState(() {});
                        },
                        child: Text(
                          "TOTAL: ${tab2textEditingController}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: darkblue),
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: lightblue,
                      fontSize: 30),
                  controller: textEditingController1,
                  focusNode: focusNode1,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  readOnly: true,
                  onTap: () => FocusScope.of(context).requestFocus(focusNode1),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightblue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 11),
                    hintText: "A",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: darkblue,
                        fontSize: 30),
                    fillColor: const Color.fromARGB(255, 248, 248, 248),
                    filled: true,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: lightblue,
                          fontSize: 30),
                      controller: textEditingController2,
                      focusNode: focusNode2,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      onTap: () =>
                          FocusScope.of(context).requestFocus(focusNode2),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: lightblue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                        hintText: "B",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkblue,
                            fontSize: 30),
                        fillColor: const Color.fromARGB(255, 248, 248, 248),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: lightblue,
                          fontSize: 30),
                      controller: textEditingController3,
                      focusNode: focusNode3,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      onTap: () =>
                          FocusScope.of(context).requestFocus(focusNode3),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: lightblue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                        hintText: "C",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkblue,
                            fontSize: 30),
                        fillColor: const Color.fromARGB(255, 248, 248, 248),
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              physics: const BouncingScrollPhysics(),
              child: Text(
                tab2textEditingControllerresult,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 50, fontWeight: FontWeight.w400, color: darkblue),
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
        onTap: () {
          if (tab2textEditingControllerresult.isNotEmpty) {
            final s1 = double.tryParse(tab2textEditingController);
            final s2 = double.tryParse(tab2textEditingControllerresult);
            tab2textEditingController = ((s1 ?? 0) + (s2 ?? 0))
                .toStringAsFixed(3)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
            showtotal = true;
            clearControllerpartial();
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
          if (textEditingController1.text.isEmpty) {
            FocusScope.of(context).requestFocus(focusNode1);
          } else if (textEditingController2.text.isEmpty) {
            FocusScope.of(context).requestFocus(focusNode2);
          } else if (textEditingController3.text.isEmpty) {
            FocusScope.of(context).requestFocus(focusNode3);
          } else {
            focusNode1.unfocus();
            focusNode2.unfocus();
            focusNode3.unfocus();
            calculateTriangleArea(textEditingController1,
                textEditingController2, textEditingController3);
          }
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

  Widget _buildButton5(String BText) {
    return Material(
      color: const Color.fromARGB(255, 248, 248, 248),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          try {
            double res = double.parse(tab2textEditingControllerresult) / 40.47;
            tab2textEditingControllerresult = res
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

  void appendCharacterToController(String character) {
    if (focusNode1.hasFocus) {
      if (character == '.') {
        if (isdot1) {
          final currentValue = textEditingController1.text;
          final newValue = currentValue + character;
          textEditingController1.text = newValue;
          isdot1 = false;
        }
      } else {
        final currentValue = textEditingController1.text;
        final newValue = currentValue + character;
        textEditingController1.text = newValue;
      }
    } else if (focusNode2.hasFocus) {
      if (character == '.') {
        if (isdot2) {
          final currentValue = textEditingController2.text;
          final newValue = currentValue + character;
          textEditingController2.text = newValue;
          isdot2 = false;
        }
      } else {
        final currentValue = textEditingController2.text;
        final newValue = currentValue + character;
        textEditingController2.text = newValue;
      }
    } else if (focusNode3.hasFocus) {
      if (character == '.') {
        if (isdot3) {
          final currentValue = textEditingController3.text;
          final newValue = currentValue + character;
          textEditingController3.text = newValue;
          isdot3 = false;
        }
      } else {
        final currentValue = textEditingController3.text;
        final newValue = currentValue + character;
        textEditingController3.text = newValue;
      }
    }
    setState(() {});
  }

  void clearController() {
    tab2textEditingController = '';
    tab2textEditingControllerresult = '';
    textEditingController1.clear();
    textEditingController2.clear();
    textEditingController3.clear();
    isdot1 = true;
    isdot2 = true;
    isdot3 = true;
    showtotal = false;
    FocusScope.of(context).requestFocus(focusNode1);
    setState(() {});
  }

  void clearControllerpartial() {
    tab2textEditingControllerresult = '';
    textEditingController1.clear();
    textEditingController2.clear();
    textEditingController3.clear();
    isdot1 = true;
    isdot2 = true;
    isdot3 = true;
    FocusScope.of(context).requestFocus(focusNode1);
    setState(() {});
  }

  void deleteLastCharacter() {
    if (focusNode1.hasFocus) {
      final currentText = textEditingController1.text;
      if (currentText.isNotEmpty) {
        final lastCharacter = currentText[currentText.length - 1];
        if (lastCharacter == '.') {
          isdot1 = true;
        }
        final modifiedText = currentText.substring(0, currentText.length - 1);
        textEditingController1.text = modifiedText;
        setState(() {});
      }
    } else if (focusNode2.hasFocus) {
      final currentText = textEditingController2.text;
      if (currentText.isNotEmpty) {
        final lastCharacter = currentText[currentText.length - 1];
        if (lastCharacter == '.') {
          isdot2 = true;
        }

        final modifiedText = currentText.substring(0, currentText.length - 1);
        textEditingController2.text = modifiedText;
        setState(() {});
      }
    } else if (focusNode3.hasFocus) {
      final currentText = textEditingController3.text;
      if (currentText.isNotEmpty) {
        final lastCharacter = currentText[currentText.length - 1];
        if (lastCharacter == '.') {
          isdot3 = true;
        }

        final modifiedText = currentText.substring(0, currentText.length - 1);
        textEditingController3.text = modifiedText;
        setState(() {});
      }
    }
  }
}
