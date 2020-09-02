import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show ByteData, Clipboard, ClipboardData, rootBundle;
import 'package:english_words/english_words.dart' as english_words;
class future extends StatefulWidget {
  @override
  futureState createState() => futureState();
}

class futureState extends State<future> {
  int currentpage = 0;
  final tabs = [FutureBuilderExample(), code1()];

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
          "Future Builder",
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
    await rootBundle.loadString('lib/Textfile/26file.txt');
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
class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key key}) : super(key: key);

  @override
  FutureBuilderExampleState createState() => FutureBuilderExampleState();
}

class FutureBuilderExampleState extends State<FutureBuilderExample> {
  Future<ByteData> _wait3SecAndLoadImage() async {
    await Future.delayed(Duration(seconds: 3));
    return rootBundle.load('lib/images/download (1).png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('In this example we first have an async operatio that takes '
              '~3 seconds and succeeds with the content of an image from asset.\n'
              'Note this is just for demonstration purposes, normally we just '
              'use `Image.asset()`.'),
          FutureBuilder<ByteData>(
            future: _wait3SecAndLoadImage(),
            builder: (BuildContext context, AsyncSnapshot<ByteData> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // This shouldn't happen in our case, but good to handle errors.
                return Text('Error has happened in the future!');
              } else {
                return Image.memory(snapshot.data.buffer.asUint8List());
              }
            },
          ),
        ],
      ),
    );
  }
}
class future1 extends StatefulWidget {
  @override
  future1State createState() => future1State();
}

class future1State extends State<future1> {
  int currentpage = 0;
  final tabs = [StreamBuilderExample(), code2()];

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
          "Stream Builder",
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
    await rootBundle.loadString('lib/Textfile/27file.txt');
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
class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key key}) : super(key: key);

  @override
  StreamBuilderExampleState createState() => StreamBuilderExampleState();
}

class StreamBuilderExampleState extends State<StreamBuilderExample> {
  // The timer's value shown on app's UI.
  int _timerValue = 0;
  bool _paused = true;
  // A stream that updates every second. The stream's value is the number of
  // seconds elapsed since the app is started. We simply print this stream value
  // out in command-line. The value shown on UI is this._timerValue.
  final Stream<int> _periodicStream =
  Stream.periodic(Duration(milliseconds: 1000), (i) => i);
  // Record of the latest stream value that we saw. Because the StreamBuilder is
  // rebuilt when we call setState(), and in the re-build we shouldn't increment
  // this._timerValue if the latest snapshot's value hasn't changed.
  int _previousStreamValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: StreamBuilder(
        stream: this._periodicStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != this._previousStreamValue) {
              print('Latest snapshot from stream: ${snapshot.data}');
              this._previousStreamValue = snapshot.data;
              if (!_paused) {
                this._timerValue++;
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("StreamBuilders can listen to a stream, and update UI "
                  "according to the stream's latest snapshot value.\n\n"
                  "In this demo we build a simple timer app by listening to a "
                  "stream that updates every second.\n"),
              Card(child: _buildTimerUI()),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTimerUI() {
    return Column(
      children: <Widget>[
        Text(
          '$_timerValue',
          style: Theme.of(context).textTheme.headline4,
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(this._paused ? Icons.play_arrow : Icons.pause),
              onPressed: () => setState(() => this._paused = !this._paused),
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () => setState(
                    () {
                  this._timerValue = 0;
                  this._paused = true;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class future2 extends StatefulWidget {
  @override
  future2State createState() => future2State();
}

class future2State extends State<future2> {
  int currentpage = 0;
  final tabs = [StreamControllerExample(), code3()];

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
          "Stream Controller",
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
    await rootBundle.loadString('lib/Textfile/28file.txt');
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
class StreamControllerExample extends StatefulWidget {
  const StreamControllerExample({Key key}) : super(key: key);

  @override
  _StreamControllerExampleState createState() =>
      _StreamControllerExampleState();
}

// The data class in our demo stream, contains just a message string and a
// timestamp.
class _Data {
  final String message;
  final DateTime timestamp;

  _Data({@required this.message, @required this.timestamp});
}

class _StreamControllerExampleState extends State<StreamControllerExample> {
  // The app puts value to _inputStreamController.sink, and renders widget from
  // _outputStreamController.stream.
  final _inputStreamController = StreamController<_Data>();
  final _outputStreamController = StreamController<Widget>();

  @override
  void initState() {
    super.initState();
    // This function connects the input and output stream controller, and does
    // the transformation (business logic) in between.
    void _onData(_Data data) {
      final widgetToRender = ListTile(
        title: Text(data.message),
        subtitle: Text(data.timestamp.toString()),
      );
      _outputStreamController.sink.add(widgetToRender);
    }

    _inputStreamController.stream.listen(_onData);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("StreamController is like a pipe with `sink` as input and `stream`"
            "as output. \n\n"
            "To put a new value to the stream, use `streamController.sink.add(newValue)`; "
            "to access the output stream, use `streamController.stream`.\n\n"
            "Note: we can't transform the stream's value inside the controller, "
            "the output is exactly the input. Instead, we can use two stream controllers, "
            "and put a function between the input controller and output controller.\n\n"
            "In this demo, the card renders the widget from _outputStreamController.stream"
            "and you can send a new random word to the "
            "_inputStreamController.sink by clicking the 'send' button.\n"),
        Card(
          elevation: 4.0,
          child: StreamBuilder<Widget>(
            stream: _outputStreamController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return ListTile(
                  leading: CircularProgressIndicator(),
                  title: Text('no data'),
                );
              }
              final Widget widgetToRender = snapshot.data;
              return widgetToRender;
            },
          ),
        ),
        RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text('Send random word to input stream'),
          onPressed: () => this._inputStreamController.sink.add(
            _Data(
              message: english_words.WordPair.random().asPascalCase,
              timestamp: DateTime.now(),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // Note: must explicitly close the stream controllers to release resource!
    _inputStreamController.close();
    _outputStreamController.close();
    super.dispose();
  }
}