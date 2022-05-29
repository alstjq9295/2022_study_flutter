import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

// key 만들기 명령어
// C:\\"Program Files"\Android\\"Android Studio"\jre\bin\keytool -genkey -v -keystore C:\Users\MS\Downloads\keystore\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validuty 10000 -alias upload
// key 추가
// andorid/key.properties 파일 생성 및 작성
// android/app/build.gradle 수정

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var title = "17강: null check 하는 법 & Android 앱으로 발행하기";
  var loopCount = 0;
  // var names = ['연락처0', '연락처1', '연락처2', '홍길동'];
  List<Contact> names = [];
  var likeCount = [0, 0, 0, 0, 0, 0, 0];

  getPermisson() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');

      var contacts = await ContactsService.getContacts();
      print(contacts[0].birthday);
      setState(() {
        names = contacts;
      });

      // var newPerson = Contact();
      // newPerson.givenName = 'Justice';
      // newPerson.familyName = 'It\'s';
      // ContactsService.addContact(newPerson);

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      // 뭐 해야할 때 요청하는게 좋다. 웬만하면 거절하니까...
      // openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    getPermisson();
  }

  addOne(addedName) {
    // total++;
    setState(() {
      names.add(addedName);
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
        title: Text(title),
        actions: [
          IconButton(onPressed: () {getPermisson();}, icon: Icon(Icons.contacts))
        ],
        backgroundColor: Color(0xff000000),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(names[i].displayName ?? '아싸인증ㅠ'),
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
                          var newContact = Contact();
                          newContact.givenName = inputData.text;
                          ContactsService.addContact(newContact);
                          // addOne(inputData.text); Navigator.pop(context);
                          addOne(newContact); Navigator.pop(context);
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


