//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData, rootBundle;

class container2 extends StatefulWidget {
  @override
  _container2State createState() => _container2State();
}

class _container2State extends State<container2>{

  int currentpage=0;
  final tabs=[
     code(),
    code1()

  ];

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
        title: Text("Container",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
      ),

      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        onTap: ontapped,
          currentIndex: currentpage,
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.mobile_screen_share),
          title: Text("Preview")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.code),
          title: Text("Code")
        )
      ]),
    //  currentpage=currentpage;

      body: tabs[currentpage],

    );
  }

  ontapped(int index) {
    setState(() {
      currentpage=index;
    });

  }
}
class code extends StatelessWidget {
  const code({Key key, String data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tip: VSCode have suggestions for widget (e.g. "Center widget", "Add
    // padding", "Remove widget"), which is handy.
    return Center(
      // Container is a rectangle area on the screen.
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: Padding(
          // EdgeInsets.all: same padding value for all 4 directions.
          padding: const EdgeInsets.all(16.0),
          child: Container(
            // Container.color should not be set when decoration is set.
            decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.black),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20.0)),
            // Container.padding is implementd internally with Padding widgets.
            // EdgeInsets.fromLTRB: specify padding for left/right/top/bottom.
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            child: Container(
              color: Colors.red,
              // EdgeInsets.symmetric: specify vertical/horizontal padding.
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              // Rotation.
              transform: new Matrix4.rotationZ(-0.1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                    right: Radius.circular(30.0),
                  ),
                ),
                alignment: Alignment.topLeft,
                child: Text("hello"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class code1 extends StatefulWidget {
  @override
  _code1State createState() => _code1State();
}

class _code1State extends State<code1> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/1file.txt');
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
    return Builder(builder: (context){
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
        onPressed: (){
          final text=ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar=SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);

        },
      );
    });
      }

  }
class rowcol extends StatefulWidget {
  @override
  rowcolState createState() => rowcolState();
}

class rowcolState extends State<rowcol>{

  int currentpage=0;
  final tabs=[
    RowColExample(),
    code2()

  ];

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
        title: Text("Row,Column",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
      ),

      bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Preview")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.code),
                title: Text("Code")
            )
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],

    );
  }

  ontapped(int index) {
    setState(() {
      currentpage=index;
    });

  }
}
class RowColExample extends StatefulWidget {
  const RowColExample({Key key}) : super(key: key);
  @override
  _RowColExampleState createState() => new _RowColExampleState();
}

class _RowColExampleState extends State<RowColExample> {
  static const kElements = <Widget>[
    Icon(Icons.stars, size: 50.0),
    Icon(Icons.stars, size: 100.0),
    Icon(Icons.stars, size: 50.0),
  ];

  bool _isRow = true;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final _appbarButtons = _getBottomBar();
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _appbarButtons,
    );
  }

  Widget _buildBody() => Container(
    color: Colors.yellow,
    child: _isRow
        ? Row(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: kElements,
    )
        : Column(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: kElements,
    ),
  );

  Widget _getBottomBar() {
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio<bool>(
                    value: true,
                    groupValue: this._isRow,
                    onChanged: (bool value) {
                      setState(() => this._isRow = value);
                    }),
                Text('Row'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio<bool>(
                    value: false,
                    groupValue: this._isRow,
                    onChanged: (bool value) {
                      setState(() => this._isRow = value);
                    }),
                Text('Column'),
              ],
            ),
          ],
        ),
        ListTile(
          title: Text('mainAxisSize:'),
          trailing: DropdownButton<MainAxisSize>(
            value: _mainAxisSize,
            onChanged: (MainAxisSize newVal) {
              if (newVal != null) {
                setState(() => this._mainAxisSize = newVal);
              }
            },
            items: MainAxisSize.values
                .map((MainAxisSize val) => DropdownMenuItem(
              value: val,
              child: Text(
                  val.toString().substring('MainAxisSize.'.length)),
            ))
                .toList(),
          ),
        ),
        ListTile(
          title: Text('mainAxisAlignment:'),
          trailing: DropdownButton<MainAxisAlignment>(
            value: _mainAxisAlignment,
            onChanged: (MainAxisAlignment newVal) {
              if (newVal != null) {
                setState(() => this._mainAxisAlignment = newVal);
              }
            },
            items: MainAxisAlignment.values
                .map((MainAxisAlignment val) => DropdownMenuItem(
              value: val,
              child: Text(val
                  .toString()
                  .substring('MainAxisAlignment.'.length)),
            ))
                .toList(),
          ),
        ),
        ListTile(
          title: Text('crossAxisAlignment:'),
          trailing: DropdownButton<CrossAxisAlignment>(
            value: _crossAxisAlignment,
            onChanged: (CrossAxisAlignment newVal) {
              if (newVal != null) {
                setState(() => this._crossAxisAlignment = newVal);
              }
            },
            items: CrossAxisAlignment.values
                .map((CrossAxisAlignment val) => DropdownMenuItem(
              value: val,
              child: Text(val
                  .toString()
                  .substring('CrossAxisAlignment.'.length)),
            ))
                .toList(),
          ),
        ),
      ]),
    );
  }
}

