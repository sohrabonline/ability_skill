import 'dart:io';

import 'package:csv/csv.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class Task_1_Page extends StatefulWidget {
  @override
  _Task_1_PageState createState() => _Task_1_PageState();
}

class _Task_1_PageState extends State<Task_1_Page> {


  TextEditingController _textEditingController = new TextEditingController();

  int con = 0;
  String text1 = "";
  String text2 = "";
  String text3 = "";
  int k = 0;

  List primeNumbers = [2];
  int num = 1;
  int sum=0;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Task 2 Page'),
      ),
      body: SingleChildScrollView( 
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 28.0, horizontal: 50),
                  child: Form(key: formKey,
                    child: TextFormField(validator: (value) {
                      if (value.length ==0) {
                        return "Eded daxil edin";
                      }



                    },
                      keyboardType: TextInputType.number,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Colors.blue),
                        labelText: "Find the prime numbers untill N",
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
                RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      cleaner();

                      int n = int.parse(_textEditingController.text);

                      untillNprime(n);
                    }
                  },
                  child: Text("Find the prime numbers untill N"),
                ),
                RaisedButton(
                  onPressed: () {
                   if (formKey.currentState.validate()) {
                     print("${_textEditingController.text}");

                     cleaner();

                     NthPrime();

                   }

                  },
                  child: Text("Find the Nth prime number"),
                ),
                RaisedButton(
                  onPressed: () {
                   if (formKey.currentState.validate()) {
                     print("${_textEditingController.text}");

                     cleaner();

                     NthPrimetoCSV();

                   }

                  },
                  child: Text("CSV"),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                   if (formKey.currentState.validate()) {
                     sumMethod();

                   }


                  },
                  child: Text("sum"),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    cleaner();
                  },
                  child: Text("clear"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue)),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Center(
                          child: Column(
                            children: [           SizedBox(height: 5,),                         Text(
                              "$text3",
                              style:
                              TextStyle(color: Colors.black, fontSize: 15),

                            ),    text3!=''? Divider(color: Colors.black,):Container(),
                            Row(
                                children: [
                                  Text(
                                    "$text2",
                                    style:
                                        TextStyle(color: Colors.green, fontSize: 15),
                                  ),

                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$text1",
                                    style:
                                        TextStyle(color: Colors.blue, fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sumMethod() {
     setState(() {
     // text1 = '';
      k = 0;


    });

    int n = int.parse(_textEditingController.text);

    {
      int i;
      int n = int.parse(_textEditingController.text);
      // int sum=0;
       int num=0;
      while (k <= n) {
        num = num + 1;
        for (i = 2; i <= num; i++) {
          //
          if (num % i == 0) {
            //prime deyilse
            break;
          }
        }
        if (i == num) {
          //primedirse
          k = k + 1;
        }
      }
      sum=sum+num;
      print("sum: "+sum.toString()) ;
      print("num: "+num.toString()) ;
      text3 = text3 + '\n $num';
      text1 = sum.toString();
    }
  }

  void cleaner() {
    setState(() {
      text1 = '';
      text3 = '';
      k = 0;
      text2 = '';
     // primeNumbers.clear();
      sum=0;
    });
  }

  void untillNprime(int n) {
    if (n < 2) {
      setState(() {
        text1 = "en kicik -dir";
      });
    }

    for (int i = 2; i <= n; i++) {
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          con = 1;
        }
      }

      if (con == 0) {
        k++;
        setState(() {
          text1 = text1 + '\n $i';
          text2 = text2 + '\n $k' + "-->";
        });
        print("k: " + k.toString());
      } else {
        con = 0;
      }
    }
  }

  void NthPrime() {
    int i;
    int n = int.parse(_textEditingController.text);
    int num=0;
    while (k < n) {
      num = num + 1;
      for (i = 2; i <= num; i++) {
        //
        if (num % i == 0) {
          //prime deyilse
          break;
        }
      }
      if (i == num) {
        //primedirse
        k = k + 1;
      }
    }
    text1 = num.toString();
  }



  void NthPrimetoCSV()async {
    List primeNumbers=List();
    List th=List();
    int i;
    int n = int.parse(_textEditingController.text);
    int num=0;
    while (k < n) {
      num = num + 1;
      for (i = 2; i <= num; i++) {
        //
        if (num % i == 0) {
          //prime deyilse
          break;
        }
      }
      if (i == num) {
        //primedirse
        k = k + 1;
        primeNumbers.add(num);
        th.add(k) ;
      }
    }
   // text1 = num.toString();
    print(primeNumbers.toString()) ;
    print(th.toString()) ;

    List<List<dynamic>> rows = List<List<dynamic>>();
    for (int i = 0; i <primeNumbers.length;i++) {
      List<dynamic> row = List();

      row.add(th[i]);
      row.add(primeNumbers[i]);

      rows.add(row);
    }
    String dir = (await getApplicationDocumentsDirectory()).absolute.path;
    String  file = "$dir";
    File f = new File(file+"/myReport.csv");
    String csv = const ListToCsvConverter().convert(rows);
    f.writeAsString(csv);
    print(f.path);
    _shareFile(f.path);

  }

  Future<void> _shareFile(String newFilePath) async {
    try {
      setState(() {
        //  hazirlanirloading = true;
      });
      File testFile = new File(
          '$newFilePath');
      if (!await testFile.exists()) {
        await testFile.create(recursive: true);
        testFile.writeAsStringSync("test for share documents file");
      }
      ShareExtend.share(testFile.path, "file");

      setState(() {
        // hazirlanirloading = false;
      });
    } catch (e) {
      print('myError share: $e');
    }

  }



/* List<List<dynamic>> rows = List<List<dynamic>>();
  for (int i = 0; i <rootAttendanceList.length;i++) {
  List<dynamic> row = List();
  row.add(rootAttendanceList[i].name);
  row.add(rootAttendanceList[i].company);
  rows.add(row);
  }
  String dir = (await getApplicationDocumentsDirectory()).absolute.path;
  String  file = "$dir";
  File f = new File(file+"/myreport.csv");
  String csv = const ListToCsvConverter().convert(rows);
  f.writeAsString(csv);
  print(f.path);*/
}
