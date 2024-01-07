import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'reusable_card.dart';

const accentColor = Color(0XFF56D0DB);
const backgroundColor = Color(0XFFEDEDED);
const textColor = Color(0XFF666E87);

enum Gender {
  male, female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = backgroundColor;
  Color femaleCardColor = backgroundColor;
  Color femaleTextColor = textColor;
  Color maleTextColor = textColor;
  double height = 170.0;
  int weight = 70;
  int age = 30;

  void updateColor(Gender gender){
    //female card pressed
    if (gender == Gender.female){
        femaleCardColor = accentColor;
        maleCardColor = backgroundColor;
        femaleTextColor = Colors.white;
        maleTextColor = textColor;
        
    }
    if (gender == Gender.male){
      maleCardColor = accentColor;
      femaleCardColor = backgroundColor;
      femaleTextColor = textColor;
      maleTextColor = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.1;
    int _currentSliderValue = 170;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: AppBar(
              title: Text('BMI Calculator'),
              centerTitle: true,
              elevation: 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                updateColor(Gender.female);
                              });
                              },
                            child: ReusableCard.all(
                              colour: femaleCardColor,
                              cardChild: Row(children: [Text('Female', style: TextStyle(color: femaleTextColor))],
                                mainAxisAlignment: MainAxisAlignment.center, // Centra el texto horizontalmente
                              ),
                              cardMargin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                updateColor(Gender.male);
                              });
                            },
                            child: ReusableCard.all(
                              colour: maleCardColor,
                              cardMargin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                              cardChild: Row(children: [Text('Male',style: TextStyle(color: maleTextColor))],
                                mainAxisAlignment: MainAxisAlignment.center, // Centra el texto horizontalmente
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Weight',
                                ),
                                Text(
                                  weight.toString(),
                                    style: TextStyle(fontFamily: 'Nanum Gothic' ,fontSize: 45, fontWeight: FontWeight.w500)
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: (){
                                        setState((){weight--;});
                                      },
                                    ),
                                    SizedBox(
                                      width: 10
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: (){
                                        setState((){weight++;});
                                      },
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      'Age'
                                  ),
                                  Text(
                                      age.toString(),
                                      style: TextStyle(fontFamily: 'Nanum Gothic' ,fontSize: 45, fontWeight: FontWeight.w500)
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                        onPressed: (){
                                            setState((){age--;});
                                        },
                                      ),
                                      SizedBox(
                                          width: 10
                                      ),
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                        onPressed: (){
                                          setState((){age++;});
                                        },
                                      ),
                                    ],
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ReusableCard(
                              cardChild:
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: Column(
                                  children: [
                                    Text('Height'),

                                    Expanded(
                                      child: SfSliderTheme(
                                        data: SfSliderThemeData(
                                          activeTrackColor: accentColor,
                                          inactiveTrackColor: Color(0XFFDEDEDE),
                                          tickOffset: Offset(10.0, 0.0),

                                        ),
                                        child: SfSlider.vertical(
                                          value: height,
                                          min: 110,
                                          max: 210,
                                          interval: 20,
                                          showLabels: true,
                                          showTicks: true,
                                          minorTicksPerInterval: 5,
                                          onChanged: (dynamic newValue){
                                            setState(() {
                                              height = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(height.round().toString(), style: TextStyle(fontFamily: 'Nanum Gothic' ,fontSize: 30, fontWeight: FontWeight.w500)),
                                        Text('cm', style: TextStyle(fontFamily: 'Nanum Gothic' ,fontSize: 15, fontWeight: FontWeight.normal))
                                      ],
                                    )
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 15, 18, 80),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            CalculatorBrain calculatorBrain = CalculatorBrain(height: height, weight: weight);
            Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) =>
                    ResultsPage(
                      interpretation: calculatorBrain.getInterpretation(),
                      bmi: calculatorBrain.calculateBMI(),
                      percentage: calculatorBrain.getPercentage(),)));
            // Acción al presionar el botón
          },
          child: Text('Get BMI'),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
   const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: backgroundColor,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40
      ),
      child: Icon(icon),

    );
  }
}




/*
Column(children: [
Expanded(
child: Row(
children: [
Expanded(
child: ReusableCard(
colour: Color(0XFF56D0DB),
cardChild: Text('Male'))),
Expanded(
child: ReusableCard(
colour: Color(0XFF56D0DB),
cardChild: Text('Female')),
),
],
)),
Expanded(
child: ReusableCard(colour: Color(0XFF56D0DB), cardChild: Text('Female'))),
Expanded(
child: Row(
children: [
Expanded(child: ReusableCard(colour: Color(0XFF56D0DB), cardChild: Text('Female'))),
Expanded(child: ReusableCard(colour: Color(0XFF56D0DB), cardChild: Text('Female')))
],
)),
]),*/

