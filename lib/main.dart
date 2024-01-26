import 'package:flutter/material.dart';
import 'figura.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chess'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> startPositions = [
    ["br", "bn", "bb", "bq", "bk", "bb", "bn", "br"],
    ["bp", "bp", "bp", "bp", "bp", "bp", "bp", "bp"],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["wp", "wp", "wp", "wp", "wp", "wp", "wp", "wp"],
    ["wr", "wn", "wb", "wq", "wk", "wb", "wn", "wr"]
  ];
  List<List<Pos>> board = [];
  Map<String, dynamic> prevPos = {"row": 0, "column": 0, "figura": ""};
  bool set = false;

  void btnPress(int row, int column, String figura) {
    if (!set) {
      setState(() {
        board[row][column] = Pos(
          figura: figura,
          row: row,
          column: column,
          btnPress1: btnPress,
          selected: true,
        );
      });
    } else {
      setState(() {
        board[row][column] = Pos(
          figura: prevPos["figura"],
          row: row,
          column: column,
          btnPress1: btnPress,
          selected: false,
        );
        board[prevPos["row"]][prevPos["column"]] = Pos(
          figura: "",
          row: prevPos["row"],
          column: prevPos["column"],
          btnPress1: btnPress,
          selected: false,
        );
      });
    }
    set = !set;
    prevPos = {"row": row, "column": column, "figura": figura};
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 8; i++) {
      List<Pos> lst = [];
      for (int j = 0; j < 8; j++) {
        lst.add(Pos(
          figura: startPositions[i][j],
          row: i,
          column: j,
          btnPress1: btnPress,
          selected: false,
        ));
      }
      board.add(lst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 700,
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 8; i++) ...[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0; j < 8; j++) ...[board[i][j]]
                        ],
                      ),
                    )
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
