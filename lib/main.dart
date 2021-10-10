// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int n = 1;
  int totbil = 0;
  double tip = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink, width: 6),
                        ),
                        hintText: 'Enter a bill'),
                    onChanged: (String value) {
                      setState(() {
                        totbil = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Total Bill Per Head',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs ${((totbil * tip) / 100) + totbil / n}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Split By',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (n > 1) n--;
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      Text(
                        " $n",
                        style: TextStyle(fontSize: 30),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              n++;
                            });
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),
                  Text(
                    "Tip is ${tip.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      activeColor: Colors.black12,
                      inactiveColor: Colors.white,
                      min: 0,
                      max: 100,
                      value: tip,
                      onChanged: (double d) {
                        setState(() {
                          tip = d;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
