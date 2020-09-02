import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
        Clipboard,
        ClipboardData,
        rootBundle;

class tile extends StatefulWidget {
  @override
  tileState createState() => tileState();
}

class tileState extends State<tile> {
  int currentpage = 0;
  final tabs = [ListTileExample(), code1()];

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
          "List Tile",
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
        await rootBundle.loadString('lib/Textfile/14file.txt');
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

class ListTileExample extends StatelessWidget {
  const ListTileExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const listTiles = <Widget>[
      ListTile(
        title: Text('Tile 0: basic'),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.face),
        title: Text('Tile 1: with leading/trailing widgets'),
        trailing: Icon(Icons.tag_faces),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 2 title'),
        subtitle: Text('subtitle of tile 2'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 3: 3 lines'),
        isThreeLine: true,
        subtitle: Text('subtitle of tile 3'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 4: dense'),
        dense: true,
      ),
    ];
    // Directly returning a list of widgets is not common practice.
    // People usually use ListView.builder, c.f. "ListView.builder" example.
    // Here we mainly demostrate ListTile.
    return ListView(children: listTiles);
  }
}

class view extends StatefulWidget {
  @override
  viewState createState() => viewState();
}

class viewState extends State<view> {
  int currentpage = 0;
  final tabs = [ListViewBuilderExample(), code2()];

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
          "List View",
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
        await rootBundle.loadString('lib/Textfile/15file.txt');
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

class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numItems = 20;
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Item $idx',
          style: _biggerFont,
        ),
        trailing: Icon(Icons.dashboard),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}

class grid extends StatefulWidget {
  @override
  gridState createState() => gridState();
}

class gridState extends State<grid> {
  int currentpage = 0;
  final tabs = [GridListExample(), code3()];

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
          "Grid View",
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
        await rootBundle.loadString('lib/Textfile/16file.txt');
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

class GridListExample extends StatelessWidget {
  const GridListExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }),
    );
  }
}

class expansion extends StatefulWidget {
  @override
  expansionState createState() => expansionState();
}

class expansionState extends State<expansion> {
  int currentpage = 0;
  final tabs = [ExpansionTileExample(), code4()];

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
          "Expansion Tile",
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
        await rootBundle.loadString('lib/Textfile/17file.txt');
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

class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class swipe extends StatefulWidget {
  @override
  swipeState createState() => swipeState();
}

class swipeState extends State<swipe> {
  int currentpage = 0;
  final tabs = [ListSwipeToDismissExample(), code5()];

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
          "Swipe to Dismiss",
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
        await rootBundle.loadString('lib/Textfile/18file.txt');
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

class ListSwipeToDismissExample extends StatefulWidget {
  const ListSwipeToDismissExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListSwipeToDismissExampleState();
  }
}

class _ListSwipeToDismissExampleState extends State<ListSwipeToDismissExample> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final String item = _items[index];
        // Each Dismissible must contain a Key. Keys allow Flutter to uniquely
        // identify Widgets.
        return Dismissible(
          key: Key(item),
          // We also need to provide a function that tells our app what to do
          // after an item has been swiped away.
          onDismissed: (DismissDirection dir) {
            setState(() => this._items.removeAt(index));
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir == DismissDirection.startToEnd
                    ? '$item removed.'
                    : '$item liked.'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() => this._items.insert(index, item));
                  },
                ),
              ),
            );
          },
          // Show a red background as the item is swiped away
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
            alignment: Alignment.centerLeft,
          ),
          // Background when swipping from right to left
          secondaryBackground: Container(
            color: Colors.green,
            child: Icon(Icons.thumb_up),
            alignment: Alignment.centerRight,
          ),
          child: ListTile(
            title: Center(child: Text('${_items[index]}')),
          ),
        );
      },
    );
  }
}

class reorder extends StatefulWidget {
  @override
  reorderState createState() => reorderState();
}

