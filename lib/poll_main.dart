import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPoll(),));
}

class MyPoll extends StatefulWidget {
  const MyPoll({Key? key}) : super(key: key);

  @override
  State<MyPoll> createState() => _MyPollState();
}

class _MyPollState extends State<MyPoll> {
  var loopCount = 0;
  var names = [
    'ISTJ', 'ISTP', 'ISFJ', 'ISFP', 'INTJ', 'INTP', 'INFJ', 'INFP',
    'ESTJ', 'ESTP', 'ESFJ', 'ESFP', 'ENTJ', 'ENTP', 'ENFJ', 'ENFP'
  ];
  var likeCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.title),
        title: Text("My MBTI"),
        backgroundColor: Color(0xff000000),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(likeCount[index].toString(), style: TextStyle(fontSize: 15),),
            title: Text(names[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(Icons.poll),
              onPressed: () {
                setState(() {
                  likeCount[index]++;
                });
              },
              color: Color(0xff000000),
            ),
          );
        },
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

