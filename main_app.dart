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
          itemCount: 11,
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

  @override
  void initState() {
    super.initState();
    weight = "";
    weight2 = "";
    weight3 = "";
    getSharedPrefs();
    getSharedPrefs2();
    getSharedPrefs3();
    weight4 = "";
    weight5 = "";
    weight6 = "";
    getSharedPrefs4();
    getSharedPrefs5();
    getSharedPrefs6();
    weight7 = "";
    weight8 = "";
    weight9 = "";
    getSharedPrefs7();
    getSharedPrefs8();
    getSharedPrefs9();
    weight10 = "";
    weight11 = "";
    getSharedPrefs10();
    getSharedPrefs11();
    weight12 = "";
    weight13 = "";
    weight14 = "";
    getSharedPrefs12();
    getSharedPrefs13();
    getSharedPrefs14();
    weight15 = "";
    weight16 = "";
    weight17 = "";
    getSharedPrefs15();
    getSharedPrefs16();
    getSharedPrefs17();
    weight18 = "";
    weight19 = "";
    weight20 = "";
    getSharedPrefs18();
    getSharedPrefs19();
    getSharedPrefs20();
    weight21 = "";
    weight22 = "";
    getSharedPrefs21();
    getSharedPrefs22();
    weight23 = "";
    weight24 = "";
    weight25 = "";
    getSharedPrefs23();
    getSharedPrefs24();
    getSharedPrefs25();
    weight26 = "";
    weight27 = "";
    weight28 = "";
    getSharedPrefs26();
    getSharedPrefs27();
    getSharedPrefs28();
    weight29 = "";
    weight30 = "";
    weight31 = "";
    getSharedPrefs29();
    getSharedPrefs30();
    getSharedPrefs31();
    weight32 = "";
    weight33 = "";
    getSharedPrefs32();
    getSharedPrefs33();
    weight34 = "";
    weight35 = "";
    weight36= "";
    getSharedPrefs34();
    getSharedPrefs35();
    getSharedPrefs36();
    weight37 = "";
    weight38 = "";
    weight39 = "";
    getSharedPrefs37();
    getSharedPrefs38();
    getSharedPrefs39();
    weight40 = "";
    weight41 = "";
    weight42 = "";
    getSharedPrefs40();
    getSharedPrefs41();
    getSharedPrefs42();
    weight43 = "";
    weight44 = "";
    weight45 = "";
    getSharedPrefs43();
    getSharedPrefs44();
    getSharedPrefs45();

    weight46 = "";
    weight47 = "";
    weight48= "";
    getSharedPrefs46();
    getSharedPrefs47();
    getSharedPrefs48();
    weight49 = "";
    weight50 = "";
    weight51 = "";
    getSharedPrefs49();
    getSharedPrefs50();
    getSharedPrefs51();
    weight52 = "";
    weight53 = "";
    weight54 = "";
    getSharedPrefs52();
    getSharedPrefs53();
    getSharedPrefs54();
    weight55 = "";
    weight56 = "";
    weight57 = "";
    getSharedPrefs55();
    getSharedPrefs56();
    getSharedPrefs57();

    weight58 = "";
    weight59 = "";
    weight60= "";
    getSharedPrefs58();
    getSharedPrefs59();
    getSharedPrefs60();
    weight61 = "";
    weight62 = "";
    weight63 = "";
    getSharedPrefs61();
    getSharedPrefs62();
    getSharedPrefs63();
    weight64 = "";
    weight65 = "";
    weight66 = "";
    getSharedPrefs64();
    getSharedPrefs65();
    getSharedPrefs66();
    weight67 = "";
    weight68 = "";
    weight69 = "";
    getSharedPrefs67();
    getSharedPrefs68();
    getSharedPrefs69();

    weight68 = "";
    weight69 = "";
    weight70 = "";
    getSharedPrefs68();
    getSharedPrefs69();
    getSharedPrefs70();
    weight71 = "";
    weight72 = "";
    weight73 = "";
    getSharedPrefs71();
    getSharedPrefs72();
    getSharedPrefs73();

    weight74 = "";
    weight75 = "";
    weight76= "";

    getSharedPrefs74();
    getSharedPrefs75();
    weight77 = "";
    weight78 = "";
    weight79 = "";
    getSharedPrefs76();
    getSharedPrefs77();
    getSharedPrefs78();
    weight80 = "";
    weight81 = "";
    weight82 = "";
    getSharedPrefs79();
    getSharedPrefs80();
    getSharedPrefs81();
    weight83 = "";
    weight84 = "";
    weight85 = "";
    getSharedPrefs82();
    getSharedPrefs83();
    getSharedPrefs84();
    weight86 = "";
    weight87 = "";
    weight88 = "";
    weight89 = "";
    weight90 = "";
    weight91 = "";
    getSharedPrefs85();
    getSharedPrefs86();
    getSharedPrefs87();
    getSharedPrefs88();
    getSharedPrefs89();
    getSharedPrefs90();
    getSharedPrefs91();

    weight92 = "";
    weight93 = "";
    weight94 = "";
    weight95 = "";
    weight96 = "";
    weight97 = "";
    weight98 = "";
    weight99 = "";
    weight100 = "";
    weight101 = "";
    weight102 = "";

    getSharedPrefs92();
    getSharedPrefs93();
    getSharedPrefs94();
    getSharedPrefs95();
    getSharedPrefs96();
    getSharedPrefs97();
    getSharedPrefs98();
    getSharedPrefs99();
    getSharedPrefs100();
    getSharedPrefs101();
    getSharedPrefs102();

    weight103 = "";
    weight104 = "";
    weight105 = "";
    weight106 = "";
    weight107 = "";
    weight108 = "";
    weight109 = "";
    weight110 = "";
    weight111 = "";
    weight112 = "";
    weight113 = "";
    weight114 = "";

    getSharedPrefs103();
    getSharedPrefs104();
    getSharedPrefs105();
    getSharedPrefs106();
    getSharedPrefs107();
    getSharedPrefs108();
    getSharedPrefs109();
    getSharedPrefs110();
    getSharedPrefs111();
    getSharedPrefs112();
    getSharedPrefs113();
    getSharedPrefs114();

    weight115 = "";
    weight116 = "";
    weight117 = "";
    weight118 = "";
    weight119 = "";
    weight120 = "";
    weight121 = "";
    weight122 = "";
    weight123 = "";
    weight124 = "";
    weight125 = "";
    weight126 = "";

    getSharedPrefs115();
    getSharedPrefs116();
    getSharedPrefs117();
    getSharedPrefs118();
    getSharedPrefs119();
    getSharedPrefs120();
    getSharedPrefs121();
    getSharedPrefs122();
    getSharedPrefs123();
    getSharedPrefs124();
    getSharedPrefs125();
    getSharedPrefs126();


  }
