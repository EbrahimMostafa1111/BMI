import 'package:bmi/home_layout.dart';
import 'package:bmi/reusable.dart';
import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {
  final double bmi;
  final String result;
  final String interpretation;

   ResultScreen({
    required this.bmi,
    required this.result,
    required this.interpretation}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Result',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: inActiveColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text('$result',style: TextStyle(color: Colors.green,fontSize: 30),),
                  Text('${bmi.roundToDouble()}',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold),),
                  Text('$interpretation',style: TextStyle(color: Colors.white,fontSize: 30),)
                ],),


              ),
            ),
            BottomButton(press: (){
              Navigator.pop(context);
            },text: 'Re-Calculate',)
          ],
        ),
      ),
    );
  }
}
