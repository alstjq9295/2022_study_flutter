import 'package:flutter/material.dart';
import './karlchigi_death_game.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var title = "MBTI Playground";
  List mbtiList = [
    ["#ESTJ", 0], ["#ESTP", 0], ["#ESFJ", 0], ["#ESFP", 0],
    ["#ENTJ", 0], ["#ENTP", 0], ["#ENFJ", 0], ["#ENFP", 0],
    ["#ISTJ", 0], ["#ISTP", 0], ["#ISFJ", 0], ["#ISFP", 0],
    ["#INTJ", 0], ["#INTP", 0], ["#INFJ", 0], ["#INFP", 0],
  ];
  List<Color> colorListE = [
    Color(0xff7C89CEFF), Color(0xff5269ECFF), Color(0xff3A6CB7FF), Color(0xff2973DEFF),
    Color(0xff7C89CEFF), Color(0xff5269ECFF), Color(0xff3A6CB7FF), Color(0xff2973DEFF),
  ];
  List<Color> colorListI = [
    Colors.amber, Colors.orange, Colors.redAccent, Colors.amberAccent,
    Colors.amber, Colors.orange, Colors.redAccent, Colors.amberAccent,
  ];

  var selectedMBTI = "Total";

  @override
  void initState() {
    super.initState();
    // insert function
  }

  addCount(i, addedName) {
    // total++;
    setState(() {
      mbtiList[i][1]++;
    });
  }

  selectMBTI(mbti) {
    setState(() {
      selectedMBTI = mbti;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.videogame_asset),
        onPressed: () {
          // showDialog(context: context, builder: (context) {
          //   return CustomDialog(addOne: addCount);
          // });
          Navigator.push(context, MaterialPageRoute(builder: (context) => Death()),);
        },
      ),

      appBar: AppBar(
        leading: Icon(Icons.emoji_people),
        title: Text(title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_money))
        ],
        backgroundColor: Color(0xff000000),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: mbtiList.length~/2,
              itemBuilder: (context, i) => Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: colorListE[i],
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: TextButton(
                      child: Text(mbtiList[i][0], style: TextStyle(fontSize: 25, color: Colors.black)),
                      onPressed: () {
                        selectMBTI(mbtiList[i][0]);
                        print(selectedMBTI);
                      },
                    ),
                  ),
                ),
              )
            )
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mbtiList.length~/2,
                  itemBuilder: (context, i) => Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    color: colorListI[i],
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: TextButton(
                          child: Text(mbtiList[i+8][0], style: TextStyle(fontSize: 25, color: Colors.black)),
                          onPressed: () {
                            selectMBTI(mbtiList[i+8][0]);
                            print(selectedMBTI);
                          },
                        ),
                      ),
                    ),
                  )
              )
          ),
          SizedBox(
            height: 50,
            child: Text("MBTI 별 키워드 랭킹", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    leading: Text(selectedMBTI + " " + i.toString()),
                    title: Text("해당 키워드"),
                  ),
                );
              }
            ),
          )
        ],
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
              Icon(Icons.chevron_left, size: 30,),
              Icon(Icons.trip_origin_rounded),
              Icon(Icons.refresh_sharp)
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
  var addedName;

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
                        onPressed: () {
                          addOne(inputData.text); Navigator.pop(context);
                        },
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


