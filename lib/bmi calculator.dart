import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {

  @override
  State<Bmi> createState() => Calculate_bmi();
}

class Calculate_bmi extends State<Bmi> {
  var wtController=TextEditingController();
  var heightController=TextEditingController();
  var inController=TextEditingController();

  var result='';
  Color bgcolor=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: bgcolor,
          width: 300,
          child: Center(
            child:  Column(

              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(
                      fontSize: 46.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown),
                ),
                SizedBox(height:12),
                TextField(
                    controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kg'),
                   prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height:12),
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    label: Text('Enter your height'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height:12),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height:26),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=heightController.text.toString();
                  var inch=inController.text.toString();
                  if(wt !=''  && ft !='' && inch !='')
                    {
                      //calculate bmi
                      var iwt=int.parse(wt);
                      var ift=int.parse(ft);
                      var iinch=int.parse(inch);

                      var tinch=(ift*12)+iinch;
                      var tcm=tinch*2.54;
                      var tm=tcm/100;
                      var bmi= iwt/(tm*tm);
                      var msg='';
                      if(bmi>25)
                        {
                          msg='you are overweight';
                          bgcolor=Colors.deepOrange;
                        }
                      else if (bmi<18)
                      {
                        msg='you are underweight';
                        bgcolor=Colors.red.shade500;
                      }
                      else
                      {
                        msg='You are healthy';
                        bgcolor=Colors.green;
                  }

                      setState(() {
                        result='$msg \n your BMI is ${bmi.toStringAsFixed(2)}';
                      });



                    }
                  else
                    {
                      setState(() {
                        result='Kindly fill all the required details';
                      });
                    }

                }, child: Text('Calculate')),
                SizedBox(height: 12,),
                Text(result,style: TextStyle(fontSize: 16,color: Colors.brown))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
