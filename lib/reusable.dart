import 'package:bmi/constants.dart';
import 'package:bmi/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Expanded buildLowerWidget(
    {
      required String text,
      required int userNum,
      required minusPress,
      required plusPress
    }
    ) {
  return Expanded(
    child: Card(
      color: Color(0xff323244),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: KTextStyle,
          ),
          Text(
            '${userNum.toString()}',
            style: KNumStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: IconButton(
                    onPressed: minusPress,
                    icon: FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: IconButton(
                    onPressed: plusPress,
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                    )),
              )
            ],
          )
        ],
      ),
    ),
  );
}
Card buildGenderCard(String text, Color color, IconData icon) {
  return Card(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        Text(
          text,
          style: KTextStyle,
        )
      ],
    ),
  );
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    this.text,this.press
  }) ;
  final text;
  final press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: bottomContainerColor,
        height: 80,
        width: double.infinity,
        child: Center(child: Text(text,style: KBottomText)),
      ),
    );
  }
}