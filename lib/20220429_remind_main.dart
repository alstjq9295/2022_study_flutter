import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('금호동3가', style: TextStyle(color: Colors.black),),
            leading: Icon(Icons.expand_more, color: Colors.black),
            actions: [
              IconButton(icon: Icon(Icons.search), color: Colors.black, onPressed: () {print('Searching for what?');}),
              IconButton(icon: Icon(Icons.list), color: Colors.black, onPressed: () {print('Listing for what?');}),
              IconButton(icon: Icon(Icons.notifications), color: Colors.black, onPressed: () {print('Searching for what?');}),
            ],
            backgroundColor: Colors.white,
          ),

          body: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(flex: 2, child: Image.asset('bonobono.jpg', width: 70),),
                Flexible(
                    flex: 8,
                    child: SizedBox(
                      height: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('모르는게 아니야. 알 때까지 시간이 좀 걸리는거야', style: TextStyle(fontSize: 15), ),
                          Text('너부리야', style: TextStyle(fontSize: 8), ),
                          Text('헛소리하지마 임마', style: TextStyle(fontSize: 10), ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite_outline),
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertWidget(),
                                ),
                              ),
                              Text('4')
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }

}


class AlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('때릴꺼야?'),
    );
  }
}