class reorderState extends State<reorder> {
  int currentpage = 0;
  final tabs = [ReorderableListExample(), code6()];

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
          "Reorderable List",
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
        await rootBundle.loadString('lib/Textfile/19file.txt');
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

class ReorderableListExample extends StatefulWidget {
  const ReorderableListExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReorderableListExampleState();
  }
}

class _ListItem {
  _ListItem(this.value, this.checked);
  final String value;
  bool checked;
}

class _ReorderableListExampleState extends State<ReorderableListExample> {
  bool _reverseSort = false;
  static final _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map((item) => _ListItem(item, false)).toList();

  // Handler called by ReorderableListView onReorder after a list child is
  // dropped into a new position.
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _ListItem item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  // Handler called when the "sort" button on appbar is clicked.
  void _onSort() {
    setState(() {
      _reverseSort = !_reverseSort;
      _items.sort((_ListItem a, _ListItem b) => _reverseSort
          ? b.value.compareTo(a.value)
          : a.value.compareTo(b.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text('Reorderable list'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: _onSort,
        ),
      ],
    );
    final _listTiles = _items
        .map(
          (item) => CheckboxListTile(
            key: Key(item.value),
            value: item.checked ?? false,
            onChanged: (bool newValue) {
              setState(() => item.checked = newValue);
            },
            title: Text('This item represents ${item.value}.'),
            isThreeLine: true,
            subtitle: Text('Item ${item.value}, checked=${item.checked}'),
            secondary: Icon(Icons.drag_handle),
          ),
        )
        .toList();
    return Scaffold(
      appBar: _appbar,
      body: ReorderableListView(
        onReorder: _onReorder,
        children: _listTiles,
      ),
    );
  }
}
class table extends StatefulWidget {
  @override
  tableState createState() => tableState();
}

class tableState extends State<table> {
  int currentpage = 0;
  final tabs = [DataTableExample(), code7()];

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
          "Data Table",
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
    await rootBundle.loadString('lib/Textfile/20file.txt');
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
class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key}) : super(key: key);

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Nutrition'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: <int>[5, 10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: kTableColumns,
        source: DessertDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('Dessert (100g serving)'),
  ),
  DataColumn(
    label: const Text('Calories'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('Fat (g)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Carbs (g)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Protein (g)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Sodium (mg)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Calcium (%)'),
    tooltip:
    'The amount of calcium as a percentage of the recommended daily amount.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('Iron (%)'),
    numeric: true,
  ),
];

////// Data class.
class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);
  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Frozen yogurt', 159, 6.0, 24, 4.0, 87, 14, 1),
    new Dessert('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
    new Dessert('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
    new Dessert('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
    new Dessert('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
    new Dessert('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
    new Dessert('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
    new Dessert('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
    new Dessert('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
    new Dessert('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
    new Dessert('Frozen yogurt with sugar', 168, 6.0, 26, 4.0, 87, 14, 1),
    new Dessert('Ice cream sandwich with sugar', 246, 9.0, 39, 4.3, 129, 8, 1),
    new Dessert('Eclair with sugar', 271, 16.0, 26, 6.0, 337, 6, 7),
    new Dessert('Cupcake with sugar', 314, 3.7, 69, 4.3, 413, 3, 8),
    new Dessert('Gingerbread with sugar', 345, 16.0, 51, 3.9, 327, 7, 16),
    new Dessert('Jelly bean with sugar', 364, 0.0, 96, 0.0, 50, 0, 0),
    new Dessert('Lollipop with sugar', 401, 0.2, 100, 0.0, 38, 0, 2),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text('${dessert.name}')),
          DataCell(Text('${dessert.calories}')),
          DataCell(Text('${dessert.fat.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.carbs}')),
          DataCell(Text('${dessert.protein.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.sodium}')),
          DataCell(Text('${dessert.calcium}%')),
          DataCell(Text('${dessert.iron}%')),
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

