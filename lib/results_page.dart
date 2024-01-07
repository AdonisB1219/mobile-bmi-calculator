import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const accentColor = Color(0XFF56D0DB);
const backgroundColor = Color(0XFFEDEDED);
const inactiveIndicatorColor = Color(0XFFD7DDE4);

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.interpretation, required this.bmi, required this.percentage});

  final Row interpretation;
  final String bmi;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.1;
    double sizedBoxHeight = MediaQuery.of(context).size.height * 0.2;
    double circularIndicatorWidth = MediaQuery.of(context).size.width * 0.21;
    double circularIndicatorBorder = MediaQuery.of(context).size.width * 0.5;




    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: AppBar(
              title: Text('BMI Results'),
              centerTitle: true,
              elevation: 0),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: sizedBoxHeight),
            RoundIcon(
              onPressed: () {  },
              radius: circularIndicatorBorder,
              child: CircularPercentIndicator(
                radius: circularIndicatorWidth,
                animation: true,
                animationDuration: 1200,
                lineWidth: 12.0,
                percent: percentage,
                center: Text(
                  bmi,
                  style:
                  TextStyle(fontSize: 40.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: inactiveIndicatorColor,
                progressColor: accentColor,
              ),
            ),
            SizedBox(height: 40),
            interpretation

          ]
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 15, 18, 80),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Acción al presionar el botón
          },
          child: Text('Go Back'),
        ),
      ),



    );
  }
}


class RoundIcon extends StatelessWidget {
  const RoundIcon({super.key, required this.child, required this.onPressed, required this.radius});

  final Widget child;
  final void Function() onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 5,
      shape: CircleBorder(),
      fillColor: backgroundColor,
      constraints: BoxConstraints.tightFor(
          width: radius,
          height: radius
      ),
      child: child,

    );
  }
}

