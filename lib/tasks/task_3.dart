import 'dart:math';

import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';

class Task_3_Page extends StatefulWidget {
  @override
  _Task_3_PageState createState() => _Task_3_PageState();
}

class _Task_3_PageState extends State<Task_3_Page> {
  TextEditingController _textEditingController = new TextEditingController();

  int con = 0;
  String text1 = "";
  String text2 = "";
  String text3 = "";
  int k = 0;

  List primeNumbers = [2];
  int num = 1;
  int sum = 0;

  //List<int> numbersList=new List();
  List<int> numbersList = [];
  List<List<int>> matrixA;
  int daxilEdilenEded;

  DiagonalScrollViewController _controller;
  DiagonalScrollViewController _controlPanelController;
  double _currentScale = 1;
  final double _minScale = .3;
  final double _maxScale = 3;
  int mainDiogonal = 0;
  int secondDiogonal = 0;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Task 3 Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value.length == 0) {
                          return "Eded daxil edin";
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Colors.blue),
                        labelText: "Enter N",
                        hintText: "Enter integer N:",
                        labelStyle: TextStyle(color: Colors.blue),
                        hintStyle: TextStyle(color: Colors.blue),
                        errorStyle: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                ),

                RaisedButton(    color: Colors.green.shade300,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      //  int n = 3;
                       daxilEdilenEded =
                          int.parse(_textEditingController.text);

                      numbersList = [];

                      setState(() {
                        matrixA = mat(daxilEdilenEded);
                      });


                      print("ddfs: " + matrixA.toString());


                       matrixOperations();


                    }
                  },
                  child: Text("Create",style: TextStyle(color: Colors.white),),
                ),
                RaisedButton(    color: Colors.red,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      setState(() {
                        numbersList = [];
                        matrixA = null;
                      });
                    }
                  },
                  child: Text("Clear",style: TextStyle(color: Colors.white),),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue)),
                    height: 300,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: DiagonalScrollView(
                        enableZoom: false,
                        minScale: _minScale,
                        maxScale: _maxScale,
                        onCreated: (DiagonalScrollViewController controller) {
                          _controller = controller;
                        },
                        onScaleChanged: (double scale) {
                          setState(() {
                            _currentScale = scale;
                          });
                        },
                        child: Center(
                          child: matrixA == null
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: buildRow(
                                      int.parse(_textEditingController.text)),
                                ),
                        ))),
                SizedBox(height: 10,),
                matrixA == null
                    ? Container()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [  SizedBox(
                            width: 20,
                          ),
                            Text("main : " + mainDiogonal.toString()),
                            SizedBox(
                              width: 25,
                            ),
                            Text("second : " + secondDiogonal.toString()),
                            SizedBox(
                              width: 25,
                            ),
                            Text("sum of diogonals: " +
                                (secondDiogonal + mainDiogonal).toString()),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),SizedBox(height: 10,),
                matrixA == null
                    ? Container()
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  SizedBox(
                      width: 20,
                    ),
                      Text("multiplication of corners : (${matrixA[0][0]}*${matrixA[0][daxilEdilenEded-1]}**${matrixA[daxilEdilenEded-1][0]}*${matrixA[daxilEdilenEded-1][daxilEdilenEded-1]}) = " + (matrixA[0][daxilEdilenEded-1]*matrixA[daxilEdilenEded-1][daxilEdilenEded-1]*matrixA[daxilEdilenEded-1][0]*matrixA[0][0]).toString()),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void matrixOperations() {

    mainDiogonal=0; secondDiogonal=0;
                          for (int i = 0; i < daxilEdilenEded; i++) {
     for (int j = 0; j < daxilEdilenEded; j++) {
       if (i == j) {
         mainDiogonal = mainDiogonal + matrixA[i][j];
       }
       if ((i + j) == (daxilEdilenEded - 1)) {
         secondDiogonal = secondDiogonal + matrixA[i][j];
       }
     }
                          }
                          print("main: " + mainDiogonal.toString());
                          print("second: " + secondDiogonal.toString());
                          print("sum: " + (secondDiogonal+mainDiogonal).toString());

  }

  Row buildRowListGenereata() {
    return Row(
      children: List.generate(3, (index) {
        return Column(
          children: List.generate(3, (indexZ) {
            return Text("5");
            //Text(mat(3)[index][index].toString()) ;
          }),
        );
      }),
    );
  }

  Padding buildRow(n) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          for (int x = 0; x < n; x++)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  for (int z = 0; z < n; z++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        matrixA[x][z].toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }

  void ededDuzelt() {
    int eded = createRandomNum(5);
    print(eded);
    if (numbersList.contains(eded)) {
      print("tekrar oldu yeniden:");
      ededDuzelt();
    } else {
      numbersList.add(eded);
    }
  }

  int createRandomNum(n) {
    Random random = new Random();
    int randomNumber = 1 + random.nextInt(n * n); // from 0 upto 99 included
    return randomNumber;
  }

  mat(int size) {
    // int size = 10;

    int eded;

    List<List<int>> matrix = new List<List<int>>(size);
    for (var i = 0; i < size; i++) {
      List<int> list = new List<int>(size);

      for (var j = 0; j < size; j++) {
        inFor(eded, size, list, j);
      }

      matrix[i] = list;
    }

    print(matrix);
    print(matrix[size - 1][size - 2]);
    return matrix;
  }

  void inFor(int eded, int size, List<int> list, int j) {
    eded = createRandomNum(size);
    if (numbersList.contains(eded)) {
      inFor(eded, size, list, j);
    } else {
      numbersList.add(eded);
      list[j] = eded;
    }
  }
}