class code2 extends StatefulWidget {
  @override
  _code2State createState() => _code2State();
}

class _code2State extends State<code2> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/2file.txt');
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
    return Builder(builder: (context){
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
        onPressed: (){
          final text=ClipboardData(text: data);
          Clipboard.setData(text);
          SnackBar snackBar=SnackBar(content: Text("Content Copied"));
          Scaffold.of(context).showSnackBar(snackBar);

        },
      );
    });
  }

}
class WrapExample extends StatelessWidget {
  const WrapExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Gap between adjacent chips.
      spacing: 8.0,
      // Gap between lines.
      runSpacing: 4.0,
      direction: Axis.horizontal,
      children: [
        'Cauchy',
        'Fourrier',
        'Lagrange',
        'Lebesgue',
        'Levy',
        'Poisson',
        'Pointcare',
      ]
          .map((String name) => Chip(
        avatar: CircleAvatar(child: Text(name.substring(0, 1))),
        label: Text(name),
      ))
          .toList(),
    );
  }
}
class code3 extends StatefulWidget {
  @override
  _code3State createState() => _code3State();
}
class _code3State extends State<code3> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/3file.txt');
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
class wrap extends StatefulWidget {
  @override
  wrapState createState() => wrapState();
}
class wrapState extends State<wrap>{

  int currentpage=0;
  final tabs=[
    WrapExample(),
    code3()

  ];

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
        title: Text("Wrap",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
      ),

      bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Preview")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.code),
                title: Text("Code")
            )
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],

    );
  }

  ontapped(int index) {
    setState(() {
      currentpage=index;
    });

  }
}
class stack extends StatefulWidget {
  @override
  stackState createState() => stackState();
}
class stackState extends State<stack>{

  int currentpage=0;
  final tabs=[
    StackExample(),
    code4()

  ];

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
        title: Text("Stack",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
      ),

      bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Preview")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.code),
                title: Text("Code")
            )
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],

    );
  }

  ontapped(int index) {
    setState(() {
      currentpage=index;
    });

  }
}
class StackExample extends StatefulWidget {
  const StackExample({Key key}) : super(key: key);

  @override
  _StackExampleState createState() => new _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: _alignmentDirectional,
          children: <Widget>[
            Container(width: 300.0, height: 300.0, color: Colors.red),
            Container(width: 200.0, height: 200.0, color: Colors.green),
            Container(width: 100.0, height: 100.0, color: Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    const kAlignmentDirectionalVals = <String, AlignmentDirectional>{
      'topStart': AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd
    };
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('alignmentDirectional:'),
            trailing: DropdownButton<AlignmentDirectional>(
              value: _alignmentDirectional,
              onChanged: (AlignmentDirectional newVal) {
                if (newVal != null) {
                  setState(() => this._alignmentDirectional = newVal);
                }
              },
              items: kAlignmentDirectionalVals
                  .map(
                    (String name, AlignmentDirectional val) => MapEntry(
                  name,
                  DropdownMenuItem(value: val, child: Text(name)),
                ),
              )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
class code4 extends StatefulWidget {
  @override
  _code4State createState() => _code4State();
}
class _code4State extends State<code4> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/4file.txt');
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
class ExpandedExample extends StatelessWidget {
  const ExpandedExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Expanded() objects takes all available space, and each Expanded gets the
    // portion of space according to it's flex.
    // SizedBox() instead has fixed height/width.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Text('Item1: flex=1'),
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text('Item2: flex=2'),
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Text('Item3, flex=3'),
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
class code5 extends StatefulWidget {
  @override
  _code5State createState() => _code5State();
}
class _code5State extends State<code5> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/5file.txt');
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
class exp extends StatefulWidget {
  @override
  expState createState() => expState();
}
class expState extends State<exp>{

  int currentpage=0;
  final tabs=[
    ExpandedExample(),
    code5()

  ];

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
        title: Text("Expanded",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
      ),

      bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          onTap: ontapped,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Preview")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.code),
                title: Text("Code")
            )
          ]),
      //  currentpage=currentpage;

      body: tabs[currentpage],

    );
  }

  ontapped(int index) {
    setState(() {
      currentpage=index;
    });

  }
}

