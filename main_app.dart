import 'package:flutter/material.dart';
import 'package:flutter_app/WeekDaysPackage/Week10Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week1Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week2Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week3Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week4Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week5Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week6Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week7Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week8Days.dart';
import 'package:flutter_app/WeekDaysPackage/Week9Days.dart';

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
              title: Text("",
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

//--------------------------------------------Home
class HomeTab extends StatefulWidget {
  @override
  _MyHomeTab createState() => _MyHomeTab();
}

class _MyHomeTab extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Your Workouts',
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
                    if (num ==1) {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => MyWeek1DaysPage()
                          ));
                    } else if (num ==2) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek2DaysPage()
                          )
                      );
                    }
                    else if (num ==3) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek3DaysPage()
                          )
                      );
                    }
                    else if (num ==4) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek4DaysPage()
                          )
                      );
                    }
                    else if (num ==5) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek5DaysPage()
                          )
                      );
                    }
                    else if (num ==6) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek6DaysPage()
                          )
                      );
                    }
                    else if (num ==7) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek7DaysPage()
                          )
                      );
                    }
                    else if (num ==8) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek8DaysPage()
                          )
                      );
                    }
                    else if (num ==9) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek9DaysPage()
                          )
                      );
                    }
                    else if (num ==10) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek10DaysPage()
                          )
                      );
                    }
                  },
                  //  ),
                  // );
                  //  },
                ),
              ),
            ),
          ],
        ),
      ),
    );}
}




//--------------------------------------------History
class HistoryTab extends StatefulWidget {
  @override
  _MyHistoryTab createState() => _MyHistoryTab();
}

class _MyHistoryTab extends State<HistoryTab> {
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

class TileItem2 extends StatelessWidget {
  final int num;

  const TileItem2({Key key, this.num}) : super(key: key);

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
                    if (num ==1) {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => MyWeek1DaysPage()
                          ));
                    } else if (num ==2) {
                      Navigator.push(context,
                        MaterialPageRoute(

                            builder: (context) => MyWeek2DaysPage()
                        )
                      );
                    }
                    else if (num ==3) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek3DaysPage()
                          )
                      );
                    }
                    else if (num ==4) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek4DaysPage()
                          )
                      );
                    }
                    else if (num ==5) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek5DaysPage()
                          )
                      );
                    }
                    else if (num ==6) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek6DaysPage()
                          )
                      );
                    }
                    else if (num ==7) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek7DaysPage()
                          )
                      );
                    }
                    else if (num ==8) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek8DaysPage()
                          )
                      );
                    }
                    else if (num ==9) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek9DaysPage()
                          )
                      );
                    }
                    else if (num ==10) {
                      Navigator.push(context,
                          MaterialPageRoute(

                              builder: (context) => MyWeek10DaysPage()
                          )
                      );
                    }
                  },
                  //  ),
                  // );
                  //  },
                ),
              ),
            ),
          ],
        ),
      ),
    );}
}







// ------------------------------------------------------idk



class MessagesTab extends StatefulWidget {
  @override
  _MyMessagesTab createState() => _MyMessagesTab();
}

class _MyMessagesTab extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Your Notifications',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),),
        ),
        body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // messages go here
            Text("You currently have no messages.",
                style: TextStyle(fontFamily: 'Comic Sans', fontSize: 30.0)),
            ]
      ),
    )
    )
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
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Resources',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),),
        ),
        
        // initials icon
        body:  Center(
        child: ListView(
          children: <Widget>[
            Card( color: Colors.grey[200],
              child: ListTile(
              leading: CircleAvatar(
              backgroundColor: Colors.blueGrey[700],
                child: Text('SV',
                            style: TextStyle(
                            foreground: Paint()
                            ..color = Colors.white),
                                 ),
              ),
                // name of resource
              title: Text('Coach Veith',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,)),
              subtitle: Text('sveith@drew.edu | 973-432-5039',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 20.0,)),
      ),
    ), 
            // initials icon
            Card( color: Colors.grey[300],
              child: ListTile(
              leading: CircleAvatar(
               backgroundColor: Colors.blueGrey[800],
               child: Text('CR',
                            style: TextStyle(
                            foreground: Paint()
                            ..color = Colors.white),
                                 ), 
              ),
                // name of resource
              title: Text('Chris Ryan',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,)),
              subtitle: Text('cryan@drew.edu',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 20.0,)),
      ),
    ), 
            // camera icon
            Card( color: Colors.grey[200],
              child: ListTile(
              leading: Icon(Icons.camera_alt,
                           color: Colors.blueGrey[900],
                           size: 42.0),
              // instagram resource
              title: Text('Instagram',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 30.0,)),
              subtitle: Text('@drew_u_strength',
                  style: TextStyle(
                  fontFamily: 'Comic Sans',
                  fontSize: 20.0,)),
      ),
    ),           
            ]
        ),
    )
    )
    );
  }

}
