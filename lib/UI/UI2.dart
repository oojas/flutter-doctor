import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData, TextInputFormatter, WhitelistingTextInputFormatter, rootBundle;


class icon extends StatefulWidget {
  @override
  iconState createState() => iconState();
}

class iconState extends State<icon>{

  int currentpage=0;
  final tabs=[
    iconex(),
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
        title: Text("Icon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
 class iconex extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Center(
       child: Icon(Icons.image,
       size: 64.0,
       color: Colors.amberAccent,),
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
    String responsetext = await rootBundle.loadString('lib/Textfile/6file.txt');
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
class text extends StatefulWidget {
  @override
  textState createState() => textState();
}

class textState extends State<text>{

  int currentpage=0;
  final tabs=[
    textex(),
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
        title: Text("Text",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class textex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello World",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
    String responsetext = await rootBundle.loadString('lib/Textfile/7file.txt');
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
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  bool _numberInputIsValid = true;

  Widget _buildNumberTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: 'Enter an integer:',
        errorText: _numberInputIsValid ? null : 'Please enter an integer!',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onSubmitted: (val) =>
         {

         },
      onChanged: (String val) {
        final v = int.tryParse(val);
        debugPrint('parsed value = $v');
        if (v == null) {
          setState(() => _numberInputIsValid = false);
        } else {
          setState(() => _numberInputIsValid = true);
        }
      },
    );
  }

  final _controller = TextEditingController();

  Widget _buildMultilineTextField() {
    return TextField(
      controller: this._controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${this._controller.text.split(' ').length} words',
        labelText: 'Enter multiline text:',
        hintText: 'type something...',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) => setState(() {}),
    );
  }

  bool _showPassword = false;

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: !this._showPassword,
      decoration: InputDecoration(
        labelText: 'password',
        prefixIcon: Icon(Icons.security),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this._showPassword ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            setState(() => this._showPassword = !this._showPassword);
          },
        ),
      ),
    );
  }

  Widget _buildBorderlessTextField() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: 'borderless input'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        ListTile(title: Text('1. Number input field')),
        _buildNumberTextField(),
        ListTile(title: Text('2. Multiline input field')),
        _buildMultilineTextField(),
        ListTile(title: Text('3. Password input field')),
        _buildPasswordTextField(),
        ListTile(title: Text('4. Borderless input')),
        _buildBorderlessTextField(),
      ],
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
    String responsetext = await rootBundle.loadString('lib/Textfile/8file.txt');
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
class textf extends StatefulWidget {
  @override
  textfState createState() => textfState();
}

class textfState extends State<textf>{

  int currentpage=0;
  final tabs=[
    TextFieldExample(),
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
        title: Text("Text Field",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  GlobalKey<FormFieldState<String>>();

  String _name;
  String _phoneNumber;
  String _email;
  String _password;

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            onSaved: (String value) {
              this._name = value;
              print('name=$_name');
            },
            validator: _validateName,
          ),
          SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '+86',
            ),
            keyboardType: TextInputType.phone,
            onSaved: (String value) {
              this._phoneNumber = value;
              print('phoneNumber=$_phoneNumber');
            },
            // TextInputFormatters are applied in sequence.
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String value) {
              this._email = value;
              print('email=$_email');
            },
          ),
          SizedBox(height: 24.0),
          // "Life story" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tell us about yourself',
              helperText: 'Keep it short, this is just a demo.',
              labelText: 'Life story',
            ),
            maxLines: 3,
          ),
          SizedBox(height: 24.0),
          // "Salary" form.
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.green)),
            maxLines: 1,
          ),
          SizedBox(height: 24.0),
          // "Password" form.
          PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: 'No more than 8 characters.',
            labelText: 'Password *',
            onFieldSubmitted: (String value) {
              setState(() {
                this._password = value;
              });
            },
          ),
          SizedBox(height: 24.0),
          // "Re-type password" form.
          TextFormField(
            enabled: this._password != null && this._password.isNotEmpty,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              labelText: 'Re-type password',
            ),
            maxLength: 8,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
class textff extends StatefulWidget {
  @override
  textffState createState() => textffState();
}

class textffState extends State<textff>{

