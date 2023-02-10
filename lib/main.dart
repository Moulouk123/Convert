import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
late double _numberForm =0;
String s1="";
String s2="";
String displayname="";
  var fruits = ['Orange', 'Apple', 'Strawberry', 'Banana'];


@override
void initState() {
  _numberForm =0;
  s1="";
 s2="";

  super.initState();
}
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        //padding: const EdgeInsets.all(40),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             
             
            const Padding(padding:EdgeInsets.all(25)),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.3,
              emphasisWidth: 10,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 2,
              enableLineZiggle: true,
              lineZiggleLevel: 2,
              isDoubleLayer: false,
            ),
            //SizedBox(height: 50),
           //creation dune keyboard

            TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                hintText:"Enter a number to enter" ,
              focusedBorder: OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width :3,color:Colors.blue)
              ),
              
            ),
            onChanged: (text){
              var x =double.tryParse(text);
              if(x!= null){
                setState(() {
                  _numberForm=x;
                });
              }
            },
            
             ),
             

         const SizedBox(height: 50),
            Text(_numberForm.toString()),
             DropdownButton<String>(
 items: fruits.map((String value) {
 return DropdownMenuItem<String>(
 value: value,
child: Text(value),
 );
 }).toList(),
 
onChanged: (value) {}),
             ElevatedButton(onPressed: (){
              setState(() {
                s1=_numberForm.toString().split('.')[0];
                //s2=_numberForm.toString().split('.')[1].substring(0,2);
                s2=_numberForm.toStringAsFixed(2).split('.')[1];

                displayname= NumberToWordsEnglish.convert(int.parse(s1));
                
                displayname += " \$ " + NumberToWordsEnglish.convert(int.parse(s2))+ " cents";
              });
             }, 
             child: Text("convert to english "),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple))
             ),
                      ElevatedButton(onPressed: (){
              setState(() {
                s1=_numberForm.toString().split('.')[0];
                //s2=_numberForm.toString().split('.')[1].substring(0,2);
                s2=_numberForm.toStringAsFixed(2).split('.')[1];

                displayname= Tafqeet.convert(s1)+ " الف";
               
                displayname += " " + Tafqeet.convert(s2);
              });
             }, 
             child: Text("convert to Arabic "),style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green))
             ),
               const SizedBox(height: 40),
             Text(displayname)
          ],
        ),
      ),
     
    );
  }
}