// day 1 controllers
  TextEditingController myController = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();

  String weight;
  String weight2;
  String weight3;


  Future<Null> storeName(String newWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight", newWeight);
  }
  Future<Null> storeName2(String newWeight2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight2", newWeight2);
  }
  Future<Null> storeName3(String newWeight3) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight3", newWeight3);
  }

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight = prefs.getString("weight");
    setState(() {
      myController = new TextEditingController(text: weight);
    });
  }

  Future<Null> getSharedPrefs2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight2 = prefs.getString("weight2");
    setState(() {
      myController2 = new TextEditingController(text: weight2);
    });
  }
  Future<Null> getSharedPrefs3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight3 = prefs.getString("weight3");
    setState(() {
      myController3 = new TextEditingController(text: weight3);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str2) {
                        setState(() {
                          weight2 = str2;
                          storeName2(str2);
                        });
                      },
                      controller: myController2,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str3) {
                        setState(() {
                          weight3 = str3;
                          storeName3(str3);
                        });
                      },
                      controller: myController3,
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

  TextEditingController myController4 = TextEditingController();
  TextEditingController myController5 = TextEditingController();
  TextEditingController myController6 = TextEditingController();

  String weight4;
  String weight5;
  String weight6;


  Future<Null> storeName4(String newWeight4) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight4", newWeight4);
  }
  Future<Null> storeName5(String newWeight5) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight5", newWeight5);
  }
  Future<Null> storeName6(String newWeight6) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight6", newWeight6);
  }

  Future<Null> getSharedPrefs4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight4 = prefs.getString("weight4");
    setState(() {
      myController4 = new TextEditingController(text: weight4);
    });
  }

  Future<Null> getSharedPrefs5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight5 = prefs.getString("weight5");
    setState(() {
      myController5 = new TextEditingController(text: weight5);
    });
  }
  Future<Null> getSharedPrefs6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight6 = prefs.getString("weight6");
    setState(() {
      myController6 = new TextEditingController(text: weight6);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str4) {
                        setState(() {
                          weight4 = str4;
                          storeName4(str4);
                        });
                      },
                      controller: myController4,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str5) {
                        setState(() {
                          weight5 = str5;
                          storeName5(str5);
                        });
                      },
                      controller: myController5,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str6) {
                        setState(() {
                          weight6 = str6;
                          storeName6(str6);
                        });
                      },
                      controller: myController6,
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

  TextEditingController myController7 = TextEditingController();
  TextEditingController myController8 = TextEditingController();
  TextEditingController myController9 = TextEditingController();

  String weight7;
  String weight8;
  String weight9;


  Future<Null> storeName7(String newWeight7) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight7", newWeight7);
  }
  Future<Null> storeName8(String newWeight8) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight8", newWeight8);
  }
  Future<Null> storeName9(String newWeight9) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight9", newWeight9);
  }

  Future<Null> getSharedPrefs7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight7 = prefs.getString("weight7");
    setState(() {
      myController7 = new TextEditingController(text: weight7);
    });
  }

  Future<Null> getSharedPrefs8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight8 = prefs.getString("weight8");
    setState(() {
      myController8 = new TextEditingController(text: weight8);
    });
  }
  Future<Null> getSharedPrefs9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight9 = prefs.getString("weight9");
    setState(() {
      myController9 = new TextEditingController(text: weight9);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str7) {
                        setState(() {
                          weight7 = str7;
                          storeName7(str7);
                        });
                      },
                      controller: myController7,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str8) {
                        setState(() {
                          weight8 = str8;
                          storeName8(str8);
                        });
                      },
                      controller: myController8,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str9) {
                        setState(() {
                          weight9 = str9;
                          storeName9(str9);
                        });
                      },
                      controller: myController9,
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

  TextEditingController myController10 = TextEditingController();
  TextEditingController myController11 = TextEditingController();


  String weight10;
  String weight11;



  Future<Null> storeName10(String newWeight10) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight10", newWeight10);
  }
  Future<Null> storeName11(String newWeight11) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight11", newWeight11);
  }

  Future<Null> getSharedPrefs10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight10 = prefs.getString("weight10");
    setState(() {
      myController10 = new TextEditingController(text: weight10);
    });
  }

  Future<Null> getSharedPrefs11() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight11 = prefs.getString("weight11");
    setState(() {
      myController11 = new TextEditingController(text: weight11);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str10) {
                        setState(() {
                          weight10 = str10;
                          storeName10(str10);
                        });
                      },
                      controller: myController10,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str11) {
                        setState(() {
                          weight11 = str11;
                          storeName11(str11);
                        });
                      },
                      controller: myController11,
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
  //------------------week 2

  // day 1 controllers
  TextEditingController myController12 = TextEditingController();
  TextEditingController myController13 = TextEditingController();
  TextEditingController myController14 = TextEditingController();

  String weight12;
  String weight13;
  String weight14;


  Future<Null> storeName12(String newWeight12) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight12", newWeight12);
  }
  Future<Null> storeName13(String newWeight13) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight13", newWeight13);
  }
  Future<Null> storeName14(String newWeight14) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight14", newWeight14);
  }

  Future<Null> getSharedPrefs12() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight12 = prefs.getString("weight12");
    setState(() {
      myController12 = new TextEditingController(text: weight12);
    });
  }

  Future<Null> getSharedPrefs13() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight13 = prefs.getString("weight13");
    setState(() {
      myController13 = new TextEditingController(text: weight13);
    });
  }
  Future<Null> getSharedPrefs14() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight14 = prefs.getString("weight14");
    setState(() {
      myController14 = new TextEditingController(text: weight14);
    });
  }



  _day1w2(){
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
                      onChanged: (String str12) {
                        setState(() {
                          weight12 = str12;
                          storeName12(str12);
                        });
                      },
                      controller: myController12,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str13) {
                        setState(() {
                          weight13 = str13;
                          storeName13(str13);
                        });
                      },
                      controller: myController13,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str14) {
                        setState(() {
                          weight14 = str14;
                          storeName14(str14);
                        });
                      },
                      controller: myController14,
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

  TextEditingController myController15 = TextEditingController();
  TextEditingController myController16 = TextEditingController();
  TextEditingController myController17 = TextEditingController();

  String weight15;
  String weight16;
  String weight17;


  Future<Null> storeName15(String newWeight15) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight15", newWeight15);
  }
  Future<Null> storeName16(String newWeight16) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight16", newWeight16);
  }
  Future<Null> storeName17(String newWeight17) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight17", newWeight17);
  }

  Future<Null> getSharedPrefs15() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight15 = prefs.getString("weight15");
    setState(() {
      myController15 = new TextEditingController(text: weight15);
    });
  }

  Future<Null> getSharedPrefs16() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight16 = prefs.getString("weight16");
    setState(() {
      myController16 = new TextEditingController(text: weight16);
    });
  }
  Future<Null> getSharedPrefs17() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight17 = prefs.getString("weight17");
    setState(() {
      myController17 = new TextEditingController(text: weight17);
    });
  }


  _day2w2(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str15) {
                        setState(() {
                          weight15 = str15;
                          storeName15(str15);
                        });
                      },
                      controller: myController15,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str16) {
                        setState(() {
                          weight16 = str16;
                          storeName16(str16);
                        });
                      },
                      controller: myController16,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str17) {
                        setState(() {
                          weight17 = str17;
                          storeName17(str17);
                        });
                      },
                      controller: myController17,
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

  TextEditingController myController18 = TextEditingController();
  TextEditingController myController19= TextEditingController();
  TextEditingController myController20= TextEditingController();

  String weight18;
  String weight19;
  String weight20;


  Future<Null> storeName18(String newWeight18) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight18", newWeight18);
  }
  Future<Null> storeName19(String newWeight19) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight19", newWeight19);
  }
  Future<Null> storeName20(String newWeight20) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight20", newWeight20);
  }

  Future<Null> getSharedPrefs18() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight18 = prefs.getString("weight18");
    setState(() {
      myController18 = new TextEditingController(text: weight18);
    });
  }

  Future<Null> getSharedPrefs19() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight19 = prefs.getString("weight19");
    setState(() {
      myController19 = new TextEditingController(text: weight19);
    });
  }
  Future<Null> getSharedPrefs20() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight20 = prefs.getString("weight20");
    setState(() {
      myController20 = new TextEditingController(text: weight20);
    });
  }

  _day3w2(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str18) {
                        setState(() {
                          weight18 = str18;
                          storeName18(str18);
                        });
                      },
                      controller: myController18,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str19) {
                        setState(() {
                          weight19 = str19;
                          storeName19(str19);
                        });
                      },
                      controller: myController19,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str20) {
                        setState(() {
                          weight20 = str20;
                          storeName20(str20);
                        });
                      },
                      controller: myController20,
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

  TextEditingController myController21 = TextEditingController();
  TextEditingController myController22 = TextEditingController();


  String weight21;
  String weight22;



  Future<Null> storeName21(String newWeight21) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight21", newWeight21);
  }
  Future<Null> storeName22(String newWeight22) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight22", newWeight22);
  }

  Future<Null> getSharedPrefs21() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight21 = prefs.getString("weight21");
    setState(() {
      myController21 = new TextEditingController(text: weight21);
    });
  }

  Future<Null> getSharedPrefs22() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight22 = prefs.getString("weight22");
    setState(() {
      myController22 = new TextEditingController(text: weight22);
    });
  }


  _day4w2(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str21) {
                        setState(() {
                          weight21 = str21;
                          storeName21(str21);
                        });
                      },
                      controller: myController21,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str22) {
                        setState(() {
                          weight22 = str22;
                          storeName22(str22);
                        });
                      },
                      controller: myController22,
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



  // --------------------week 2 end



  //------------week 3

  // day 1 controllers
  TextEditingController myController23 = TextEditingController();
  TextEditingController myController24 = TextEditingController();
  TextEditingController myController25 = TextEditingController();

  String weight23;
  String weight24;
  String weight25;


  Future<Null> storeName23(String newWeight23) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight23", newWeight23);
  }
  Future<Null> storeName24(String newWeight24) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight24", newWeight24);
  }
  Future<Null> storeName25(String newWeight25) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight25", newWeight25);
  }

  Future<Null> getSharedPrefs23() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight23 = prefs.getString("weight23");
    setState(() {
      myController23 = new TextEditingController(text: weight23);
    });
  }

  Future<Null> getSharedPrefs24() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight24 = prefs.getString("weight24");
    setState(() {
      myController24 = new TextEditingController(text: weight24);
    });
  }
  Future<Null> getSharedPrefs25() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight25 = prefs.getString("weight25");
    setState(() {
      myController25 = new TextEditingController(text: weight25);
    });
  }



  _day1w3(){
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
                      onChanged: (String str23) {
                        setState(() {
                          weight23 = str23;
                          storeName23(str23);
                        });
                      },
                      controller: myController23,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str24) {
                        setState(() {
                          weight24 = str24;
                          storeName24(str24);
                        });
                      },
                      controller: myController24,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str25) {
                        setState(() {
                          weight25 = str25;
                          storeName25(str25);
                        });
                      },
                      controller: myController25,
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

  TextEditingController myController26 = TextEditingController();
  TextEditingController myController27 = TextEditingController();
  TextEditingController myController28 = TextEditingController();

  String weight26;
  String weight27;
  String weight28;


  Future<Null> storeName26(String newWeight26) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight26", newWeight26);
  }
  Future<Null> storeName27(String newWeight27) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight27", newWeight27);
  }
  Future<Null> storeName28(String newWeight28) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight28", newWeight28);
  }

  Future<Null> getSharedPrefs26() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight26 = prefs.getString("weight26");
    setState(() {
      myController26 = new TextEditingController(text: weight26);
    });
  }

  Future<Null> getSharedPrefs27() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight27 = prefs.getString("weight27");
    setState(() {
      myController27 = new TextEditingController(text: weight27);
    });
  }
  Future<Null> getSharedPrefs28() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight28 = prefs.getString("weight28");
    setState(() {
      myController28 = new TextEditingController(text: weight28);
    });
  }


  _day2w3(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str26) {
                        setState(() {
                          weight26 = str26;
                          storeName26(str26);
                        });
                      },
                      controller: myController26,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str27) {
                        setState(() {
                          weight27 = str27;
                          storeName27(str27);
                        });
                      },
                      controller: myController27,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str28) {
                        setState(() {
                          weight28 = str28;
                          storeName28(str28);
                        });
                      },
                      controller: myController28,
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

  TextEditingController myController29 = TextEditingController();
  TextEditingController myController30= TextEditingController();
  TextEditingController myController31= TextEditingController();

  String weight29;
  String weight30;
  String weight31;


  Future<Null> storeName29(String newWeight29) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight29", newWeight29);
  }
  Future<Null> storeName30(String newWeight30) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight30", newWeight30);
  }
  Future<Null> storeName31(String newWeight31) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight31", newWeight31);
  }

  Future<Null> getSharedPrefs29() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight29 = prefs.getString("weight29");
    setState(() {
      myController29 = new TextEditingController(text: weight29);
    });
  }

  Future<Null> getSharedPrefs30() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight30 = prefs.getString("weight30");
    setState(() {
      myController30 = new TextEditingController(text: weight30);
    });
  }
  Future<Null> getSharedPrefs31() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight31 = prefs.getString("weight31");
    setState(() {
      myController31 = new TextEditingController(text: weight31);
    });
  }

  _day3w3(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str29) {
                        setState(() {
                          weight29 = str29;
                          storeName29(str29);
                        });
                      },
                      controller: myController29,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str30) {
                        setState(() {
                          weight30 = str30;
                          storeName30(str30);
                        });
                      },
                      controller: myController30,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str31) {
                        setState(() {
                          weight31 = str31;
                          storeName31(str31);
                        });
                      },
                      controller: myController31,
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

  TextEditingController myController32 = TextEditingController();
  TextEditingController myController33 = TextEditingController();


  String weight32;
  String weight33;



  Future<Null> storeName32(String newWeight32) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight32", newWeight32);
  }
  Future<Null> storeName33(String newWeight33) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight33", newWeight33);
  }

  Future<Null> getSharedPrefs32() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight32 = prefs.getString("weight32");
    setState(() {
      myController32 = new TextEditingController(text: weight32);
    });
  }

  Future<Null> getSharedPrefs33() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight33 = prefs.getString("weight33");
    setState(() {
      myController33 = new TextEditingController(text: weight33);
    });
  }


  _day4w3(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str32) {
                        setState(() {
                          weight32 = str32;
                          storeName32(str32);
                        });
                      },
                      controller: myController32,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str33) {
                        setState(() {
                          weight33 = str33;
                          storeName33(str33);
                        });
                      },
                      controller: myController33,
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


  //-----------week 3 end


  //----------week 4


  TextEditingController myController34 = TextEditingController();
  TextEditingController myController35 = TextEditingController();
  TextEditingController myController36 = TextEditingController();

  String weight34;
  String weight35;
  String weight36;


  Future<Null> storeName34(String newWeight34) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight34", newWeight34);
  }
  Future<Null> storeName35(String newWeight35) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight35", newWeight35);
  }
  Future<Null> storeName36(String newWeight36) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight36", newWeight36);
  }

  Future<Null> getSharedPrefs34() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight24 = prefs.getString("weight34");
    setState(() {
      myController34 = new TextEditingController(text: weight34);
    });
  }

  Future<Null> getSharedPrefs35() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight35 = prefs.getString("weight35");
    setState(() {
      myController35 = new TextEditingController(text: weight35);
    });
  }
  Future<Null> getSharedPrefs36() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight36 = prefs.getString("weight36");
    setState(() {
      myController36 = new TextEditingController(text: weight36);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str34) {
                        setState(() {
                          weight34 = str34;
                          storeName34(str34);
                        });
                      },
                      controller: myController34,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str35) {
                        setState(() {
                          weight35 = str35;
                          storeName35(str35);
                        });
                      },
                      controller: myController35,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str36) {
                        setState(() {
                          weight36 = str36;
                          storeName36(str36);
                        });
                      },
                      controller: myController36,
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
// --------------day2
  TextEditingController myController37 = TextEditingController();
  TextEditingController myController38 = TextEditingController();
  TextEditingController myController39 = TextEditingController();

  String weight37;
  String weight38;
  String weight39;


  Future<Null> storeName37(String newWeight37) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight37", newWeight37);
  }
  Future<Null> storeName38(String newWeight38) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight38", newWeight38);
  }
  Future<Null> storeName39(String newWeight39) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight39", newWeight39);
  }

  Future<Null> getSharedPrefs37() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight37 = prefs.getString("weight37");
    setState(() {
      myController37 = new TextEditingController(text: weight37);
    });
  }

  Future<Null> getSharedPrefs38() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight38 = prefs.getString("weight38");
    setState(() {
      myController38 = new TextEditingController(text: weight38);
    });
  }
  Future<Null> getSharedPrefs39() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight39 = prefs.getString("weight39");
    setState(() {
      myController39 = new TextEditingController(text: weight39);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str37) {
                        setState(() {
                          weight37 = str37;
                          storeName37(str37);
                        });
                      },
                      controller: myController37,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str38) {
                        setState(() {
                          weight38 = str38;
                          storeName38(str38);
                        });
                      },
                      controller: myController38,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str39) {
                        setState(() {
                          weight39 = str39;
                          storeName39(str39);
                        });
                      },
                      controller: myController39,
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

  // day 3
  TextEditingController myController40 = TextEditingController();
  TextEditingController myController41 = TextEditingController();
  TextEditingController myController42 = TextEditingController();

  String weight40;
  String weight41;
  String weight42;


  Future<Null> storeName40(String newWeight40) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight40", newWeight40);
  }
  Future<Null> storeName41(String newWeight41) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight41", newWeight41);
  }
  Future<Null> storeName42(String newWeight42) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight42", newWeight42);
  }

  Future<Null> getSharedPrefs40() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight40 = prefs.getString("weight40");
    setState(() {
      myController40 = new TextEditingController(text: weight40);
    });
  }

  Future<Null> getSharedPrefs41() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight41 = prefs.getString("weight41");
    setState(() {
      myController41 = new TextEditingController(text: weight41);
    });
  }
  Future<Null> getSharedPrefs42() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight42 = prefs.getString("weight42");
    setState(() {
      myController42 = new TextEditingController(text: weight42);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str40) {
                        setState(() {
                          weight40 = str40;
                          storeName40(str40);
                        });
                      },
                      controller: myController40,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str41) {
                        setState(() {
                          weight41 = str41;
                          storeName41(str41);
                        });
                      },
                      controller: myController41,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str42) {
                        setState(() {
                          weight42 = str42;
                          storeName42(str42);
                        });
                      },
                      controller: myController42,
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

  //------------day4
  TextEditingController myController43 = TextEditingController();
  TextEditingController myController44 = TextEditingController();
  TextEditingController myController45 = TextEditingController();

  String weight43;
  String weight44;
  String weight45;


  Future<Null> storeName43(String newWeight43) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight43", newWeight43);
  }
  Future<Null> storeName44(String newWeight44) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight44", newWeight44);
  }
  Future<Null> storeName45(String newWeight45) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight45", newWeight45);
  }

  Future<Null> getSharedPrefs43() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight43 = prefs.getString("weight43");
    setState(() {
      myController43 = new TextEditingController(text: weight43);
    });
  }

  Future<Null> getSharedPrefs44() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight44 = prefs.getString("weight44");
    setState(() {
      myController44 = new TextEditingController(text: weight44);
    });
  }
  Future<Null> getSharedPrefs45() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight45 = prefs.getString("weight45");
    setState(() {
      myController45 = new TextEditingController(text: weight45);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str43) {
                        setState(() {
                          weight43 = str43;
                          storeName43(str43);
                        });
                      },
                      controller: myController43,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str44) {
                        setState(() {
                          weight44 = str44;
                          storeName44(str44);
                        });
                      },
                      controller: myController44,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str45) {
                        setState(() {
                          weight45 = str45;
                          storeName45(str45);
                        });
                      },
                      controller: myController45,
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
  //---------------------end week 4

  //------------------start week 5


  TextEditingController myController46 = TextEditingController();
  TextEditingController myController47 = TextEditingController();
  TextEditingController myController48 = TextEditingController();

  String weight46;
  String weight47;
  String weight48;


  Future<Null> storeName46(String newWeight46) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight46", newWeight46);
  }
  Future<Null> storeName47(String newWeight47) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight47", newWeight47);
  }
  Future<Null> storeName48(String newWeight48) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight48", newWeight48);
  }

  Future<Null> getSharedPrefs46() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight46 = prefs.getString("weight46");
    setState(() {
      myController46 = new TextEditingController(text: weight46);
    });
  }

  Future<Null> getSharedPrefs47() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight47 = prefs.getString("weight47");
    setState(() {
      myController47 = new TextEditingController(text: weight47);
    });
  }
  Future<Null> getSharedPrefs48() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight48 = prefs.getString("weight48");
    setState(() {
      myController48 = new TextEditingController(text: weight48);
    });
  }


  _day1w5(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str46) {
                        setState(() {
                          weight46 = str46;
                          storeName46(str46);
                        });
                      },
                      controller: myController46,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str47) {
                        setState(() {
                          weight47 = str47;
                          storeName47(str47);
                        });
                      },
                      controller: myController47,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str48) {
                        setState(() {
                          weight48 = str48;
                          storeName48(str48);
                        });
                      },
                      controller: myController48,
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
// --------------day2
  TextEditingController myController49 = TextEditingController();
  TextEditingController myController50 = TextEditingController();
  TextEditingController myController51 = TextEditingController();

  String weight49;
  String weight50;
  String weight51;


  Future<Null> storeName49(String newWeight49) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight49", newWeight49);
  }
  Future<Null> storeName50(String newWeight50) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight50", newWeight50);
  }
  Future<Null> storeName51(String newWeight51) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight51", newWeight51);
  }

  Future<Null> getSharedPrefs49() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight49 = prefs.getString("weight49");
    setState(() {
      myController49 = new TextEditingController(text: weight49);
    });
  }

  Future<Null> getSharedPrefs50() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight50 = prefs.getString("weight50");
    setState(() {
      myController50 = new TextEditingController(text: weight50);
    });
  }
  Future<Null> getSharedPrefs51() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight51 = prefs.getString("weight51");
    setState(() {
      myController51 = new TextEditingController(text: weight51);
    });
  }


  _day2w5(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str49) {
                        setState(() {
                          weight49 = str49;
                          storeName49(str49);
                        });
                      },
                      controller: myController49,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str50) {
                        setState(() {
                          weight50 = str50;
                          storeName50(str50);
                        });
                      },
                      controller: myController50,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str51) {
                        setState(() {
                          weight51 = str51;
                          storeName51(str51);
                        });
                      },
                      controller: myController51,
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

  // day 3
  TextEditingController myController52 = TextEditingController();
  TextEditingController myController53 = TextEditingController();
  TextEditingController myController54 = TextEditingController();

  String weight52;
  String weight53;
  String weight54;


  Future<Null> storeName52(String newWeight52) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight52", newWeight52);
  }
  Future<Null> storeName53(String newWeight53) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight53", newWeight53);
  }
  Future<Null> storeName54(String newWeight54) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight54", newWeight54);
  }

  Future<Null> getSharedPrefs52() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight52 = prefs.getString("weight52");
    setState(() {
      myController52 = new TextEditingController(text: weight52);
    });
  }

  Future<Null> getSharedPrefs53() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight53 = prefs.getString("weight53");
    setState(() {
      myController53 = new TextEditingController(text: weight53);
    });
  }
  Future<Null> getSharedPrefs54() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight54 = prefs.getString("weight54");
    setState(() {
      myController54 = new TextEditingController(text: weight54);
    });
  }


  _day3w5(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str52) {
                        setState(() {
                          weight52 = str52;
                          storeName52(str52);
                        });
                      },
                      controller: myController52,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str53) {
                        setState(() {
                          weight53 = str53;
                          storeName53(str53);
                        });
                      },
                      controller: myController53,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str54) {
                        setState(() {
                          weight54 = str54;
                          storeName54(str54);
                        });
                      },
                      controller: myController54,
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

  //------------day4
  TextEditingController myController55 = TextEditingController();
  TextEditingController myController56 = TextEditingController();
  TextEditingController myController57 = TextEditingController();

  String weight55;
  String weight56;
  String weight57;


  Future<Null> storeName55(String newWeight55) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight55", newWeight55);
  }
  Future<Null> storeName56(String newWeight56) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight56", newWeight56);
  }
  Future<Null> storeName57(String newWeight57) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight57", newWeight57);
  }

  Future<Null> getSharedPrefs55() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight55 = prefs.getString("weight55");
    setState(() {
      myController55 = new TextEditingController(text: weight55);
    });
  }

  Future<Null> getSharedPrefs56() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight56 = prefs.getString("weight56");
    setState(() {
      myController56 = new TextEditingController(text: weight56);
    });
  }
  Future<Null> getSharedPrefs57() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight57 = prefs.getString("weight57");
    setState(() {
      myController57 = new TextEditingController(text: weight57);
    });
  }


  _day4w5(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str55) {
                        setState(() {
                          weight55 = str55;
                          storeName55(str55);
                        });
                      },
                      controller: myController55,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str56) {
                        setState(() {
                          weight56 = str56;
                          storeName56(str56);
                        });
                      },
                      controller: myController56,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str57) {
                        setState(() {
                          weight57 = str57;
                          storeName57(str57);
                        });
                      },
                      controller: myController57,
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

  //end week 5------------------

  //start week 6----------------------------


  TextEditingController myController58 = TextEditingController();
  TextEditingController myController59 = TextEditingController();
  TextEditingController myController60 = TextEditingController();

  String weight58;
  String weight59;
  String weight60;


  Future<Null> storeName58(String newWeight58) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight58", newWeight58);
  }
  Future<Null> storeName59(String newWeight59) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight59", newWeight59);
  }
  Future<Null> storeName60(String newWeight60) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight60", newWeight60);
  }

  Future<Null> getSharedPrefs58() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight58 = prefs.getString("weight58");
    setState(() {
      myController58 = new TextEditingController(text: weight58);
    });
  }

  Future<Null> getSharedPrefs59() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight59 = prefs.getString("weight59");
    setState(() {
      myController59 = new TextEditingController(text: weight59);
    });
  }
  Future<Null> getSharedPrefs60() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight60 = prefs.getString("weight60");
    setState(() {
      myController60 = new TextEditingController(text: weight60);
    });
  }


  _day1w6(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str58) {
                        setState(() {
                          weight58 = str58;
                          storeName58(str58);
                        });
                      },
                      controller: myController58,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str59) {
                        setState(() {
                          weight59 = str59;
                          storeName59(str59);
                        });
                      },
                      controller: myController59,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str60) {
                        setState(() {
                          weight60 = str60;
                          storeName60(str60);
                        });
                      },
                      controller: myController60,
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
// --------------day2
  TextEditingController myController61 = TextEditingController();
  TextEditingController myController62 = TextEditingController();
  TextEditingController myController63 = TextEditingController();

  String weight61;
  String weight62;
  String weight63;


  Future<Null> storeName61(String newWeight61) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight61", newWeight61);
  }
  Future<Null> storeName62(String newWeight62) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight62", newWeight62);
  }
  Future<Null> storeName63(String newWeight63) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight63", newWeight63);
  }

  Future<Null> getSharedPrefs61() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight61 = prefs.getString("weight61");
    setState(() {
      myController61 = new TextEditingController(text: weight61);
    });
  }

  Future<Null> getSharedPrefs62() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight62 = prefs.getString("weight62");
    setState(() {
      myController62 = new TextEditingController(text: weight62);
    });
  }
  Future<Null> getSharedPrefs63() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight63 = prefs.getString("weight63");
    setState(() {
      myController63 = new TextEditingController(text: weight63);
    });
  }


  _day2w6(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str61) {
                        setState(() {
                          weight61 = str61;
                          storeName61(str61);
                        });
                      },
                      controller: myController61,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str62) {
                        setState(() {
                          weight62 = str62;
                          storeName62(str62);
                        });
                      },
                      controller: myController62,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str63) {
                        setState(() {
                          weight63 = str63;
                          storeName63(str63);
                        });
                      },
                      controller: myController63,
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

  // day 3
  TextEditingController myController64 = TextEditingController();
  TextEditingController myController65 = TextEditingController();
  TextEditingController myController66 = TextEditingController();

  String weight64;
  String weight65;
  String weight66;


  Future<Null> storeName64(String newWeight64) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight64", newWeight64);
  }
  Future<Null> storeName65(String newWeight65) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight65", newWeight65);
  }
  Future<Null> storeName66(String newWeight66) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight66", newWeight66);
  }

  Future<Null> getSharedPrefs64() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight64 = prefs.getString("weight64");
    setState(() {
      myController64 = new TextEditingController(text: weight64);
    });
  }

  Future<Null> getSharedPrefs65() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight65 = prefs.getString("weight65");
    setState(() {
      myController65 = new TextEditingController(text: weight65);
    });
  }
  Future<Null> getSharedPrefs66() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight66 = prefs.getString("weight66");
    setState(() {
      myController66 = new TextEditingController(text: weight66);
    });
  }


  _day3w6(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str64) {
                        setState(() {
                          weight64 = str64;
                          storeName64(str64);
                        });
                      },
                      controller: myController64,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str65) {
                        setState(() {
                          weight65 = str65;
                          storeName65(str65);
                        });
                      },
                      controller: myController65,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str66) {
                        setState(() {
                          weight66 = str66;
                          storeName66(str66);
                        });
                      },
                      controller: myController66,
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

  //------------day4
  TextEditingController myController67 = TextEditingController();
  TextEditingController myController68 = TextEditingController();
  TextEditingController myController69 = TextEditingController();

  String weight67;
  String weight68;
  String weight69;


  Future<Null> storeName67(String newWeight67) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight67", newWeight67);
  }
  Future<Null> storeName68(String newWeight68) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight68", newWeight68);
  }
  Future<Null> storeName69(String newWeight69) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight69", newWeight69);
  }

  Future<Null> getSharedPrefs67() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight67 = prefs.getString("weight67");
    setState(() {
      myController67 = new TextEditingController(text: weight67);
    });
  }

  Future<Null> getSharedPrefs68() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight68 = prefs.getString("weight68");
    setState(() {
      myController68 = new TextEditingController(text: weight68);
    });
  }
  Future<Null> getSharedPrefs69() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight69 = prefs.getString("weight69");
    setState(() {
      myController69 = new TextEditingController(text: weight69);
    });
  }


  _day4w6(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str67) {
                        setState(() {
                          weight67 = str67;
                          storeName67(str67);
                        });
                      },
                      controller: myController67,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str68) {
                        setState(() {
                          weight68 = str68;
                          storeName68(str68);
                        });
                      },
                      controller: myController68,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str69) {
                        setState(() {
                          weight69 = str69;
                          storeName69(str69);
                        });
                      },
                      controller: myController69,
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

  //end week 6----------------------------


  //---------------start week 7
  //-------------day 1
  TextEditingController myController70 = TextEditingController();
  TextEditingController myController71 = TextEditingController();
  TextEditingController myController72 = TextEditingController();

  String weight70;
  String weight71;
  String weight72;


  Future<Null> storeName70(String newWeight43) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight43", newWeight43);
  }
  Future<Null> storeName71(String newWeight44) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight44", newWeight44);
  }
  Future<Null> storeName72(String newWeight45) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight45", newWeight45);
  }

  Future<Null> getSharedPrefs70() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight43 = prefs.getString("weight43");
    setState(() {
      myController43 = new TextEditingController(text: weight43);
    });
  }

  Future<Null> getSharedPrefs71() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight44 = prefs.getString("weight44");
    setState(() {
      myController44 = new TextEditingController(text: weight44);
    });
  }
  Future<Null> getSharedPrefs72() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight45 = prefs.getString("weight45");
    setState(() {
      myController45 = new TextEditingController(text: weight45);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str70) {
                        setState(() {
                          weight70 = str70;
                          storeName70(str70);
                        });
                      },
                      controller: myController70,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str71) {
                        setState(() {
                          weight71 = str71;
                          storeName71(str71);
                        });
                      },
                      controller: myController71,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str72) {
                        setState(() {
                          weight72 = str72;
                          storeName72(str72);
                        });
                      },
                      controller: myController72,
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

  //------day2
  TextEditingController myController73 = TextEditingController();
  TextEditingController myController74 = TextEditingController();
  TextEditingController myController75 = TextEditingController();

  String weight73;
  String weight74;
  String weight75;


  Future<Null> storeName73(String newWeight73) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight73", newWeight73);
  }
  Future<Null> storeName74(String newWeight74) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight74", newWeight74);
  }
  Future<Null> storeName75(String newWeight75) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight75", newWeight75);
  }

  Future<Null> getSharedPrefs73() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight73 = prefs.getString("weight73");
    setState(() {
      myController73 = new TextEditingController(text: weight73);
    });
  }

  Future<Null> getSharedPrefs74() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight74 = prefs.getString("weight74");
    setState(() {
      myController74 = new TextEditingController(text: weight74);
    });
  }
  Future<Null> getSharedPrefs75() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight75 = prefs.getString("weight75");
    setState(() {
      myController75 = new TextEditingController(text: weight75);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str73) {
                        setState(() {
                          weight73 = str73;
                          storeName73(str73);
                        });
                      },
                      controller: myController73,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str74) {
                        setState(() {
                          weight74 = str74;
                          storeName74(str74);
                        });
                      },
                      controller: myController74,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str75) {
                        setState(() {
                          weight75 = str75;
                          storeName75(str75);
                        });
                      },
                      controller: myController75,
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

  //---------day 3
  TextEditingController myController76 = TextEditingController();
  TextEditingController myController77 = TextEditingController();

  String weight76;
  String weight77;


  Future<Null> storeName76(String newWeight76) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight76", newWeight76);
  }
  Future<Null> storeName77(String newWeight77) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight77", newWeight77);
  }

  Future<Null> getSharedPrefs76() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight76 = prefs.getString("weight76");
    setState(() {
      myController76 = new TextEditingController(text: weight76);
    });
  }

  Future<Null> getSharedPrefs77() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight77 = prefs.getString("weight77");
    setState(() {
      myController77 = new TextEditingController(text: weight77);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str76) {
                        setState(() {
                          weight76 = str76;
                          storeName76(str76);
                        });
                      },
                      controller: myController76,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str77) {
                        setState(() {
                          weight77 = str77;
                          storeName77(str77);
                        });
                      },
                      controller: myController77,
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

  //-------------day4
  TextEditingController myController78 = TextEditingController();
  TextEditingController myController79 = TextEditingController();
  TextEditingController myController80 = TextEditingController();

  String weight78;
  String weight79;
  String weight80;


  Future<Null> storeName78(String newWeight78) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight78", newWeight78);
  }
  Future<Null> storeName79(String newWeight79) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight79", newWeight79);
  }
  Future<Null> storeName80(String newWeight80) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight80", newWeight80);
  }

  Future<Null> getSharedPrefs78() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight78 = prefs.getString("weight78");
    setState(() {
      myController78 = new TextEditingController(text: weight78);
    });
  }

  Future<Null> getSharedPrefs79() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight79 = prefs.getString("weight79");
    setState(() {
      myController79 = new TextEditingController(text: weight79);
    });
  }
  Future<Null> getSharedPrefs80() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight80 = prefs.getString("weight80");
    setState(() {
      myController80 = new TextEditingController(text: weight80);
    });
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str78) {
                        setState(() {
                          weight78 = str78;
                          storeName78(str78);
                        });
                      },
                      controller: myController78,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str79) {
                        setState(() {
                          weight79 = str79;
                          storeName79(str79);
                        });
                      },
                      controller: myController79,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str80) {
                        setState(() {
                          weight80 = str80;
                          storeName80(str80);
                        });
                      },
                      controller: myController80,
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
  //----------end week 7
  //--------------start week 8

  //-------------day 1
  TextEditingController myController81 = TextEditingController();
  TextEditingController myController82 = TextEditingController();
  TextEditingController myController83 = TextEditingController();

  String weight81;
  String weight82;
  String weight83;


  Future<Null> storeName81(String newWeight81) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight81", newWeight81);
  }
  Future<Null> storeName82(String newWeight82) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight82", newWeight82);
  }
  Future<Null> storeName83(String newWeight83) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight83", newWeight83);
  }

  Future<Null> getSharedPrefs81() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight81 = prefs.getString("weight81");
    setState(() {
      myController81 = new TextEditingController(text: weight81);
    });
  }

  Future<Null> getSharedPrefs82() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight82 = prefs.getString("weight82");
    setState(() {
      myController82 = new TextEditingController(text: weight82);
    });
  }
  Future<Null> getSharedPrefs83() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight83 = prefs.getString("weight83");
    setState(() {
      myController83 = new TextEditingController(text: weight83);
    });
  }

  _day1w8(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str81) {
                        setState(() {
                          weight81 = str81;
                          storeName81(str81);
                        });
                      },
                      controller: myController81,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str82) {
                        setState(() {
                          weight82 = str82;
                          storeName82(str82);
                        });
                      },
                      controller: myController82,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str83) {
                        setState(() {
                          weight83 = str83;
                          storeName83(str83);
                        });
                      },
                      controller: myController83,
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

  //------day2
  TextEditingController myController84 = TextEditingController();
  TextEditingController myController85 = TextEditingController();
  TextEditingController myController86 = TextEditingController();

  String weight84;
  String weight85;
  String weight86;


  Future<Null> storeName84(String newWeight84) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight84", newWeight84);
  }
  Future<Null> storeName85(String newWeight85) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight85", newWeight85);
  }
  Future<Null> storeName86(String newWeight86) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight86", newWeight86);
  }

  Future<Null> getSharedPrefs84() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight84 = prefs.getString("weight84");
    setState(() {
      myController84 = new TextEditingController(text: weight84);
    });
  }

  Future<Null> getSharedPrefs85() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight85 = prefs.getString("weight85");
    setState(() {
      myController85 = new TextEditingController(text: weight85);
    });
  }
  Future<Null> getSharedPrefs86() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight86 = prefs.getString("weight86");
    setState(() {
      myController86 = new TextEditingController(text: weight86);
    });
  }

  _day2w8(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str84) {
                        setState(() {
                          weight84 = str84;
                          storeName84(str84);
                        });
                      },
                      controller: myController84,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str85) {
                        setState(() {
                          weight85 = str85;
                          storeName85(str85);
                        });
                      },
                      controller: myController85,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str86) {
                        setState(() {
                          weight86 = str86;
                          storeName86(str86);
                        });
                      },
                      controller: myController86,
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

  //---------day 3
  TextEditingController myController87 = TextEditingController();
  TextEditingController myController88 = TextEditingController();

  String weight87;
  String weight88;


  Future<Null> storeName87(String newWeight87) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight87", newWeight87);
  }
  Future<Null> storeName88(String newWeight88) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight88", newWeight88);
  }

  Future<Null> getSharedPrefs87() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight87 = prefs.getString("weight87");
    setState(() {
      myController87 = new TextEditingController(text: weight87);
    });
  }

  Future<Null> getSharedPrefs88() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight88 = prefs.getString("weight88");
    setState(() {
      myController88 = new TextEditingController(text: weight88);
    });
  }


  _day3w8(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str87) {
                        setState(() {
                          weight87 = str87;
                          storeName87(str87);
                        });
                      },
                      controller: myController87,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str88) {
                        setState(() {
                          weight88 = str88;
                          storeName88(str88);
                        });
                      },
                      controller: myController88,
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

  //-------------day4
  TextEditingController myController89 = TextEditingController();
  TextEditingController myController90 = TextEditingController();
  TextEditingController myController91 = TextEditingController();

  String weight89;
  String weight90;
  String weight91;


  Future<Null> storeName89(String newWeight89) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight89", newWeight89);
  }
  Future<Null> storeName90(String newWeight90) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight90", newWeight90);
  }
  Future<Null> storeName91(String newWeight91) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight91", newWeight91);
  }

  Future<Null> getSharedPrefs89() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight89 = prefs.getString("weight89");
    setState(() {
      myController89 = new TextEditingController(text: weight89);
    });
  }

  Future<Null> getSharedPrefs90() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight90 = prefs.getString("weight90");
    setState(() {
      myController90 = new TextEditingController(text: weight90);
    });
  }
  Future<Null> getSharedPrefs91() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight91 = prefs.getString("weight91");
    setState(() {
      myController91 = new TextEditingController(text: weight91);
    });
  }

  _day4w8(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str89) {
                        setState(() {
                          weight89 = str89;
                          storeName89(str89);
                        });
                      },
                      controller: myController89,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str90) {
                        setState(() {
                          weight90 = str90;
                          storeName90(str90);
                        });
                      },
                      controller: myController90,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str91) {
                        setState(() {
                          weight91 = str91;
                          storeName91(str91);
                        });
                      },
                      controller: myController91,
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

  //--------------end week 8

  //----------------week 9

  //-------------day 1
  TextEditingController myController92 = TextEditingController();
  TextEditingController myController93 = TextEditingController();
  TextEditingController myController94 = TextEditingController();

  String weight92;
  String weight93;
  String weight94;


  Future<Null> storeName92(String newWeight92) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight92", newWeight92);
  }
  Future<Null> storeName93(String newWeight93) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight93", newWeight93);
  }
  Future<Null> storeName94(String newWeight94) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight94", newWeight94);
  }

  Future<Null> getSharedPrefs92() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight92 = prefs.getString("weight92");
    setState(() {
      myController92 = new TextEditingController(text: weight92);
    });
  }

  Future<Null> getSharedPrefs93() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight93 = prefs.getString("weight93");
    setState(() {
      myController93 = new TextEditingController(text: weight93);
    });
  }
  Future<Null> getSharedPrefs94() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight94 = prefs.getString("weight94");
    setState(() {
      myController94 = new TextEditingController(text: weight94);
    });
  }

  _day1w9(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str92) {
                        setState(() {
                          weight92 = str92;
                          storeName92(str92);
                        });
                      },
                      controller: myController92,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str93) {
                        setState(() {
                          weight93 = str93;
                          storeName93(str93);
                        });
                      },
                      controller: myController93,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str94) {
                        setState(() {
                          weight94 = str94;
                          storeName94(str94);
                        });
                      },
                      controller: myController94,
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

  //------day2
  TextEditingController myController95 = TextEditingController();
  TextEditingController myController96 = TextEditingController();
  TextEditingController myController97 = TextEditingController();

  String weight95;
  String weight96;
  String weight97;


  Future<Null> storeName95(String newWeight95) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight95", newWeight95);
  }
  Future<Null> storeName96(String newWeight96) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight96", newWeight96);
  }
  Future<Null> storeName97(String newWeight97) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight97", newWeight97);
  }

  Future<Null> getSharedPrefs95() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight95 = prefs.getString("weight95");
    setState(() {
      myController95 = new TextEditingController(text: weight95);
    });
  }

  Future<Null> getSharedPrefs96() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight96 = prefs.getString("weight96");
    setState(() {
      myController96 = new TextEditingController(text: weight96);
    });
  }
  Future<Null> getSharedPrefs97() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight97 = prefs.getString("weight97");
    setState(() {
      myController97 = new TextEditingController(text: weight97);
    });
  }

  _day2w9(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str95) {
                        setState(() {
                          weight95 = str95;
                          storeName95(str95);
                        });
                      },
                      controller: myController95,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str96) {
                        setState(() {
                          weight96 = str96;
                          storeName96(str96);
                        });
                      },
                      controller: myController96,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str97) {
                        setState(() {
                          weight97 = str97;
                          storeName97(str97);
                        });
                      },
                      controller: myController97,
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

  //---------day 3
  TextEditingController myController98 = TextEditingController();
  TextEditingController myController99 = TextEditingController();

  String weight98;
  String weight99;


  Future<Null> storeName98(String newWeight98) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight98", newWeight98);
  }
  Future<Null> storeName99(String newWeight99) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight99", newWeight99);
  }

  Future<Null> getSharedPrefs98() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight98 = prefs.getString("weight98");
    setState(() {
      myController98 = new TextEditingController(text: weight98);
    });
  }

  Future<Null> getSharedPrefs99() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight99 = prefs.getString("weight99");
    setState(() {
      myController99 = new TextEditingController(text: weight99);
    });
  }


  _day3w9(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str98) {
                        setState(() {
                          weight98 = str98;
                          storeName98(str98);
                        });
                      },
                      controller: myController98,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str99) {
                        setState(() {
                          weight99 = str99;
                          storeName99(str99);
                        });
                      },
                      controller: myController99,
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

  //-------------day4
  TextEditingController myController100 = TextEditingController();
  TextEditingController myController101= TextEditingController();
  TextEditingController myController102= TextEditingController();

  String weight100;
  String weight101;
  String weight102;


  Future<Null> storeName100(String newWeight100) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight100", newWeight100);
  }
  Future<Null> storeName101(String newWeight101) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight101", newWeight101);
  }
  Future<Null> storeName102(String newWeight102) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight102", newWeight102);
  }

  Future<Null> getSharedPrefs100() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight100 = prefs.getString("weight100");
    setState(() {
      myController100 = new TextEditingController(text: weight100);
    });
  }

  Future<Null> getSharedPrefs101() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight101 = prefs.getString("weight101");
    setState(() {
      myController101 = new TextEditingController(text: weight101);
    });
  }
  Future<Null> getSharedPrefs102() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight102 = prefs.getString("weight102");
    setState(() {
      myController102 = new TextEditingController(text: weight102);
    });
  }

  _day4w9(){
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str100) {
                        setState(() {
                          weight100 = str100;
                          storeName100(str100);
                        });
                      },
                      controller: myController100,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str101) {
                        setState(() {
                          weight101 = str101;
                          storeName101(str101);
                        });
                      },
                      controller: myController101,
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str102) {
                        setState(() {
                          weight102 = str102;
                          storeName102(str102);
                        });
                      },
                      controller: myController102,
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

  //----------------end week 9

  //-----------------------week 10


  TextEditingController myController103 = TextEditingController();
  TextEditingController myController104 = TextEditingController();
  TextEditingController myController105= TextEditingController();

  String weight103;
  String weight104;
  String weight105;


  Future<Null> storeName103(String newWeight103) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight103", newWeight103);
  }
  Future<Null> storeName104(String newWeight104) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight104", newWeight104);
  }
  Future<Null> storeName105(String newWeight105) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight105", newWeight105);
  }

  Future<Null> getSharedPrefs103() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight103 = prefs.getString("weight103");
    setState(() {
      myController103 = new TextEditingController(text: weight103);
    });
  }

  Future<Null> getSharedPrefs104() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight104 = prefs.getString("weight104");
    setState(() {
      myController104 = new TextEditingController(text: weight104);
    });
  }
  Future<Null> getSharedPrefs105() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight105 = prefs.getString("weight105");
    setState(() {
      myController105 = new TextEditingController(text: weight105);
    });
  }


  _day1w10(){
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
                      onChanged: (String str103) {
                        setState(() {
                          weight103= str103;
                          storeName103(str103);
                        });
                      },
                      controller: myController103,
                    ),
                  )
              ),
              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Push Press/Jerk",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str104) {
                        setState(() {
                          weight104 = str104;
                          storeName104(str104);
                        });
                      },
                      controller: myController104,
                    ),
                  )
              ),
              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Clean High Pull from Floor",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str105) {
                        setState(() {
                          weight105 = str105;
                          storeName105(str105);
                        });
                      },
                      controller: myController105,
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
// --------------day2
  TextEditingController myController106 = TextEditingController();
  TextEditingController myController107 = TextEditingController();
  TextEditingController myController108 = TextEditingController();

  String weight106;
  String weight107;
  String weight108;


  Future<Null> storeName106(String newWeight106) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight106", newWeight106);
  }
  Future<Null> storeName107(String newWeight107) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight107", newWeight107);
  }
  Future<Null> storeName108(String newWeight108) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight108", newWeight108);
  }

  Future<Null> getSharedPrefs106() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight106 = prefs.getString("weight106");
    setState(() {
      myController106 = new TextEditingController(text: weight106);
    });
  }

  Future<Null> getSharedPrefs107() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight107 = prefs.getString("weight107");
    setState(() {
      myController107 = new TextEditingController(text: weight107);
    });
  }
  Future<Null> getSharedPrefs108() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight108 = prefs.getString("weight108");
    setState(() {
      myController108 = new TextEditingController(text: weight108);
    });
  }


  _day2w10(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("BarBell Deadlift",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str106) {
                        setState(() {
                          weight106 = str106;
                          storeName106(str106);
                        });
                      },
                      controller: myController106,
                    ),
                  )
              ), // lift 2
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Thrusters (front squat/overhead press combo)",
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
                      onChanged: (String str107) {
                        setState(() {
                          weight107 = str107;
                          storeName107(str107);
                        });
                      },
                      controller: myController107,
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
                  subtitle: Text('5 x 5',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str108) {
                        setState(() {
                          weight108 = str108;
                          storeName108(str108);
                        });
                      },
                      controller: myController108,
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
                  subtitle: Text('4 sets',
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

  // day 3
  TextEditingController myController109 = TextEditingController();
  TextEditingController myController110 = TextEditingController();
  TextEditingController myController111 = TextEditingController();

  String weight109;
  String weight110;
  String weight111;


  Future<Null> storeName109(String newWeight109) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight109", newWeight109);
  }
  Future<Null> storeName110(String newWeight110) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight110", newWeight110);
  }
  Future<Null> storeName111(String newWeight111) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight111", newWeight111);
  }

  Future<Null> getSharedPrefs109() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight109 = prefs.getString("weight109");
    setState(() {
      myController109 = new TextEditingController(text: weight109);
    });
  }

  Future<Null> getSharedPrefs110() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight110 = prefs.getString("weight110");
    setState(() {
      myController110 = new TextEditingController(text: weight110);
    });
  }
  Future<Null> getSharedPrefs111() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight111 = prefs.getString("weight111");
    setState(() {
      myController111 = new TextEditingController(text: weight111);
    });
  }


  _day3w10(){
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str109) {
                        setState(() {
                          weight109 = str109;
                          storeName109(str109);
                        });
                      },
                      controller: myController109,
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str110) {
                        setState(() {
                          weight110 = str110;
                          storeName110(str110);
                        });
                      },
                      controller: myController110,
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str111) {
                        setState(() {
                          weight111 = str111;
                          storeName111(str111);
                        });
                      },
                      controller: myController111,
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
                  subtitle: Text('4 sets Vol Max',
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

  //------------day4
  TextEditingController myController112 = TextEditingController();
  TextEditingController myController113 = TextEditingController();
  TextEditingController myController114 = TextEditingController();

  String weight112;
  String weight113;
  String weight114;


  Future<Null> storeName112(String newWeight112) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight112", newWeight112);
  }
  Future<Null> storeName113(String newWeight113) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight113", newWeight113);
  }
  Future<Null> storeName114(String newWeight114) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight114", newWeight114);
  }

  Future<Null> getSharedPrefs112() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight112 = prefs.getString("weight112");
    setState(() {
      myController112 = new TextEditingController(text: weight112);
    });
  }

  Future<Null> getSharedPrefs113() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight113 = prefs.getString("weight113");
    setState(() {
      myController113 = new TextEditingController(text: weight113);
    });
  }
  Future<Null> getSharedPrefs114() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight114 = prefs.getString("weight114");
    setState(() {
      myController114 = new TextEditingController(text: weight114);
    });
  }


  _day4w10(){
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
                  subtitle: Text('5 x 3',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str112) {
                        setState(() {
                          weight112 = str112;
                          storeName112(str112);
                        });
                      },
                      controller: myController112,
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
                  subtitle: Text('4 x 3',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str113) {
                        setState(() {
                          weight113 = str113;
                          storeName113(str113);
                        });
                      },
                      controller: myController113,
                    ),
                  )
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Snatch Balance",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 2',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str114) {
                        setState(() {
                          weight114 = str114;
                          storeName114(str114);
                        });
                      },
                      controller: myController114,
                    ),
                  )
              ),          // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Reverse Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4 ea.',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),           // lift 5
              Card(color: Colors.grey[200],
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
              ),
            ]
        )
    );
  }
  //------------------------ end week 10

  //----------------------week 11

  TextEditingController myController115 = TextEditingController();
  TextEditingController myController116 = TextEditingController();
  TextEditingController myController117= TextEditingController();

  String weight115;
  String weight116;
  String weight117;


  Future<Null> storeName115(String newWeight115) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight115", newWeight115);
  }
  Future<Null> storeName116(String newWeight116) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight116", newWeight116);
  }
  Future<Null> storeName117(String newWeight117) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight117", newWeight117);
  }

  Future<Null> getSharedPrefs115() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight115 = prefs.getString("weight115");
    setState(() {
      myController115 = new TextEditingController(text: weight115);
    });
  }

  Future<Null> getSharedPrefs116() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight116 = prefs.getString("weight116");
    setState(() {
      myController116 = new TextEditingController(text: weight116);
    });
  }
  Future<Null> getSharedPrefs117() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight117 = prefs.getString("weight117");
    setState(() {
      myController117 = new TextEditingController(text: weight117);
    });
  }


  _day1w11(){
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
                      onChanged: (String str115) {
                        setState(() {
                          weight115= str115;
                          storeName115(str115);
                        });
                      },
                      controller: myController115,
                    ),
                  )
              ),
              // lift 2
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Push Press/Jerk",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str116) {
                        setState(() {
                          weight116 = str116;
                          storeName116(str116);
                        });
                      },
                      controller: myController116,
                    ),
                  )
              ),
              // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Clean High Pull from Floor",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str117) {
                        setState(() {
                          weight117 = str117;
                          storeName117(str117);
                        });
                      },
                      controller: myController117
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
// --------------day2
  TextEditingController myController118 = TextEditingController();
  TextEditingController myController119 = TextEditingController();
  TextEditingController myController120 = TextEditingController();

  String weight118;
  String weight119;
  String weight120;


  Future<Null> storeName118(String newWeight118) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight118", newWeight118);
  }
  Future<Null> storeName119(String newWeight119) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight119", newWeight119);
  }
  Future<Null> storeName120(String newWeight120) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight120", newWeight120);
  }

  Future<Null> getSharedPrefs118() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight118 = prefs.getString("weight118");
    setState(() {
      myController118 = new TextEditingController(text: weight118);
    });
  }

  Future<Null> getSharedPrefs119() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight119 = prefs.getString("weight119");
    setState(() {
      myController119 = new TextEditingController(text: weight119);
    });
  }
  Future<Null> getSharedPrefs120() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight120 = prefs.getString("weight120");
    setState(() {
      myController120 = new TextEditingController(text: weight120);
    });
  }


  _day2w11(){
    return Center(
        child: ListView(
            children: <Widget>[
              // lift 1
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("BarBell Deadlift",
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str118) {
                        setState(() {
                          weight118 = str118;
                          storeName118(str118);
                        });
                      },
                      controller: myController118,
                    ),
                  )
              ), // lift 2
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Thrusters (front squat/overhead press combo)",
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
                      onChanged: (String str119) {
                        setState(() {
                          weight119 = str119;
                          storeName119(str119);
                        });
                      },
                      controller: myController119,
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
                  subtitle: Text('5 x 5',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str120) {
                        setState(() {
                          weight120 = str120;
                          storeName120(str120);
                        });
                      },
                      controller: myController108,
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
                  subtitle: Text('4 sets',
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

  // day 3
  TextEditingController myController121 = TextEditingController();
  TextEditingController myController122 = TextEditingController();
  TextEditingController myController123 = TextEditingController();

  String weight121;
  String weight122;
  String weight123;


  Future<Null> storeName121(String newWeight121) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight121", newWeight121);
  }
  Future<Null> storeName122(String newWeight122) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight122", newWeight122);
  }
  Future<Null> storeName123(String newWeight123) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight123", newWeight123);
  }

  Future<Null> getSharedPrefs121() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight121 = prefs.getString("weight121");
    setState(() {
      myController121 = new TextEditingController(text: weight121);
    });
  }

  Future<Null> getSharedPrefs122() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight122 = prefs.getString("weight122");
    setState(() {
      myController122 = new TextEditingController(text: weight122);
    });
  }
  Future<Null> getSharedPrefs123() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight123 = prefs.getString("weight123");
    setState(() {
      myController123 = new TextEditingController(text: weight123);
    });
  }


  _day3w11(){
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str121) {
                        setState(() {
                          weight121 = str121;
                          storeName121(str121);
                        });
                      },
                      controller: myController121,
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str122) {
                        setState(() {
                          weight122 = str122;
                          storeName122(str122);
                        });
                      },
                      controller: myController122,
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
                  subtitle: Text('4 sets Vol Max (at least 12)',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str123) {
                        setState(() {
                          weight123 = str123;
                          storeName123(str123);
                        });
                      },
                      controller: myController123,
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
                  subtitle: Text('4 sets Vol Max',
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

  //------------day4
  TextEditingController myController124 = TextEditingController();
  TextEditingController myController125 = TextEditingController();
  TextEditingController myController126 = TextEditingController();

  String weight124;
  String weight125;
  String weight126;


  Future<Null> storeName124(String newWeight124) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight124", newWeight124);
  }
  Future<Null> storeName125(String newWeight125) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight125", newWeight125);
  }
  Future<Null> storeName126(String newWeight126) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("weight126", newWeight126);
  }

  Future<Null> getSharedPrefs124() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight124 = prefs.getString("weight124");
    setState(() {
      myController124 = new TextEditingController(text: weight124);
    });
  }

  Future<Null> getSharedPrefs125() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight125 = prefs.getString("weight125");
    setState(() {
      myController125 = new TextEditingController(text: weight125);
    });
  }
  Future<Null> getSharedPrefs126() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weight126 = prefs.getString("weight126");
    setState(() {
      myController126 = new TextEditingController(text: weight126);
    });
  }


  _day4w11(){
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
                  subtitle: Text('5 x 3',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str124) {
                        setState(() {
                          weight124 = str124;
                          storeName124(str124);
                        });
                      },
                      controller: myController124,
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
                  subtitle: Text('4 x 3',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str125) {
                        setState(() {
                          weight125 = str125;
                          storeName125(str125);
                        });
                      },
                      controller: myController125,
                    ),
                  )
              ),          // lift 3
              Card(color: Colors.grey[200],
                child: ListTile(
                  title: Text("Snatch Balance",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 2',
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
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter Weight",
                      ),
                      onChanged: (String str126) {
                        setState(() {
                          weight126 = str126;
                          storeName126(str126);
                        });
                      },
                      controller: myController126,
                    ),
                  )
              ),          // lift 4
              Card(color: Colors.grey[300],
                child: ListTile(
                  title: Text("Reverse Lunge",
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text('4 x 4 ea.',
                      style: TextStyle(
                          fontFamily: 'Comic Sans',
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),           // lift 5
              Card(color: Colors.grey[200],
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
              ),
            ]
        )
    );
  }

  //----------------------end week 11

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
                      child: _day1w2()),
                ), if (widget.week == 2 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w2()),
              ), if (widget.week == 2 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w2()),
              ),  if (widget.week == 2 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w2()),
              ),  // --------- week 3
              if (widget.week == 3 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w3()),
                ), if (widget.week == 3 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w3()),
              ), if (widget.week == 3 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w3()),
              ),  if (widget.week == 3 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w3()),
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
                      child: _day1w5()),
                ), if (widget.week == 5 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w5()),
              ), if (widget.week == 5 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w5()),
              ),  if (widget.week == 5 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w5()),
              ),   // ----------- week 6
              if (widget.week == 6 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w6()),
                ), if (widget.week == 6 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w6()),
              ), if (widget.week == 6 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w6()),
              ),  if (widget.week == 6 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w6()),
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
                      child: _day1w8()),
                ), if (widget.week == 8 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w8()),
              ), if (widget.week == 8 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w8()),
              ),  if (widget.week == 8 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w8()),
              ),   // ----------- week 9
              if (widget.week == 9 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w9()),
                ), if (widget.week == 9 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w9()),
              ), if (widget.week == 9 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w9()),
              ),  if (widget.week == 9 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w9()),
              ),   // ----------- week 10
              if (widget.week == 10 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w10()),
                ), if (widget.week == 10 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w10()),
              ), if (widget.week == 10 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w10()),
              ),  if (widget.week == 10 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w10()),
              ),   // ----------- week 10
              if (widget.week == 11 && widget.day ==1)
                Expanded(
                  child: Center(
                      child: _day1w11()),
                ), if (widget.week == 11 && widget.day ==2) Expanded(
                child: Center(
                    child: _day2w11()),
              ), if (widget.week == 11 && widget.day ==3) Expanded(
                child: Center(
                    child: _day3w11()),
              ),  if (widget.week == 11 && widget.day ==4) Expanded(
                child: Center(
                    child: _day4w11()),


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
