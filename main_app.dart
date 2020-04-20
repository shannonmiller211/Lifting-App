import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Hi(),
    );
  }

  //hi() {}
}
class Hi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey[800],
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text(".",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic Sans')),
            ),
            body: TabBarView(
                children: <Widget>[
                  HomeTab(),
                  HistoryTab(),
                  MessagesTab(),
                  ResourcesTab(),
                ]
            ),
            bottomNavigationBar:
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                ),
                Tab(
                  icon: Icon(Icons.notifications),
                ),
                Tab(
                  icon: Icon(Icons.sms),
                )
              ],
              labelColor: Colors.blue[700],
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
            backgroundColor: Colors.grey[800],
          ),
        )
    );
  }
}


class HomeTab extends StatefulWidget {
  @override
  _MyHomeTab createState() => _MyHomeTab();
}

//-------------------------

class _MyHomeTab extends State<HomeTab> {


  void _clickDay1() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Week1Day1(),
      ),
    );
  }

  void _clickDay2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Week1Day2(),
      ),
    );
  }

  void _clickDay3() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Week1Day3(),
      ),
    );
  }

  void _clickDay4() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Week1Day4(),
      ),
    );
  }

  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.green[800],
            child: Text("Week 1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.white,
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        ButtonTheme(
          minWidth: 420.0,
          height: 100.0, //                         <--- Button
          child: RaisedButton(
            color: Colors.grey[200],
            onPressed: () {
              _clickDay1();
            },
            child: Text("Day 1",
                style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                )
            ),
          ),
        ),



        ButtonTheme(
          minWidth: 420.0,
          height: 100.0, //                         <--- Button
          child: RaisedButton(
            color: Colors.grey[300],
            onPressed: () {
              _clickDay2();
            },
            child: Text("Day 2",
                style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                )
            ),
          ),
        ),




        ButtonTheme(
          minWidth: 420.0,
          height: 100.0, //                         <--- Button
          child: RaisedButton(
            color: Colors.grey[200],
            onPressed: () {
              _clickDay3();
            },
            child: Text("Day 3",
                style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                )
            ),
          ),
        ),




        ButtonTheme(
          minWidth: 420.0,
          height: 100.0, //                         <--- Button
          child: RaisedButton(
            color: Colors.grey[300],
            onPressed: () {
              _clickDay4();
            },
            child: Text("Day 4",
                style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                )
            ),
          ),
        ),


        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.green[800],
            child: Text("Week 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.white,
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        ButtonTheme(
          minWidth: 420.0,
          height: 50.0, //                         <--- Button
          child: RaisedButton(
            color: Colors.grey[200],
            onPressed: () {
              _clickDay1();
            },
            child: Text("Day 1",
                style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                )
            ),
          ),
        ),



        //ButtonTheme(
         // minWidth: 420.0,
          //height: 100.0, //                         <--- Button
          //child: RaisedButton(
            //color: Colors.grey[300],
            //onPressed: () {
              //_clickDay2();
            //},
            //child: Text("Day 2",
              //  style: TextStyle(
                //  fontFamily: 'Comic Sans',
                  //fontSize: 30.0,
                //)
            //),
          //),
        //),
      ],



    );
  }
}


class Week1Day1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 1",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Comic Sans')),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Back Squat",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("5 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",
                    )
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Overhead Press/Jerk",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Clean Pull from Athletic Position",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Choice Pulls",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("5 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Planks",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),



            // --------- go back button
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back',
                  style: TextStyle(
                      fontFamily: 'Comic Sans',
                      foreground: Paint()
                        ..color = Colors.white
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Week1Day2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 2",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Comic Sans')),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Thrusters",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("5 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),




            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Hex Bar Deadlift",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 x 3",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Bench Press",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("5 x 5",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Choice Push",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("5 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Choice Core",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!',
                  style: TextStyle(
                      fontFamily: 'Comic Sans',
                      foreground: Paint()
                        ..color = Colors.white
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Week1Day3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 3",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Comic Sans')),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Clean and Press",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 sets Vol.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Incline Bench",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 sets Vol.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Goblet Squat",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 sets Vol.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Push Ups",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 sets Vol.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),



            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!',
                  style: TextStyle(
                      fontFamily: 'Comic Sans',
                      foreground: Paint()
                        ..color = Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}



class Week1Day4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 4",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Comic Sans')),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Overhead Squat",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("5 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Clean Pull from Hang Position",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 x 4",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("Elbow Whips",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("4 x practice",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Reverse Lunge",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("2 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("YTWL",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: Text("2 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("Choice Arms",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: Text("4 sets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.black,
                      fontFamily: 'Comic Sans',
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: Container(
                color: Colors.grey[300],
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Weight",)
                ),
              ),
            ),

            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!',
                  style: TextStyle(
                      fontFamily: 'Comic Sans',
                      foreground: Paint()
                        ..color = Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}




//--------------------------------------------

class HistoryTab extends StatefulWidget {
  @override
  _MyHistoryTab createState() => _MyHistoryTab();
}


class _MyHistoryTab extends State<HistoryTab> {




  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Your Workout History',
            style: TextStyle(
                fontFamily: 'Comic Sans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),),
        ),
        body:
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return TileItem(num: index + 1);
          },
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  final int num;

  const TileItem({Key key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card$num",
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Material(
                    color: (num % 2 == 0) ? Colors.grey[200] : Colors.grey[300],
                    child: ListTile(

                      title: Text("Week $num",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Comic Sans',
                            fontSize: 30.0),

                      ),
                    )
                )
              ],
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 200));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return new PageItem(num: num);
                        },
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final int num;

  const PageItem({Key key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      primary: false,
      leading: IconTheme(data: IconThemeData(color: Colors.white), child: CloseButton()),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Stack(children: <Widget>[
      Hero(
        tag: "card$num",
        child: Material(
          child: Column(
            children: <Widget>[


              Material(
                child: ListTile(
                  title: Text("Week $num"),
                  subtitle: Text("Workout history for week #$num"),
                ),
              ),
              Expanded(
                child: Center(child: Text("Some more content goes here!")),
              )
            ],
          ),
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            height: mediaQuery.padding.top,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: appBar.preferredSize.height),
            child: appBar,
          )
        ],
      ),
    ]);
  }
}


// --------------------------------


class MessagesTab extends StatefulWidget {
  @override
  _MyMessagesTab createState() => _MyMessagesTab();
}

class _MyMessagesTab extends State<MessagesTab> {



  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.green[800],
            child: Text("Your Notifications",
              textAlign: TextAlign.center,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.white,
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        SizedBox(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 1.1,
            color: Colors.grey[200],
            child: Text("You currently have no messages.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 20.0
              ),
            ),
          ),
        ),


      ],
    );
  }

}

// ----------------------------------

class ResourcesTab extends StatefulWidget {
  @override
  _MyResourcesTab createState() => _MyResourcesTab();
}

class _MyResourcesTab extends State<ResourcesTab> {

  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.green[800],
            child: Text("Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.white,
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[200],
            child: Text("Coach Veith",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[200],
            child: Text("sveith@drew.edu | 973-432-5039",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[300],
            child: Text("Chris Ryan",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[300],
            child: Text("cryan@drew.edu",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[200],
            child: Text("Instagram",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.grey[200],
            child: Text("@drew_u_strength",
              textAlign: TextAlign.left,
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black,
                  fontFamily: 'Comic Sans',
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
        ),
      ],
    );
  }

}