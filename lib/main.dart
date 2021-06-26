import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var userquestion ='';
  var useranswer='';

  final List<String>buttons=[
    'AC','Del','%','/',
    '9','8','7','X',
    '6','5','4','-',
    '3','2','1','+',
    '00','.','0','=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe4e6f2),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                          padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                          child: Text(userquestion,style: TextStyle(fontSize: 30),),),
                      Container(
                          padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                          child: Text(useranswer,style: TextStyle(fontSize: 25.5),))
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child:GridView.builder(
                    itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemBuilder: (BuildContext, int index){
                      // Clear button
                        if(index ==0){
                          return MyButton(
                            buttonTapped: (){
                              userquestion='';
                              setState(() {
                                useranswer='';
                              });
                            },
                              buttonText: buttons[index],
                              color: Colors.orangeAccent,
                              textcolor: Colors.white,
                          );

                        }
                        // Delete button
                        else if (index==1){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                userquestion=userquestion.substring(0,userquestion.length-1);
                              });
                            },
                              buttonText: buttons[index],
                              color: Colors.red,
                              textcolor:Colors.white
                          );
                        }
                        
                        // Equal button

                        else if (index== buttons.length-1){
                          return MyButton(
                              buttonTapped: (){
                                setState(() {
                                  equalpressed();
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.green[200],
                              textcolor:Colors.white
                          );
                        }
                        
                        // rest of the buttons
                        else {
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                userquestion += buttons[index];
                              });
                            },

                              buttonText: buttons[index],
                              color:isopreator(buttons[index]) ? Colors.indigo[100] : Colors.indigo[300],
                              textcolor: isopreator(buttons[index]) ? Colors.white: Colors.white
                          );
                        }

                      }
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isopreator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  void equalpressed(){
    String finalquestion =userquestion;
    finalquestion =finalquestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    useranswer = eval.toString();

  }
  
  
}

