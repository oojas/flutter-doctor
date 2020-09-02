import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:animations/animations.dart';
class anima1 extends StatefulWidget {
  @override
  anima1State createState() => anima1State();
}

class anima1State extends State<anima1> {
  int currentpage = 0;
  final tabs = [HeroExample(), code1()];

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
          "Hero",
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
    await rootBundle.loadString('lib/Textfile/29file.txt');
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
class HeroExample extends StatelessWidget {
  const HeroExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: GestureDetector(
              child: Hero(
                tag: 'my-hero-animation-tag',
                child: CircleAvatar(
                  backgroundImage:
                  AssetImage('lib/images/download (1).png'),
                ),
              ),
              onTap: () => _showSecondPage(context),
            ),
            title: Text('Tap on the photo to view the animation transition.'),
          ),
        ],
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: Image.asset('lib/images/download (1).png'),
            ),
          ),
        ),
      ),
    );
  }
}
class anima2 extends StatefulWidget {
  @override
  anima2State createState() => anima2State();
}

class anima2State extends State<anima2> {
  int currentpage = 0;
  final tabs = [OpacityExample(), code2()];

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
          "Opacity",
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
    await rootBundle.loadString('lib/Textfile/30file.txt');
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
class OpacityExample extends StatefulWidget {
  const OpacityExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  double _opacity1 = 1.0, _opacity2 = 1.0, _opacity3 = 1.0;

  Widget _coloredSquare(Color color) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Click on colored squares below to make them invisible, click '
                'once again to make them reappear.'),
            GestureDetector(
              child: Opacity(
                opacity: _opacity1,
                child: _coloredSquare(Colors.red),
              ),
              onTap: () {
                setState(() => this._opacity1 = 1.0 - this._opacity1);
              },
            ),
            GestureDetector(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacity2,
                child: _coloredSquare(Colors.green),
              ),
              onTap: () {
                setState(() => this._opacity2 = 1.0 - this._opacity2);
              },
            ),
            GestureDetector(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacity3,
                child: _coloredSquare(Colors.blue),
              ),
              onTap: () {
                setState(() => this._opacity3 = 1.0 - this._opacity3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class anima3 extends StatefulWidget {
  @override
  anima3State createState() => anima3State();
}

class anima3State extends State<anima3> {
  int currentpage = 0;
  final tabs = [AnimatedContainerExample(), code3()];

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
          "Animated Container",
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
    await rootBundle.loadString('lib/Textfile/31file.txt');
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
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final _rng = Random();
  double _height = 100;
  double _width = 100;
  double _borderRadius = 8;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
          margin: EdgeInsets.all(8),
          child: FlutterLogo(),
          // Use the properties stored in the State class.
          width: this._width,
          height: this._height,
          decoration: BoxDecoration(
            color: this._color,
            borderRadius: BorderRadius.circular(this._borderRadius),
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.update),
          label: Text('Change random property'),
          onPressed: () => setState(
                () {
              // Generate a random width and height.
              _width = _rng.nextInt(100).toDouble() + 50;
              _height = _rng.nextInt(100).toDouble() + 50;
              _borderRadius = _rng.nextInt(50).toDouble();
              // Generate a random color.
              _color = Color.fromRGBO(
                  _rng.nextInt(256), _rng.nextInt(256), _rng.nextInt(256), 1);
            },
          ),
        ),
      ],
    );
  }
}
class anima4 extends StatefulWidget {
  @override
  anima4State createState() => anima4State();
}

