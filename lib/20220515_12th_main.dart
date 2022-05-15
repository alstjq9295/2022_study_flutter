// 11강 숙제부터
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
  var title = "12강 자식 위젯이 부모 위젯의 state 를 변경하고 싶으면";
  var loopCount = 0;
  var names = ['연락처0', '연락처1', '연락처2', '연락처3', '연락처4', '연락처5', '홍길동'];
  var likeCount = [0, 0, 0, 0, 0, 0, 0];
  var total = 7;

  addOne() {
    // total++;
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return CustomDialog(addOne: addOne);
          });
        },
      ),
      appBar: AppBar(
        leading: Icon(Icons.title),
        title: Text(total.toString() + "|" + title),
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

class CustomDialog extends StatelessWidget {
  // const CustomDialog({Key? key, this.addOne}) : super(key: key);
  // 자체 변수를 생성하려면 const 제거
  CustomDialog({Key? key, this.addOne}) : super(key: key);
  // final 변수는 변경 안됨
  final addOne;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            // Flexible(flex: 30, child: TextField(controller: inputData,)),
            Flexible(
              flex: 30,
              child: TextField(controller: inputData,)
            ),
            Flexible(
              flex: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () { Navigator.pop(context); },
                      child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                  ),
                  TextButton(
                      onPressed: () { addOne(); Navigator.pop(context); },
                      child: Text("Ok", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                  )
                ],
              )
            ),
            // Flexible(flex: 10,child: Text(title)),
          ],
        ),
      ),
    );
  }
}

