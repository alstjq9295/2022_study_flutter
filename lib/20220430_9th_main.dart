import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var integer = 1;
  var name = ['연락처0', '연락처1', '연락처2', '연락처3', '연락처4', '연락처5', '홍길동'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text(integer.toString()),
            onPressed: () {
              setState(() {
                integer++;
              });
            },
          ),
          appBar: AppBar(title: Text("Contact"),),
          // body: ListView(
          //   children: const [
          //     Contact(),
          //     Contact(),
          //     Contact(),
          //     Contact(),
          //     Contact(),
          //   ],
          // ),
          body: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(name[i]),
                  leading: Icon(Icons.account_circle),
                );
                // return Contact();
              }
          ),
          bottomNavigationBar: CustomBottomBar(),
        )
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: const [
          Flexible(
              flex: 3,
              child: Icon(Icons.account_circle)
          ),
          Flexible(
              flex: 7,
              child: Text(
                  "홍길동"
              )
          ),
        ],
      ),
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

