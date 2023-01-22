import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget{
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  var tf1 = TextEditingController();
  var tf2 = TextEditingController();
  var result = "";
  var msg = "";

  var clr;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: clr,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tf1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Enter Your Height (cm)", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: tf2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Enter Your Height (cm)", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple
                  ),
                  child: Text("Calculate", style: TextStyle(fontSize: 16,),)),
              SizedBox(height: 20,),
              Text(result, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(msg, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: clear,
          label: Text("Clear",),
          backgroundColor: Colors.purple,
      ),
    );
  }
  calculate(){
    var height = double.parse(tf1.text.toString());
    var weight = double.parse(tf2.text.toString());

    height = height / 100;

    var bmi = weight / (height * height);

    result = "Your BMI is ${bmi.toStringAsFixed(2)}";

    if(bmi > 24.9) {
      clr = Colors.red;
      msg = "You are overweight!";
    }
    else if(bmi < 18.5){
      clr = Colors.yellow;
      msg = "You are underweight!";
    }
    else {
      clr = Colors.green;
      msg = "You have a healthy weight!";
    }
    setState(() {

    });
  }
  clear() {
    clr = Colors.white;
    tf1.clear();
    tf2.clear();
    result = "";
    msg = "";
    setState(() {

    });
  }
}