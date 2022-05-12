import 'package:flutter/material.dart';
import 'package:polls/polls.dart';


void main() {
  runApp(MaterialApp(home: MyPoll(),));
}

class MyPoll extends StatefulWidget {
  const MyPoll({Key? key}) : super(key: key);

  @override
  State<MyPoll> createState() => _MyPollState();
}

class _MyPollState extends State<MyPoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        title: Text("My MBTI"),
        backgroundColor: Color(0xff000000),
      ),
      body: Container(
        child: TextButton(
          child: Text(
            'Poll MBTI',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PollView()));
          },
        ),
        alignment: Alignment.center,
        color: Colors.black54,
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class PollView extends StatefulWidget {
  @override
  _PollViewState createState() => _PollViewState();
}

class _PollViewState extends State<PollView> {
  var names = [
    'ISTJ', 'ISTP', 'ISFJ', 'ISFP', 'INTJ', 'INTP', 'INFJ', 'INFP',
    'ESTJ', 'ESTP', 'ESFJ', 'ESFP', 'ENTJ', 'ENTP', 'ENFJ', 'ENFP'
  ];
  var likeCount = [
    0.0, 3.0, 0.0, 0.0, 2.0, 2.0, 0.0, 6.0,
    0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0
  ];

  var user = "king@mail.com";


  var usersWhoVoted = {'sam@mail.com': 3, 'mike@mail.com' : 4, 'john@mail.com' : 1, 'kenny@mail.com' : 1};
  var creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Polls(
          children: [
            Polls.options(title: names[0], value: likeCount[0]),
            Polls.options(title: names[1], value: likeCount[1]),
            Polls.options(title: names[2], value: likeCount[2]),
            Polls.options(title: names[3], value: likeCount[3]),
            Polls.options(title: names[4], value: likeCount[4]),
            Polls.options(title: names[5], value: likeCount[5]),
            Polls.options(title: names[6], value: likeCount[6]),
            Polls.options(title: names[7], value: likeCount[7]),
            Polls.options(title: names[8], value: likeCount[8]),
            Polls.options(title: names[9], value: likeCount[8]),
            Polls.options(title: names[10], value: likeCount[10]),
            Polls.options(title: names[11], value: likeCount[11]),
            Polls.options(title: names[12], value: likeCount[12]),
            Polls.options(title: names[13], value: likeCount[13]),
            Polls.options(title: names[14], value: likeCount[14]),
            Polls.options(title: names[15], value: likeCount[15]),
          ],
          question: Text(
            '[ Select your MBTI ]',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          currentUser: user,
          creatorID: creator,
          voteData: usersWhoVoted,
          userChoice: usersWhoVoted[user],
          onVoteBackgroundColor: Colors.blue,
          leadingBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          onVote: (choice) {
            print(choice);
            setState(() {
              usersWhoVoted[user] = choice;
            });
            if (choice == 1) {
              setState(() {
                likeCount[0] += 1.0;
              });
            }
            if (choice == 2) {
              setState(() {
                likeCount[1] += 1.0;
              });
            }
            if (choice == 3) {
              setState(() {
                likeCount[2] += 1.0;
              });
            }
            if (choice == 4) {
              setState(() {
                likeCount[3] += 1.0;
              });
            }
            if (choice == 5) {
              setState(() {
                likeCount[4] += 1.0;
              });
            }
            if (choice == 6) {
              setState(() {
                likeCount[5] += 1.0;
              });
            }
            if (choice == 7) {
              setState(() {
                likeCount[6] += 1.0;
              });
            }
            if (choice == 8) {
              setState(() {
                likeCount[7] += 1.0;
              });
            }
            if (choice == 9) {
              setState(() {
                likeCount[8] += 1.0;
              });
            }
            if (choice == 10) {
              setState(() {
                likeCount[9] += 1.0;
              });
            }
            if (choice == 11) {
              setState(() {
                likeCount[10] += 1.0;
              });
            }
            if (choice == 12) {
              setState(() {
                likeCount[11] += 1.0;
              });
            }
            if (choice == 13) {
              setState(() {
                likeCount[12] += 1.0;
              });
            }
            if (choice == 14) {
              setState(() {
                likeCount[13] += 1.0;
              });
            }
            if (choice == 15) {
              setState(() {
                likeCount[14] += 1.0;
              });
            }
            if (choice == 16) {
              setState(() {
                likeCount[15] += 1.0;
              });
            }
          },
        ),
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
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline),
              ),
            ]
        ),
      ),
    );
  }
}
