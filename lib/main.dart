import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: InitialScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool turn = true;

  bool state1 = true;
  bool isEnabled1 = true;
  String figure1 = "";

  bool state2 = true;
  bool isEnabled2 = true;
  String figure2 = "";

  bool state3 = true;
  bool isEnabled3 = true;
  String figure3 = "";

  bool state4 = true;
  bool isEnabled4 = true;
  String figure4 = "";

  bool state5 = true;
  bool isEnabled5 = true;
  String figure5 = "";

  bool state6 = true;
  bool isEnabled6 = true;
  String figure6 = "";

  bool state7 = true;
  bool isEnabled7 = true;
  String figure7 = "";

  bool state8 = true;
  bool isEnabled8 = true;
  String figure8 = "";

  bool state9 = true;
  bool isEnabled9 = true;
  String figure9 = "";

  String checkIfTriki() {
    //triki horizontal circulo
    if ((figure1 == "c" && figure2 == "c" && figure3 == "c") ||
        (figure4 == "c" && figure5 == "c" && figure6 == "c") ||
        (figure7 == "c" && figure8 == "c" && figure9 == "c")) {
      return "circulo";
    }
    //triki horizontal x
    else if ((figure1 == "x" && figure2 == "x" && figure3 == "x") ||
        (figure4 == "x" && figure5 == "x" && figure6 == "x") ||
        (figure7 == "x" && figure8 == "x" && figure9 == "x")) {
      return "cruz";
    }
    //triki vertical circulo
    else if ((figure1 == "c" && figure4 == "c" && figure7 == "c") ||
        (figure2 == "c" && figure5 == "c" && figure8 == "c") ||
        (figure3 == "c" && figure6 == "c" && figure9 == "c")) {
      return "circulo";
    }
    //triki vertical x
    else if ((figure1 == "x" && figure4 == "x" && figure7 == "x") ||
        (figure2 == "x" && figure5 == "x" && figure8 == "x") ||
        (figure3 == "x" && figure6 == "x" && figure9 == "x")) {
      return "cruz";
    }
    //triki diagonal circulo
    else if ((figure1 == "c" && figure5 == "c" && figure9 == "c") ||
        (figure7 == "c" && figure5 == "c" && figure3 == "c")) {
      return "circulo";
    }
    //triki diagonal x
    else if ((figure1 == "x" && figure5 == "x" && figure9 == "x") ||
        (figure7 == "x" && figure5 == "x" && figure3 == "x")) {
      return "cruz";
    } else if ((!isEnabled1 &&
        !isEnabled2 &&
        !isEnabled3 &&
        !isEnabled4 &&
        !isEnabled5 &&
        !isEnabled6 &&
        !isEnabled7 &&
        !isEnabled8 &&
        !isEnabled9)) {
      return "empate";
    } else {
      return "";
    }
  }

  void restartGame() {
    setState(() {
      turn = true;

      isEnabled1 = true;
      figure1 = "";
      isEnabled2 = true;
      figure2 = "";
      isEnabled3 = true;
      figure3 = "";
      isEnabled4 = true;
      figure4 = "";
      isEnabled5 = true;
      figure5 = "";
      isEnabled6 = true;
      figure6 = "";
      isEnabled7 = true;
      figure7 = "";
      isEnabled8 = true;
      figure8 = "";
      isEnabled9 = true;
      figure9 = "";
    });
  }

  void _showDialog(BuildContext context, res) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("GAME OVER!"),
          content: new Text(res),
          actions: <Widget>[
            new FlatButton(
              child: new Text("RESTART GAME"),
              onPressed: () {
                restartGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void setPopUp() {
    String res = checkIfTriki();
    if (res == "circulo") {
      _showDialog(context, "circle won!");
    } else if (res == "cruz") {
      _showDialog(context, "cross won!");
    } else if (res == "empate") {
      _showDialog(context, "it's a tie! try again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    checkIfTriki();
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          centerTitle: true,
          title: Text("Triki!"),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled1
                        ? Icons.lens_blur
                        : state1
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled1
                        ? Colors.grey
                        : figure1 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled1 == true) {
                      state1 = turn;
                      turn ? figure1 = "c" : figure1 = "x";
                      turn = !turn;
                    }
                    isEnabled1 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled2
                        ? Icons.lens_blur
                        : state2
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled2
                        ? Colors.grey
                        : figure2 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled2 == true) {
                      state2 = turn;
                      turn ? figure2 = "c" : figure2 = "x";
                      turn = !turn;
                    }
                    isEnabled2 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled3
                        ? Icons.lens_blur
                        : state3
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled3
                        ? Colors.grey
                        : figure3 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled3 == true) {
                      state3 = turn;
                      turn ? figure3 = "c" : figure3 = "x";
                      turn = !turn;
                    }
                    isEnabled3 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled4
                        ? Icons.lens_blur
                        : state4
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled4
                        ? Colors.grey
                        : figure4 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled4 == true) {
                      state4 = turn;
                      turn ? figure4 = "c" : figure4 = "x";
                      turn = !turn;
                    }
                    isEnabled4 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled5
                        ? Icons.lens_blur
                        : state5
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled5
                        ? Colors.grey
                        : figure5 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled5 == true) {
                      state5 = turn;
                      turn ? figure5 = "c" : figure5 = "x";
                      turn = !turn;
                    }
                    isEnabled5 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled6
                        ? Icons.lens_blur
                        : state6
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled6
                        ? Colors.grey
                        : figure6 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled6 == true) {
                      state6 = turn;
                      turn ? figure6 = "c" : figure6 = "x";
                      turn = !turn;
                    }
                    isEnabled6 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled7
                        ? Icons.lens_blur
                        : state7
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled7
                        ? Colors.grey
                        : figure7 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled7 == true) {
                      state7 = turn;
                      turn ? figure7 = "c" : figure7 = "x";
                      turn = !turn;
                    }
                    isEnabled7 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled8
                        ? Icons.lens_blur
                        : state8
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled8
                        ? Colors.grey
                        : figure8 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled8 == true) {
                      state8 = turn;
                      turn ? figure8 = "c" : figure8 = "x";
                      turn = !turn;
                    }
                    isEnabled8 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    isEnabled9
                        ? Icons.lens_blur
                        : state9
                            ? Icons.circle_outlined
                            : Icons.clear_outlined,
                    color: isEnabled9
                        ? Colors.grey
                        : figure9 == "c"
                            ? Colors.blue[700]!
                            : Colors.purple[700]!),
                onPressed: () {
                  setState(() {
                    if (isEnabled9 == true) {
                      state9 = turn;
                      turn ? figure9 = "c" : figure9 = "x";
                      turn = !turn;
                    }
                    isEnabled9 = false;
                  });
                  setPopUp();
                },
              ),
            ),
            Align(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  turn ? "ACTUAL TURN: O" : "ACTUAL TURN: X",
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = turn ? Colors.blue[700]! : Colors.purple[700]!,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('wanna play?')),
      body: Center(
        child: RaisedButton(
          child: Text(
            'START TIC-TAC-TOE GAME!',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            _navigateToNextScreen(context);
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyHomePage(title: "trikiScreen")));
  }
}
