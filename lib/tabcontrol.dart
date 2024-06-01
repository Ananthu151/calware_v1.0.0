import 'package:calware/colors.dart';
import 'package:calware/calculator.dart';
import 'package:calware/tab2.dart';
import 'package:calware/tab3.dart';
import 'package:flutter/material.dart';

class TabControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor: darkblue,
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
              tabs: [
                const Tab(
                  text: "Calculator",
                ),
                const Tab(
                  text: "Triangle",
                ),
                const Tab(
                  text: "Pol",
                ),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.0, // Thickness of the indicator line
                  color: lightblue, // Color of the indicator line
                ),
                insets: EdgeInsets.symmetric(
                    horizontal:
                        16.0), // Horizontal padding for the indicator line
              ),
              labelColor: lightblue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: lightblue,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CalculatorScreen(), // First tab's content
                  CalculatorScreen1(), // Second tab's content
                  Tab3(), // Third tab's content
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
