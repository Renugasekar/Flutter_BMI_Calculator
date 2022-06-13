// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:bmi_calculator/constant_color.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation:0,
        title:Text('BMI CALCULATOR',
        style: TextStyle(
          color: theme2,
          fontSize: 35,
          fontWeight: FontWeight.w700,
        ),)
      ),
      backgroundColor: theme1,
      body: Column(
        children: [
          SizedBox(height:20,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    width:200,
                    child: TextField(
                      controller: _height,
                      style:TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w300,
                        color:theme2,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w100,
                          color:Colors.white.withOpacity(.8),
                        )
                        ),
                    ),
                  ),
                ),
                  Container(
                  width:200,
                  child: TextField(
                    controller: _weight,
                    style:TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color:theme2,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border:InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                        color:Colors.white.withOpacity(.8),
                      )
                      ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:30),
          GestureDetector(
            onTap:(){
               double h = double.parse(_height.text);
                double w =double.parse(_weight.text);
              setState(() {
                bmiResult = w / (h * h);
               if(bmiResult>25){
                 textResult = 'Over Weight';
               }
               else if(bmiResult>=18.5 && bmiResult<=24.9){
                 textResult = 'Normal Weight';
               }
               else{
                 textResult = 'Under Weight';
               }
              });
            },
            child: Text('Calculate',
              style:TextStyle(
                fontSize:30,
              fontWeight: FontWeight.w700,
              color:theme2,)),
          ),
           SizedBox(height:50),
          Container(
            child: Text(bmiResult.toStringAsFixed(2),
              style:TextStyle(
                fontSize:90,
              color:theme2,)),
          ),
           SizedBox(height:30),
          Visibility(
            visible: textResult.isNotEmpty,
            child: Text(textResult,
              style:TextStyle(
                fontSize:30,
              fontWeight: FontWeight.w700,
              color:theme2,)),
          ),
          SizedBox(height:10),
          LeftBar(barWidth:40,),
          SizedBox(height:20),
          LeftBar(barWidth:70,),
           SizedBox(height:20),
          LeftBar(barWidth:40,),
          SizedBox(height:20),
          RightBar(barWidth:70,),
          SizedBox(height:30),
          RightBar(barWidth:60,),

        ],
        ),
    );
  }
}