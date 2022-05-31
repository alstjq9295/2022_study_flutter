import 'package:flutter/material.dart';

void main() {
  runApp(Death());
}


class Death extends StatefulWidget{
  const Death({Key? key}) : super(key: key);

  @override
  State<Death> createState() => _DeathState();
}
class _DeathState extends State<Death> {
  var death = ['깻잎떼준다', '새우깨준다', '롱패딩 잠궈준다', '뒷좌석 괜찮다'];
  var match = ['안떼준다','안까준다', '냅둔다', '괜찮다'];
  var i = 0;
  var yes = 0;
  var no = 0;
  var pass = 0;
// ∂rf api es
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: Text("Death Match Game"),),
          body:Center(
              child:
              Column(
                children:[
                  Expanded(child:
                  OutlinedButton (
                    onPressed: () { setState((){if(i>=death.length-1){ i=-1;} i+=1; yes+=1;} ); },
                    child: Text(death[i]),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(300, 100),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.blueAccent,
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      padding: EdgeInsets.all(30),

                    ),
                  ),
                    flex: 1,
                  ),
                  Expanded(child:
                  OutlinedButton( onPressed: () { setState((){if(i>=death.length-1){ i=-1;} i+=1; no+=1;}); },
                    child: Text(match[i]),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(300, 100),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.blueAccent,
                        primary: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        padding: EdgeInsets.all(30)
                    ),
                  ),
                    flex: 1,
                  )
                ],
              )
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              setState((){
                if(i>=death.length-1){
                  i=0;
                }
                i+=1;
                pass+=1;
              });
            },
            child: Icon(Icons.skip_next, color: Color(0xff212b4b),),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle() ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.refresh, color: Color(0xff212b4b),),
                ),
                IconButton(
                  onPressed: (){ Navigator.pop(context); },
                  icon: Icon(Icons.home, color: Color(0xff212b4b),),
                )
              ],
            ),
          ),
        )
    );
  }
}