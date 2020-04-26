import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
      home: WholeApp(),
    );
  }

//hi() {}
}
class WholeApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey[800],
        ),

        // number of tabs
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(),

            // name of tabs
            body: TabBarView(
                children: <Widget>[
                  HomeTab(),
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
                            return new ListOfDays(week: week);
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
  final int week;

  const ListOfDays({Key key, this.day, this.week}) : super(key: key);
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
          // back button
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
        // number of buttons
        ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            // navigates to day buttons - home tab
            return HomeDays(day: index + 1, week: week);
          },
        ),
      ),
    );
  }
}

// creates day buttons - home tab
class HomeDays extends StatelessWidget {
  final int day;
  final int week;



  const HomeDays({Key key, this.day, this.week}) : super(key: key);

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
                  )
                ]
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
                            return new ExercisePage(day: day, week: week);
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

// page when clicked - home tab
class ExercisePage extends StatefulWidget {
  final int day;
  final int week;


  ExercisePage({Key key, this.day, this.week}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  TextEditingController myController = TextEditingController();
  String weight;

  Future<Null> storeName(String newWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight", newWeight);
  }

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight = prefs.getString("weight");
    setState(() {
      myController = new TextEditingController(text: weight);
    });
  }
  @override
  void initState() {
    super.initState();
    weight = "";
    getSharedPrefs();
  }


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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str) {
                        setState(() {
                          weight = str;
                          storeName(str);
                        });
                      },
                      controller: myController,
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

  _day1w4(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Back Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 8',
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
                  subtitle: Text('5 x 3',
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
                  title: Text("Clean Pull from Hang",
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
              // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Clean Pops",
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
              // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Bear Crawl",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets of 1 minute',
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

  _day2w4(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Thrusters",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 8',
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
              ), // lift 2
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Hex Bar Deadlift",
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
              ),   // lift 3
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Bench Press",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 10',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),    //input
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
              ),           // lift 4
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Choice Push",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('6 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),            // lift 5
              Card(color: Colors.grey[300],
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

  _day3w4(){
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
                  subtitle: Text('4 sets Vol Max (at least 15)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),    //input
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
              ),       // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Incline Bench",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max (at least 15)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),    //input
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
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Goblet Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max (at least 15)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),    //input
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
              ),          // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Push-Ups",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets Vol Max (at least 15)',
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

  _day4w4(){
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
                  subtitle: Text('3 x 8',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),          // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Snatch Pull from Athletic",
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
              ),   //input
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
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Reverse Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 10',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),          // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("RDL",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 8',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),           // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Choice Pulls",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('6 sets',
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

  _day1w7(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Back Squat and Overhead Press",
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
              ),   //input
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
              )  ,        // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Overhead Squat",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 5',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),           // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Incline Bench Press",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 8',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),           // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Arms",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('6 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),           // lift 5
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Planks",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets of 1 minute',
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

  _day2w7(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Clean High Pull from Hang",
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
              ),   //input
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
              ),           // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Power Snatch",
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
              ),   //input
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
              ),           // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Dumbbell Bench Press",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 12',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),          // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Pulls",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('6 sets',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),           // lift 5
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

  _day3w7(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Hex Bar Deadlift",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 heavy sets, Vol Max (no more than 10)',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),          // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Box Jumps",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets, Vol Max',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Weighted Walking Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets for yardage',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),           // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("4-Count Push-Ups",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 sets, Vol Max',
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

  _day4w7(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Snatch Pull from Hang",
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
              ),   //input
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
              ),           // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("RDL",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 8',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Overhead Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('3 x 8 ea',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),   //input
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
              ),           // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Choice Push",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('6 sets',
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
        tag: "card${widget.day}",
        child: Material(
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.blueGrey[900],
                child: ListTile(
                  // title on top of page
                  title: Text("Day ${widget.day}",
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
              // ------- week 1
              if (widget.week == 1 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w1()),
                ), if (widget.week == 1 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w1()),
              ), if (widget.week == 1 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w1()),
              ),  if (widget.week == 1 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w1()),
              ),  // ----------- week 2
              if (widget.week == 2 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w1()),
                ), if (widget.week == 2 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w1()),
              ), if (widget.week == 2 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w1()),
              ),  if (widget.week == 2 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w1()),
              ),  // --------- week 3
              if (widget.week == 3 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w1()),
                ), if (widget.week == 3 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w1()),
              ), if (widget.week == 3 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w1()),
              ),  if (widget.week == 3 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w1()),
              ), // ---------- week 4
              if (widget.week == 4 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w4()),
                ), if (widget.week == 4 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w4()),
              ), if (widget.week == 4 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w4()),
              ),  if (widget.week == 4 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w4()),
              ),  // -----------  week 5
              if (widget.week == 5 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w4()),
                ), if (widget.week == 5 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w4()),
              ), if (widget.week == 5 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w4()),
              ),  if (widget.week == 5 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w4()),
              ),   // ----------- week 6
              if (widget.week == 6 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w4()),
                ), if (widget.week == 6 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w4()),
              ), if (widget.week == 6 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w4()),
              ),  if (widget.week == 6 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w4()),
              ),   // ----------- week 7
              if (widget.week == 7 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w7()),
                ), if (widget.week == 7 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w7()),
              ), if (widget.week == 7 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w7()),
              ),  if (widget.week == 7 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w7()),
              ),   // ----------- week 8
              if (widget.week == 8 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w7()),
                ), if (widget.week == 8 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w7()),
              ), if (widget.week == 8 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w7()),
              ),  if (widget.week == 8 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w7()),
              ),   // ----------- week 9
              if (widget.week == 9 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w7()),
                ), if (widget.week == 9 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w7()),
              ), if (widget.week == 9 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w7()),
              ),  if (widget.week == 9 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w7()),
              ),   // ----------- week 10
              if (widget.week == 10 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w7()),
                ), if (widget.week == 10 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w7()),
              ), if (widget.week == 10 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w7()),
              ),  if (widget.week == 10 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w7()),
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