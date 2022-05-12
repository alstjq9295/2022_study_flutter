import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var integer = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(integer.toString()),
          onPressed: () {
            print(integer);
            integer++;
          },
        ),
        appBar: AppBar(),
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
          itemCount: 30,
          itemBuilder: (context, i) {
            return Contact();
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

