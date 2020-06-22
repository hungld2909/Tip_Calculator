import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip Calculator",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double billAmount = 0;
  double tipPercentage = 5;
  double people = 1;
  double totalAmount = 0;
  double tipAmount = 0;

  void tipDecrement() {
    setState(() {
      tipPercentage--;
    });
  }

  void tipIncrement() {
    setState(() {
      tipPercentage++;
    });
  }

  void peopleDecrement() {
    setState(() {
      people--;
    });
  }

  void peopleIncrement() {
    setState(() {
      people++;
    });
  }

  void calculate() {
    if (people == 1) {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        totalAmount = billAmount + tipAmount;
      });
    }
    else{
        setState(() {
          tipAmount = billAmount *(tipPercentage/100);
          tipAmount = tipAmount/people;
          double billPerson = billAmount/people;
          totalAmount = billPerson + tipAmount;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/money.png"),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                billAmount = double.parse(val);
              },
              decoration: InputDecoration(
                hintText: "Bill amount",
                
                ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                Text("Tip %"),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      //Todo:
                      tipDecrement();
                    },
                    child: Icon(Icons.remove_circle)),
                SizedBox(
                  width: 8,
                ),
                Text("${tipPercentage} %"),
                GestureDetector(
                  onTap: () {
                    //Todo:
                    tipIncrement();
                  },
                  child: Icon(Icons.add_circle),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Text("People "),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      //Todo:
                      peopleDecrement();
                    },
                    child: Icon(Icons.remove_circle)),
                SizedBox(
                  width: 8,
                ),
                Text("${people} "),
                GestureDetector(
                  onTap: () {
                    //Todo:
                    peopleIncrement();
                  },
                  child: Icon(Icons.add_circle),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                //Todo: Event Calculator
                calculate();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            tipAmount != 0 ? Text(
              tipAmount == 1? "Tip: $tipAmount" : "Tip: $tipAmount per person"
              ) : Container(),
            SizedBox(
              height: 8,
            ),
            totalAmount != 0 ? Text(
             people == 1 ? "Total Amount: $totalAmount" : "Total Amount: $totalAmount per person"
              ) : Container()
          ],
        ),
      ),
    );
  }
}