  int currentpage=0;
  final tabs=[
    TextFormFieldExample(),
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
        title: Text("Text Form Field",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class textfff extends StatefulWidget {
  @override
  textfffState createState() => textfffState();
}

class textfffState extends State<textfff>{

  int currentpage=0;
  final tabs=[
   image(),
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
        title: Text("Image",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class code4 extends StatefulWidget {
  @override
  _code4State createState() => _code4State();
}

class _code4State extends State<code4> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/9file.txt');
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
class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('lib/images/download (1).png'),
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
    String responsetext = await rootBundle.loadString('lib/Textfile/10file.txt');
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
class CardExample extends StatelessWidget {
  const CardExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
          color: Colors.red,
          // The elevation determines shade.
          elevation: 10.0,
          child: Container(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Card 1'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          margin: EdgeInsets.all(20.0),
          elevation: 0.0,
          child: Container(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Card 2 (with Inkwell effect on tap)'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.elliptical(40.0, 80.0),
            ),
          ),
          child: Container(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Card 3 (with custom border radius)'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Card 4 (complex example)',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('SHARE'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('EXPLORE'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class code6 extends StatefulWidget {
  @override
  _code6State createState() => _code6State();
}

class _code6State extends State<code6> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/11file.txt');
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
class card extends StatefulWidget {
  @override
 cardState createState() => cardState();
}

class cardState extends State<card>{

  int currentpage=0;
  final tabs=[
  CardExample(),
    code6()

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
        title: Text("Card,Inkwell",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class button extends StatefulWidget {
  @override
  buttonState createState() => buttonState();
}

class buttonState extends State<button>{

  int currentpage=0;
  final tabs=[
   ButtonsExample(),
    code7()

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
        title: Text("Buttons",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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
class ButtonsExample extends StatelessWidget {
  const ButtonsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Button tapped'),
        duration: Duration(milliseconds: 500),
      ),
    );
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Raised buttons add dimension to mostly flat layouts. They '
                'emphasize functions on busy or wide spaces.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: _showSnack,
                ),
                RaisedButton(
                  child: Text('disabled-RaisedButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('A flat button displays an ink splash on press '
                'but does not lift. Use flat buttons on toolbars, in dialogs '
                'and inline with padding'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('FlatButton'),
                  onPressed: (){

                  }
                ),
                FlatButton(
                  child: Text('disabled-FlatButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('Outline buttons become opaque and elevate when pressed. They '
                'are often paired with raised buttons to indicate an '
                'alternative, secondary action.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  child: Text('OutlineButton'),
                  onPressed: (){

                  }
                ),
                OutlineButton(
                  child: Text('OutlineButton'),
                  onPressed: null,
                )
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('Tooltips are short identifying messages that briefly appear '
                'in response to a long press. Tooltip messages are also used '
                'by services that make Flutter apps accessible, like screen '
                'readers.'),
            Center(
              child: IconButton(
                iconSize: 32.0,
                icon: Icon(Icons.call),
                tooltip: 'Place a phone call',
                onPressed: _showSnack,
              ),
            )
          ],
        ),
      ],
    );
  }
}
class code7 extends StatefulWidget {
  @override
  _code7State createState() => _code7State();
}

class _code7State extends State<code7> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/12file.txt');
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
class code8 extends StatefulWidget {
  @override
  _code8State createState() => _code8State();
}

class _code8State extends State<code8> {
  String data = '';

  fetchdata() async {
    String responsetext = await rootBundle.loadString('lib/Textfile/13file.txt');
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
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();

  String _btn1SelectedVal = 'One';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('DropDownButton with default:'),
          trailing: DropdownButton<String>(
            // Must be one of items.value.
            value: _btn1SelectedVal,
            onChanged: (String newValue) {
              setState(() {
                _btn1SelectedVal = newValue;
              });
            },
            items: this._dropDownMenuItems,
          ),
        ),
        ListTile(
          title: Text('DropDownButton with hint:'),
          trailing: DropdownButton(
            value: _btn2SelectedVal,
            hint: Text('Choose'),
            onChanged: ((String newValue) {
              setState(() {
                _btn2SelectedVal = newValue;
              });
            }),
            items: _dropDownMenuItems,
          ),
        ),
        ListTile(
          title: const Text('Popup menu button:'),
          trailing: new PopupMenuButton<String>(
            onSelected: (String newValue) {
              _btn3SelectedVal = newValue;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('$_btn3SelectedVal'),
                ),
              );
            },
            itemBuilder: (BuildContext context) => _popUpMenuItems,
          ),
        ),
      ],
    );
  }
}
class drop extends StatefulWidget {
  @override
  dropState createState() => dropState();
}

class dropState extends State<drop>{

  int currentpage=0;
  final tabs=[
    DropdownButtonExample(),
    code8()

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
        title: Text("DropDown,Menubutton",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
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


