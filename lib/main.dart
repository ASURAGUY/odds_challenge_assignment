import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'function.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ODDS CHALLENGE ASSIGNMENT',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade50,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('CHALLENGE ASSIGNMENT',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.amber.shade100)),
                        Text(
                          'FUNCTION A to F',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(),
                    hintText: 'กรุณาใส่เลข 1 ถึง 20',
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 40.0,
                    child: ElevatedButton(
                        child: Text('ENTER',style: TextStyle(fontSize: 18.0)),
                        onPressed: () {
                          var input = _controller.text;
                          var num = int.tryParse(input);
                          if (num == null) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('ERROR'),
                                      content: Text('กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        )
                                      ]);
                                }
                            );
                          }else {
                            //เปลี่ยน int เป็น string
                            String numb = num.toString();
                            // ทำเลขหลักสิบ ให้เป็น 2 ตัว
                            List number = numb.runes.map((rune) => new String.fromCharCode(rune)).toList();
                            var function = new doFunction();
                            // ส่งค่าให้แต่ละฟังก์ชั่น
                            var fA = function.FunctionA(number);
                            var fB = function.FunctionB(fA);
                            function.FunctionC(fB);
                            function.FunctionD(fB);
                            function.FunctionE(fA);
                            function.FunctionF(numb);
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('RESULT'),
                                      content: Text('Input : $input\n${function.Text}'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        )
                                      ]);
                                }
                            );
                          }
                        }
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

