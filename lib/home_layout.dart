import 'package:bmi/bmi_clac.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/result_screen.dart';
import 'package:bmi/reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Colors.black38;
const inActiveColor = Color(0xff323244);
const bottomContainerColor = Color(0xFFBD1555);

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var femaleColor = Color(0xff323244);
  var maleColor = Color(0xff323244);
  int weight = 60;
  int age = 35;
  double height=150;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      appBar: AppBar(
        backgroundColor: Color(0xff1D2136),
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              femaleColor = activeColor;
                              maleColor = inActiveColor;
                            });
                          },
                          child: buildGenderCard(
                              'Female', femaleColor, FontAwesomeIcons.female)),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              maleColor = activeColor;
                              femaleColor = inActiveColor;
                            });
                          },
                          child: buildGenderCard(
                              'Male', maleColor, FontAwesomeIcons.male)),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Card(
                color: Color(0xff323244),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: KTextStyle,
                    ),
                    Text(
                      '$height',
                      style: KNumStyle,
                    ),
                    Slider(
                        value: height.toDouble(),
                        inactiveColor: Color(0xFF8D8E98),
                        activeColor: Color(0xFFBD1555),
                        min: 1,
                        max: 200,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.roundToDouble();
                          });
                        })
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: [
                    buildLowerWidget(
                     text: 'WEIGHT',
                      userNum: weight,
                      minusPress: (){
                       setState(() {
                         weight--;
                       });
                      },
                      plusPress: (){
                       setState(() {
                         weight++;
                       });
                      }
                    ),
                    buildLowerWidget(
                        text: 'AGE',
                        userNum: age,
                        minusPress: (){
                          setState(() {
                            age--;
                          });
                        },
                        plusPress: (){
                          setState(() {
                            age++;
                          });
                        }
                    ),
                  ],
                ),
              ),
              BottomButton(text: 'RESULT',
                press: (){
                BmiCalc calc=BmiCalc(height: height, weight: weight.toDouble());
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return
                  ResultScreen(
                      bmi: calc.bmiResult(),
                      result: calc.result(),
                      interpretation: calc.interpretation()
                  );
                }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }



}
