import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWeek4DaysPage(),
    );
  }
}
class MyWeek4DaysPage extends StatefulWidget {
  @override
  _MyWeek4DaysPageState createState() => _MyWeek4DaysPageState();
}
class _MyWeek4DaysPageState extends State<MyWeek4DaysPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Week 4',
            style: TextStyle(
                fontFamily: 'Comic Sans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),),
        ),
        body:
        ListView.builder(
          itemCount: 4,
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

                      title: Text("Day $num",
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
                    if (num ==1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new Week4Day1()
                            ;
                          },

                        ),
                      );
                    }
                    else if (num ==2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new Week4Day2()
                            ;
                          },
                        ),
                      );
                    }
                    else if (num == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new Week4Day3()
                            ;
                          },
                        ),
                      );
                    }
                    else if (num ==4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new Week4Day4()
                            ;
                          },
                        ),
                      );

                    }
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
class Week4Day1 extends StatelessWidget {
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
                child: Text("3 x 8",
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
                child: Text("5 x 3",
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
                child: Text("Clean Pull from the Hang",
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
                child: Text("Clean Pops",
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
                child: Text("5 x Practice",
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
                child: Text("Bear Crawl",
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
                child: Text("4 of one minute",
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
class Week4Day2 extends StatelessWidget {
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
                child: Text("3 x 8",
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
                child: Text("3 x 10",
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
                child: Text("6 sets",
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



class Week4Day3 extends StatelessWidget {
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
                child: Text("4 sets Vol. Max",
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
                child: Text("4 sets Vol. Max",
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
                child: Text("4 sets Vol. Max",
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



class Week4Day4 extends StatelessWidget {

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
                child: Text("3 x 8",
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
                child: Text("Snatch Pull from Athletic Position",
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
                color: Colors.grey[200],
                child: Text("3 x 10",
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
                child: Text("RDL",
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
                child: Text("4 x 8",
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
                color: Colors.grey[200],
                child: Text("6 sets",
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