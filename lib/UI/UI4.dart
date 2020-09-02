import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
    Clipboard,
    ClipboardData,
    rootBundle;
import 'package:english_words/english_words.dart' as english_words;


class bar1 extends StatefulWidget {
  @override
  bar1State createState() => bar1State();
}

class bar1State extends State<bar1> {
  int currentpage = 0;
  final tabs = [app(), code1()];

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
          "APP BAR",
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
    await rootBundle.loadString('lib/Textfile/21file.txt');
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
class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BAR"),
        centerTitle: true,
      ),
    );
  }
}
class bar2 extends StatefulWidget {
  @override
  bar2State createState() => bar2State();
}

class bar2State extends State<bar2> {
  int currentpage = 0;
  final tabs = [BottomAppbarExample(), code2()];

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
          "Bottom Bar",
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
    await rootBundle.loadString('lib/Textfile/22file.txt');
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
class BottomAppbarExample extends StatefulWidget {
  const BottomAppbarExample({Key key}) : super(key: key);

  @override
  _BottomAppbarExampleState createState() => _BottomAppbarExampleState();
}

class _BottomAppbarExampleState extends State<BottomAppbarExample> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  bool _isBottomBarNotched = false;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text('FloatingActionButton position:'),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: this._fabLocation,
              onChanged: (FloatingActionButtonLocation newVal) {
                if (newVal != null) {
                  setState(() => this._fabLocation = newVal);
                }
              },
              items: [
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerFloat,
                  child: Text('centerFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endFloat,
                  child: Text('endFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text('centerDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endDocked,
                  child: Text('endDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.miniStartTop,
                  child: Text('miniStartTop'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.startTop,
                  child: Text('startTop'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Mini FAB:'),
            trailing: Switch(
              value: this._isFabMini,
              onChanged: (bool val) {
                setState(() => this._isFabMini = val);
              },
            ),
          ),
          ListTile(
            title: Text('BottomAppBar notch:'),
            trailing: Switch(
              value: this._isBottomBarNotched,
              onChanged: (bool val) {
                setState(() => this._isBottomBarNotched = val);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: this._isFabMini,
        onPressed: () =>
        (){

        }
      ),
      floatingActionButtonLocation: this._fabLocation,
      bottomNavigationBar: this._buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: this._isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          // Bottom that pops up from the bottom of the screen.
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 200,
                child: Text('Dummy bottom sheet'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
               {

               }
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => (){

            }
          ),
        ],
      ),
    );
  }
}
class bar3 extends StatefulWidget {
  @override
  bar3State createState() => bar3State();
}

class bar3State extends State<bar3> {
  int currentpage = 0;
  final tabs = [SliverAppBarExample(), code3()];

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
          "Sliver APP BAR",
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
    await rootBundle.loadString('lib/Textfile/23file.txt');
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
class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FlexibleSpace title",style: TextStyle(color: Color(0xFF000000)),),
              background: Image.asset(
                'lib/images/download (1).png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Center(child: Text("Hello")),
          ),
        ],
      ),
      bottomNavigationBar: this._getBottomAppBar(),
    );
  }

  Widget _getBottomAppBar() {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('pinned'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._pinned = val;
                  });
                },
                value: this._pinned,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('snap'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._snap = val;
                    // **Snapping only applies when the app bar is floating.**
                    this._floating = this._floating || val;
                  });
                },
                value: this._snap,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('floating'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    this._floating = val;
                  });
                },
                value: this._floating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class bar4 extends StatefulWidget {
  @override
  bar4State createState() => bar4State();
}

class bar4State extends State<bar4> {
  int currentpage = 0;
  final tabs = [AppBarSearchExample(), code4()];

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
          "Search Bar",
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
    await rootBundle.loadString('lib/Textfile/24file.txt');
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


class AppBarSearchExample extends StatefulWidget {
  const AppBarSearchExample({Key key}) : super(key: key);

  @override
  _AppBarSearchExampleState createState() => _AppBarSearchExampleState();
}

class _AppBarSearchExampleState extends State<AppBarSearchExample> {
  final List<String> kEnglishWords;
  _MySearchDelegate _delegate;

  _AppBarSearchExampleState()
      : kEnglishWords = List.from(Set.from(english_words.all))
    ..sort(
          (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
    ),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(kEnglishWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('English Words'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have selected the word: $selected'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: kEnglishWords.length,
          itemBuilder: (context, idx) => ListTile(
            title: Text(kEnglishWords[idx]),
          ),
        ),
      ),
    );
  }
}

// Defines the content of the search page in `showSearch()`.
// SearchDelegate has a member `query` which is the query string.
class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>['apple', 'hello', 'world', 'flutter'],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
        tooltip: 'Voice Search',
        icon: const Icon(Icons.mic),
        onPressed: () {
          this.query = 'TODO: implement voice input';
        },
      )
          : IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