class anima4State extends State<anima4> {
  int currentpage = 0;
  final tabs = [AnimationsPackageExample(), code4()];

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
          "Animated Package",
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
    await rootBundle.loadString('lib/Textfile/32file.txt');
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
class AnimationsPackageExample extends StatelessWidget {
  const AnimationsPackageExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(thickness: 2, color: Colors.black),
        ListTile(
          title: Text('1. OpenContainer'),
          subtitle: Text(
              'A container that grows to fill the screen to reveal new content when tapped.'),
          trailing: IconButton(
            tooltip: 'Documentation',
            icon: Icon(Icons.open_in_new),
            onPressed: () => launch(
                'https://pub.dev/documentation/animations/latest/animations/OpenContainer-class.html'),
          ),
        ),
        OpenContainer(
          transitionDuration: Duration(milliseconds: 500),
          closedBuilder: (ctx, action) => ListTile(
            title: Text('click me'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          openBuilder: (ctx, action) => Scaffold(
            body: Center(
              child: Text('new page'),
            ),
          ),
        ),
        Divider(thickness: 2, color: Colors.black),
        ListTile(
          title: Text('2. PageTransitionSwitcher'),
          subtitle: Text(
              'Transition from an old child to a new child, similar to AnimationSwitcher'),
          trailing: IconButton(
            tooltip: 'Documentation',
            icon: Icon(Icons.open_in_new),
            onPressed: () => launch(
                'https://pub.dev/documentation/animations/latest/animations/PageTransitionSwitcher-class.html'),
          ),
        ),
        SizedBox(
          height: 200,
          child: _PageTransitionSwitcherEx(),
        ),
        Divider(thickness: 2, color: Colors.black),
        ListTile(
          title: Text('3. SharedAxisTransition'),
          subtitle: Text(
              'Transition animation between UI elements that have a spatial or navigational relationship.'),
          trailing: IconButton(
            tooltip: 'Documentation',
            icon: Icon(Icons.open_in_new),
            onPressed: () => launch(
                'https://pub.dev/documentation/animations/latest/animations/SharedAxisTransition-class.html'),
          ),
        ),
        SizedBox(
          height: 300,
          child: _SharedAxisEx(),
        ),
        Divider(thickness: 2, color: Colors.black),
        ListTile(
          title: Text('4. showModal()'),
          subtitle: Text('Displays a dialog with animation.'),
          trailing: IconButton(
            tooltip: 'Documentation',
            icon: Icon(Icons.open_in_new),
            onPressed: () => launch(
                'https://pub.dev/documentation/animations/latest/animations/showModal.html'),
          ),
        ),
        RaisedButton(
          child: Text('Show dialog'),
          onPressed: () => showModal(
            configuration: FadeScaleTransitionConfiguration(
              transitionDuration: Duration(milliseconds: 500),
            ),
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('New dialog'),
              content: Text('blahblahblah'),
            ),
          ),
        ),
      ],
    );
  }
}

class _PageTransitionSwitcherEx extends StatefulWidget {
  const _PageTransitionSwitcherEx({Key key}) : super(key: key);

  @override
  __PageTransitionSwitcherExState createState() =>
      __PageTransitionSwitcherExState();
}

class __PageTransitionSwitcherExState extends State<_PageTransitionSwitcherEx> {
  static const _tabs = <Widget>[
    // *Note*: when changed child is of the same type as previous one, set the
    // key property explicitly.
    Icon(Icons.looks_one, size: 48, key: ValueKey(1)),
    Icon(Icons.looks_two, size: 48, key: ValueKey(2)),
  ];
  static const _btmNavbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Tab1'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      title: Text('Tab2'),
    ),
  ];

  int _currentTabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: _tabs[_currentTabIdx],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _btmNavbarItems,
        currentIndex: _currentTabIdx,
        onTap: (idx) => setState(() => this._currentTabIdx = idx),
      ),
    );
  }
}

class _SharedAxisEx extends StatefulWidget {
  const _SharedAxisEx({Key key}) : super(key: key);

  @override
  __SharedAxisExState createState() => __SharedAxisExState();
}

class __SharedAxisExState extends State<_SharedAxisEx> {
  final _pages = <Widget>[
    // *Note*: when changed child is of the same type as previous one, set the
    // key property explicitly.
    Icon(Icons.looks_one, size: 64, key: ValueKey(1)),
    Icon(Icons.looks_two, size: 64, key: ValueKey(2)),
    Icon(Icons.looks_3, size: 64, key: ValueKey(3)),
  ];

  int _currentPageIdx = 0;
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageTransitionSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) =>
                    SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: this._transitionType,
                      child: child,
                    ),
                child: _pages[_currentPageIdx],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: this._currentPageIdx == 0
                        ? null
                        : () => setState(() => this._currentPageIdx--),
                    child: Text('BACK'),
                  ),
                  RaisedButton(
                    onPressed: this._currentPageIdx == 2
                        ? null
                        : () => setState(() => this._currentPageIdx++),
                    child: Text('NEXT'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildControlBar(),
    );
  }

  Widget _buildControlBar() {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('SharedAxisTransitionType'),
            trailing: DropdownButton<SharedAxisTransitionType>(
              value: _transitionType,
              items: [
                for (final val in SharedAxisTransitionType.values)
                  DropdownMenuItem(
                    value: val,
                    child: Text(val
                        .toString()
                        .substring('SharedAxisTransitionType.'.length)),
                  )
              ],
              onChanged: (SharedAxisTransitionType val) =>
                  setState(() => this._transitionType = val),
            ),
          ),
        ],
      ),
    );
  }
}
