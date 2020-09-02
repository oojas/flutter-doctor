import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class nav1 extends StatefulWidget {
  @override
  nav1State createState() => nav1State();
}

class nav1State extends State<nav1> {
  int currentpage = 0;
  final tabs = [TabsExample(), code1()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Tabs",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code1 extends StatefulWidget {
  @override
  _code1State createState() => _code1State();
}

class _code1State extends State<code1> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/33file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class TabsExample extends StatelessWidget {
  const TabsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
      Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
      Tab(icon: Icon(Icons.forum), text: 'Tab3'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('appbar title'),
          backgroundColor: Colors.cyan,
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}

class nav2 extends StatefulWidget {
  @override
  nav2State createState() => nav2State();
}

class nav2State extends State<nav2> {
  int currentpage = 0;
  final tabs = [DialogsExample(), code2()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Tabs",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code2 extends StatefulWidget {
  @override
  _code2State createState() => _code2State();
}

class _code2State extends State<code2> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/34file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class DialogsExample extends StatelessWidget {
  const DialogsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32.0),
      children: <Widget>[
        ////// Alert dialog.
        RaisedButton(
            color: Colors.red,
            child: Text('Alert Dialog'),
            onPressed: () {
              // The function showDialog<T> returns Future<T>.
              // Use Navigator.pop() to return value (of type T).
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Dialog title'),
                  content: Text(
                    'Sample alert',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                    ),
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.pop(context, 'OK'),
                    ),
                  ],
                ),
              ).then((returnVal) {
                if (returnVal != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You clicked: $returnVal'),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    ),
                  );
                }
              });
            }),
        ////// Simple Dialog.
        RaisedButton(
          color: Colors.yellow,
          child: Text('Simple dialog'),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: Text('Dialog Title'),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('user@example.com'),
                    onTap: () => Navigator.pop(context, 'user@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('user2@gmail.com'),
                    onTap: () => Navigator.pop(context, 'user2@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_circle),
                    title: Text('Add account'),
                    onTap: () => Navigator.pop(context, 'Add account'),
                  ),
                ],
              ),
            ).then((returnVal) {
              if (returnVal != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You clicked: $returnVal'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Time Picker Dialog.
        RaisedButton(
          color: Colors.green,
          child: Text('Time Picker Dialog'),
          onPressed: () {
            DateTime now = DateTime.now();
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
            ).then((TimeOfDay value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${value.format(context)}'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Date Picker Dialog.
        RaisedButton(
          color: Colors.blue,
          child: Text('Date Picker Dialog'),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Selected datetime: $value')),
                );
              }
            });
          },
        ),
        ////// Bottom Sheet Dialog.
        RaisedButton(
          color: Colors.orange,
          child: Text('Bottom Sheet'),
          onPressed: () {
            // Or: showModalBottomSheet(), with model bottom sheet, clicking
            // anywhere will dismiss the bottom sheet.
            showBottomSheet<String>(
              context: context,
              builder: (BuildContext context) => Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text('This is a bottom sheet'),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Click OK to dismiss'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ]
          .map(
            (Widget button) => Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: button,
        ),
      )
          .toList(),
    );
  }
}
class nav3 extends StatefulWidget {
  @override
  nav3State createState() => nav3State();
}

class nav3State extends State<nav3> {
  int currentpage = 0;
  final tabs = [RoutesExample(), code3()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Routes",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code3 extends StatefulWidget {
  @override
  _code3State createState() => _code3State();
}

class _code3State extends State<code3> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/34file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class RoutesExample extends StatelessWidget {
  const RoutesExample({Key key}) : super(key: key);

  // Route name is useful for navigating between routes.
  static const kRouteName = '/RoutesExample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Page 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to page two'),
          onPressed: () {
            // Navigator maintains a stack-like structure of pages. Jumping
            // between routes is by push/pop of Navigator.
            Navigator.push(context, _PageTwo());
          },
        ),
      ),
    );
  }
}

// <Null> means this route returns nothing.
class _PageTwo extends MaterialPageRoute<Null> {
  _PageTwo()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        elevation: 1.0,
      ),
      // *Note*: use a Builder instead of directly giving the body, so
      // that Scaffold.of(context) won't throw exception, c.f.
      // https://stackoverflow.com/a/51304732.
      body: Builder(
        builder: (BuildContext context) => Center(
          child: RaisedButton(
            child: Text('Go to page 3'),
            onPressed: () {
              // Navigator.push<T> returns a Future<T>, which is the
              // return value of the pushed route when it's popped.
              Navigator.push<String>(context, _PageThree())
                ..then((returnVal) {
                  if (returnVal != null) {
                    Scaffold.of(context).removeCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You clicked: $returnVal'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
            },
          ),
        ),
      ),
    );
  });
}

