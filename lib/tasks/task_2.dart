import 'package:flutter/material.dart';

class Task_2_Page extends StatefulWidget {
  @override
  _Task_2_PageState createState() => _Task_2_PageState();
}

class _Task_2_PageState extends State<Task_2_Page> {
  TextEditingController _textEditingController = new TextEditingController();

  int con = 0;
  String text1 = "";
  String text2 = "";
  int k=0;

  List primeNumbers=[2];
  int x=3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Task 2 Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 28.0, horizontal: 50),
                child: TextFormField(
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
              RaisedButton(
                onPressed: () {
                  print("${_textEditingController.text}");

                  setState(() {
                    text1 = '';
                    k=0;
                    text2='';
                  });

                  int n = int.parse(_textEditingController.text);

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

                    if (con == 0) {  k++;
                      setState(() {
                        text1 = text1 + '\n $i';
                        text2 = text2 + '\n $k'+"-->";
                      });
                      print("k: "+k.toString());
                    } else {
                      con = 0;
                    }
                  }
                },
                child: Text("Find the prime numbers untill N"),
              ),
              RaisedButton(
                onPressed: () {
                  print("${_textEditingController.text}");

                  setState(() {
                    text1 = '';
                    k=0;
                    text2='';
                    primeNumbers.clear();
                  });

                  int n = int.parse(_textEditingController.text);

                  if (n < 2) {
                    setState(() {
                      text1 = "en kicik -dir";
                    });
                  }

                  for (int c = 2; c <= n; x++) {
                    for (int j = 2; j < x; j++) {
                      if (x % j == 0) {
                        break;
                      }
                    }

                    if (con == x) {
                      c++;

                    primeNumbers.add(x);

                    setState(() {
                    //  text1 = text1 + '\n $i';
                     // text2 = text2 + '\n $k'+"-->";
                    });
                    print("c: "+c.toString());
                    } 
                  }
                  print("list: "+primeNumbers.toString()) ;
                },
                child: Text("Find the Nth prime number"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  _textEditingController.clear();
                  setState(() {
                    text1 = '';
                    k=0;
                    text2='';
                  });
                },
                child: Text("clear"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(

                  decoration:
                      BoxDecoration(   color: Colors.white,border: Border.all(color: Colors.blue)),
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Row(children: [Text(
                          "$text2",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),SizedBox(width: 20,),Text(
                          "$text1",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        )],),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
