import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loopCount = 0;
  var names = ['연락처0', '연락처1', '연락처2', '연락처3', '연락처4', '연락처5', '홍길동'];
  var likeCount = [0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                height: 200,
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 30,
                        child: Text("Contact", textAlign: TextAlign.start, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), )
                    ),
                    Flexible(flex: 30, child: TextField()),
                    Flexible(flex: 30, child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                          TextButton(onPressed: () {}, child: Text("Ok", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),))
                        ],
                      )
                    )
                  ],
                ),
              ),
            );
          });
        },
      ),
      appBar: AppBar(
        leading: Icon(Icons.title),
        title: Text("10강 Dialog/모달창 만드는 법과 context가 뭔지"),
        backgroundColor: Color(0xff000000),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(names[i]),
              leading: Icon(Icons.account_circle),
            );
            // return Contact();
          }
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page)
            ]
        ),
      ),
    );
  }
}