// MaterialPageRoute<String> returns a Future<String>.
class _PageThree extends MaterialPageRoute<String> {
  _PageThree()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last page'),
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(child: Text('1')),
              title: Text('user1@example.com'),
              onTap: () => Navigator.pop(context, 'user1@example.com'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('2')),
              title: Text('user2@example.com'),
              onTap: () => Navigator.pop(context, 'user2@example.com'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('3')),
              title: Text('user3@example.com'),
              onTap: () => Navigator.pop(context, 'user3@example.com'),
            ),
            Divider(),
            MaterialButton(
              child: Text('Go home'),
              onPressed: () {
                // Pops until reaching a route with that route name.
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(RoutesExample.kRouteName),
                );
              },
            ),
          ],
        ),
      ),
    );
  });
}
class nav4 extends StatefulWidget {
  @override
  nav4State createState() => nav4State();
}

class nav4State extends State<nav4> {
  int currentpage = 0;
  final tabs = [NavDrawerExample(), code4()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Navigation Drawer",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code4 extends StatefulWidget {
  @override
  _code4State createState() => _code4State();
}

class _code4State extends State<code4> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/36file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class NavDrawerExample extends StatelessWidget {
  const NavDrawerExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A'),
          backgroundColor: Colors.yellow,
        ),
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.red,
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('To page 1'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: Text('To page 2'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Drawer example'),
        ),
        body: Center(
          child: Text('Swip or click upper-left icon to see drawer.'),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Page $id'),
      ),
    );
  });
}
class nav5 extends StatefulWidget {
  @override
  nav5State createState() => nav5State();
}

class nav5State extends State<nav5> {
  int currentpage = 0;
  final tabs = [BottomSheetExample(), code5()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Bottom Tab Bar",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code5 extends StatefulWidget {
  @override
  _code5State createState() => _code5State();
}

class _code5State extends State<code5> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/37file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key key}) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('show bottom sheet'),
              onPressed: () => this
                  ._scaffoldKey
                  .currentState
                  .showBottomSheet((ctx) => _buildBottomSheet(ctx)),
            ),
            RaisedButton(
              child: Text('show modal bottom sheet'),
              onPressed: () => showModalBottomSheet(
                  context: context, builder: (ctx) => _buildBottomSheet(ctx)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
         {

         }
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Bottom sheet')),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.attach_money),
              labelText: 'Enter an integer',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Save and close'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
class nav6 extends StatefulWidget {
  @override
  nav6State createState() => nav6State();
}

class nav6State extends State<nav6> {
  int currentpage = 0;
  final tabs = [BottomTabbarExample(), code6()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Bottom Tab Bar",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code6 extends StatefulWidget {
  @override
  _code6State createState() => _code6State();
}

class _code6State extends State<code6> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/38file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
class nav7 extends StatefulWidget {
  @override
  nav7State createState() => nav7State();
}

class nav7State extends State<nav7> {
  int currentpage = 0;
  final tabs = [BottomNavigationBarExample(), code7()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Bottom Navigation Bar",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code7 extends StatefulWidget {
  @override
  _code7State createState() => _code7State();
}

class _code7State extends State<code7> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/39file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.cloud), title: Text('Tab1')),
      BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('Tab2')),
      BottomNavigationBarItem(icon: Icon(Icons.forum), title: Text('Tab3')),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
class nav8 extends StatefulWidget {
  @override
  nav8State createState() => nav8State();
}

class nav8State extends State<nav8> {
  int currentpage = 0;
  final tabs = [PageSelectorExample(), code8()];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Page Selector",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share), title: Text("Preview")),
            BottomNavigationBarItem(icon: Icon(Icons.code), title: Text("Code"))
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],
    );
  }

  ontapped(int index) {
    setState(() {
      currentpage = index;
    });
  }
}

class code8 extends StatefulWidget {
  @override
  _code8State createState() => _code8State();
}

class _code8State extends State<code8> {
  String data = '';

  fetchdata() async {
    String responsetext =
    await rootBundle.loadString('lib/Textfile/40file.txt');
    setState(() {
      data = responsetext;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FlatButton(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [Text(data)],
              ),
            ),
          ],
        ),
        onPressed: () {
          final text = ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar = SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    });
  }
}
class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: kIcons),
                ),
              ),
              RaisedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                  DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}