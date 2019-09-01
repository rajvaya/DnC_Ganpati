import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());
bool isLoad = true;
var advice;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 cal() async {
    final response = await http.get('https://api.adviceslip.com/advice');
    print(response.body);
    print('data aaya');
    var datafromjson = json.decode(response.body)['slip']['advice'];
    print(datafromjson);

   setState(() {
     advice = datafromjson;
     isLoad = false;
   });

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     cal();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganesh Advice for DnC',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Get Advice from bapa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color:Color(0xff32E085) ),),
        backgroundColor: Color(0xffffffff),leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network('http://www.designncode.co.in/img/res/dnc_logo.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Container(
                child: isLoad ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff32E085)),
                    ),
                  ),
                )
                : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
       SizedBox(child: Image.network('https://cdn.dribbble.com/users/2185491/screenshots/5500050/3.png'),height: 400,width: 299,),
                  Text('Design & Code wish u Happy Ganesh Chaturthi and We pray to God for your prosperous life. May you find all the delights of life, May your all dreams come true. Happy Ganesh Chaturthi\n',
                  textAlign: TextAlign.center, style: TextStyle(color: Color(0xff32E085),fontSize: 22),),
                  Text('Advice for you from Bapa\n',  style: TextStyle(color: Color(0xff424242),fontSize: 20), textAlign: TextAlign.center,),
                  Text(advice+'\n\n',  style: TextStyle(color: Color(0xff32E085),fontSize: 18),textAlign: TextAlign.center,),
                  SizedBox(height: 16,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset('d_n_c_labs.png',height: 40,width: 110,),
                      Text('Devloped by Raj Vaya',  style: TextStyle(color: Color(0xff424242),fontSize: 16),),
                    ],
                  )
                ],
            ),
              ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
