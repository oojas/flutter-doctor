import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:helper/UI/UI.dart';
import 'package:helper/UI/UI2.dart';
import 'package:helper/UI/UI3.dart';
import 'package:helper/UI/UI4.dart';
import 'package:helper/UI/UI5.dart';
import 'package:helper/UI/UI6.dart';
import 'package:helper/UI/UI7.dart';
import 'package:helper/animations/modelclass.dart';

class animations extends StatefulWidget {
  @override
  _animationsState createState() => _animationsState();
}

class _animationsState extends State<animations>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation, _animation;
  final List<contents> contentlist = contents.content();
  List<Icon> iconlist = [
    Icon(Icons.check_box_outline_blank),
    Icon(Icons.layers),
    Icon(Icons.list),
    Icon(Icons.apps),
    Icon(Icons.navigation),
    Icon(Icons.signal_cellular_connected_no_internet_4_bar),
    Icon(Icons.text_rotation_angledown),
  ];
  final List<Color>colorlist=[
    Colors.redAccent,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purpleAccent
  ];

  @override
  void initState() {
    //Future.delayed(Duration(seconds:6));
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart);
    animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.greenAccent.shade200,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF000000),
            floating: true,
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.asset("lib/images/giphy2.gif"),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    customBorder: UnderlineInputBorder(),
                    child: Text(
                      "Getting Started",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: iconlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 30,
                      color: colorlist[index],
                      shadowColor: colorlist[index],
                      clipBehavior: Clip.antiAlias,
                      borderOnForeground: true,
                      semanticContainer: true,
                      child: ListTile(
                          leading: Icon(
                            iconlist[index].icon,
                          ),
                          title: Text(
                            contentlist[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          dense: true,
                          onTap: () {
                            if (contentlist[index].title == "Widgets") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return container();
                                      }));
                            } else if (contentlist[index].title == "Layouts") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return layout();
                                      }));
                            } else if (contentlist[index].title == "Lists") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return gist();
                                      }));
                            } else if (contentlist[index].title == "Appbar") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return bar();
                                      }));
                            } else if (contentlist[index].title ==
                                "Navigation") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return Nav();
                                      }));
                            } else if (contentlist[index].title == "Async") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return async();
                                      }));
                            } else {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      transitionsBuilder: (BuildContext context,
                                          animation, _animation, Widget child) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      pageBuilder: (BuildContext context,
                                          animation, _animation) {
                                        return anim();
                                      }));
                            }
                          }),
                    );
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}

class layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Container",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return container2();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Row,Column",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return rowcol();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Wrap",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return wrap();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Stack",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return stack();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Expanded,Sizebox",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return exp();
                        }))),
          ),
        ],
      ),
    );
  }
}

class container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Icon",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return icon();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "Text",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return text();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                child: Container(
                  child: Card(
                    elevation: 15,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black,
                    shadowColor: Colors.grey,
                    semanticContainer: true,
                    child: Center(
                        child: Text(
                      "TextField",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    )),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return textf();
                        }))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "TextFormField",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return textff();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Image",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return textfff();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Inkwell,card",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return card();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Buttons",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return button();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "DropDown,Menubutton",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return drop();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}

class gist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "ListTile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return tile();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "ListView.builder",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return view();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Gridlist",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return grid();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "ExpansionTile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return expansion();
                        }))
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Swipe to dismiss",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return swipe();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Reorderable list",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return reorder();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Data Table",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return table();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}

class bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Basic Appbar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return bar1();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Floating Button",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return bar2();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Sliver app bar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return bar3();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Search",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return bar4();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Tabs",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav1();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Dialogs",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav2();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Routes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav3();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Navigator Drawer",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav4();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Bottom Sheet",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav5();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Bottom tab bar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav6();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Bottom Navigation bar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav7();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Page Selector",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return nav8();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}

class async extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Future Builder",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return future();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Stream Builder",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return future1();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "StreamController",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return future2();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}

class anim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Hero",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return anima1();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Opacity",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return anima2();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Animated Container",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700),
                    ),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return anima3();
                        }))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Container(
                child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shadowColor: Colors.grey,
                  semanticContainer: true,
                  child: Center(
                      child: Text(
                    "Animatedpackage",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent.shade700),
                  )),
                ),
              ),
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, animation,
                            _animation, Widget child) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder:
                            (BuildContext context, animation, _animation) {
                          return anima4();
                        }))
            ),
          ),
        ],
      ),
    );
  }
}
