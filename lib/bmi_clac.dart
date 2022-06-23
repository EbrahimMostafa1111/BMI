import 'dart:math';
class BmiCalc{

  double? height;
  double? weight;
   double? bmi;
BmiCalc({
    required this.height,
  required this.weight
});

  double bmiResult(){
   bmi= weight!/pow(height!/100, 2) ;
   return bmi!;

  }

  String result(){
    if(bmi!>18&&bmi!<25){
      return 'Normal';
    }
    else if(bmi!>25){
      return'over weight';
    } else return 'under weight';
  }

  String interpretation(){
    if(bmi!>18&&bmi!<25){
      return 'your body mass is okay';
    }
    else if(bmi!>25){
      return'you have to loss weight and eat more healthy food';
    } else return 'you have to  eat more ';
  }

}