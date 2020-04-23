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

        // number of tabs
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(),

            // name of tabs
            body: TabBarView(
                children: <Widget>[
                  HomeTab(),
                  HistoryTab(),
                  MessagesTab(),
                  ResourcesTab()
                ]
            ),

            // bottom bar of tab icons
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

// home tab
class HomeTab extends StatefulWidget {
  @override
  _HomeTab createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Your Workout Weeks',
            style: TextStyle(
                fontFamily: 'Comic Sans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),),
        ),
        body:
        // number of week buttons
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return
              HomeWeeks(week: index + 1);
          },
        ),
      ),
    );
  }
}


// history tab
class HistoryTab extends StatefulWidget {
  @override
  _HistoryTab createState() => _HistoryTab();
}

class _HistoryTab extends State<HistoryTab> {
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
        // number of week buttons
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return HistoryWeeks(week: index + 1);
          },
        ),
      ),
    );
  }
}


// messages tab
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

// resources tab
class ResourcesTab extends StatefulWidget {
  @override
  _MyResourcesTab createState() => _MyResourcesTab();
}

class _MyResourcesTab extends State<ResourcesTab> {
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

// creates history tab buttons
class HistoryWeeks extends StatelessWidget {
  final int week;

  const HistoryWeeks({Key key, this.week}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card$week",
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
                    color: (week % 2 == 0) ? Colors.grey[200] : Colors.grey[300],
                    child: ListTile(
                      // title of week buttons
                      title: Text("Week $week",
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
              // makes the button clickable
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 200));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // clicks to day buttons
                          return new HistoryDays(week: week);
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

// creates day buttons - history tab
class HistoryDays extends StatelessWidget {
  final int week;

  const HistoryDays({Key key, this.week}) : super(key: key);
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
        tag: "card$week",
        child: Material(
          child: Column(
            children: <Widget>[
              Material(
                child: ListTile(
                  title: Text("Week $week"),
                  subtitle: Text("Workout history"),
                ),
              ),
              Expanded(
                // workout history goes here
                child: Center(child: Text('hello')),
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



// create home tab buttons
class HomeWeeks extends StatelessWidget {
  final int week;

  const HomeWeeks({Key key, this.week}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card$week",
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
                    color: (week % 2 == 0) ? Colors.grey[200] : Colors.grey[300],
                    child: ListTile(
                      // week buttons - home page
                        title: Text("Week $week",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Comic Sans',
                                fontSize: 30.0))
                    )
                )
              ],
            ),
            Positioned(
                left: 0.0,
                top: 0.0,
                bottom: 0.0,
                right: 0.0,
                child:
                // makes button clickable
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 200));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // navigates to days - home tab
                            return new ListOfDays(day: week);
                          },
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                )




            ),
          ],
        ),
      ),
    );
  }
}

// creates list of days for each week
class ListOfDays extends StatelessWidget {
  final int day;

  const ListOfDays({Key key, this.day}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('Your Workout Days',
            style: TextStyle(
                fontFamily: 'Comic Sans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),),
        ),
        body:
        // number of buttons
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            // navigates to day buttons - home tab
            return HomeDays(day: index + 1);
          },
        ),
      ),
    );
  }
}

// creates day buttons - home tab
class HomeDays extends StatelessWidget {
  final int day;

  const HomeDays({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card$day",
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
                // if this is true
                (day <5) ?
                // then do this
                Material(
                  // colors every other light/darker grey
                    color: (day % 2 == 0) ? Colors.grey[200] : Colors.grey[300],
                    child: ListTile(
                      // title of buttons
                        title: Text("Day $day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Comic Sans',
                                fontSize: 30.0))
                    )
                ) // if not, do this
                    :
                Material(
                  color:  Colors.blue[900],
                  child: ListTile(
                    // title of buttons
                      title: Text("Go Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comic Sans',
                              fontSize: 30.0,
                              foreground: Paint()
                                ..color = Colors.white))

                  ),
                )
              ],
            ),
            Positioned(
                left: 0.0,
                top: 0.0,
                bottom: 0.0,
                right: 0.0,
                child:
                (day <5) ?
                // makes button clickable
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 200));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new ExercisePage(day: day);
                          },
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                )
                    :
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 200));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new HomeWeeks(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                )



            ),
          ],
        ),
      ),
    );
  }
}

// page when clicked - home tab
class ExercisePage extends StatelessWidget {
  final int day;

  const ExercisePage({Key key, this.day}) : super(key: key);


// day 1 week 1 workout
  _day1w1(){
    return Center(
        child: ListView(
            children: <Widget>[
              // if (week ==1) ,
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Back Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),

              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Overhead Press/Jerk",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),

              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Clean Pull from Athletic Position",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),

              // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Pulls",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),

              // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Planks",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
            ]
        )
    );
  }

  // day 2 week 1 workout
  _day2w1(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Thrusters",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Hex Bar Deadlift",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 3',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Bench Press",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 x 5',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Push",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Choice Core",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
            ]
        )
    );
  }

  // day 3 week 1 workout
  _day3w1(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Clean and Press",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max(at least 12)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Incline Bench",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max(at least 12)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Goblet Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max(at least 12)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Pushups",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),]
        )
    );
  }

  // day 4 week 1 workout
  _day4w1(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Overhead Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('5 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Clean Pull from Hang Pos.",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //input
              Material(
                  color: Colors.grey[300],
                  child: SizedBox(
                    height: 25.0,
                    width: double.infinity,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "  Enter Weight"
                        )
                    ),
                  )
              ),
              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Elbow Whips",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x practice',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Reverse Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4 each',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("YTWL",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('2 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              // lift 6
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Arms",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),]
        )
    );
  }

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
        tag: "card$day",
        child: Material(
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.blueGrey[900],
                child: ListTile(
                  // title on top of page
                  title: Text("Day $day",
                      style: TextStyle(
                          fontSize: 18.0,
                          foreground: Paint()
                            ..color = Colors.white)
                  ),
                  subtitle: Text("Exercises",
                      style: TextStyle(
                          foreground: Paint()
                            ..color = Colors.white)),
                ),
              ),
              // which workout is displayed
              if (day ==1)
                Expanded(
                  child: Center(
                      child: _day1w1()),
                ), if (day ==2) Expanded(
                child: Center(
                    child: _day2w1()),
              ), if (day ==3) Expanded(
                child: Center(
                    child: _day3w1()),
              ),  if (day ==4) Expanded(
                child: Center(
                    child: _day4w1()),
              ),
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