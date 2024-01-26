import 'package:flutter/material.dart';

class Pos extends StatefulWidget {
  final String figura;
  final int row;
  final int column;
  final Function(int, int, String) btnPress1;
  final bool selected;

  const Pos(
      {Key? key,
      required this.figura,
      required this.row,
      required this.column,
      required this.btnPress1,
      required this.selected})
      : super(key: key);

  @override
  _PosState createState() => _PosState();
}

class _PosState extends State<Pos> {
  bool clickedState = false;
  Color _color = Colors.white;

  void colorSet() {
    if (widget.column % 2 == 0) {
      if (widget.row % 2 == 0) {
        setState(() {
          _color = Colors.grey.shade200;
        });
      } else {
        setState(() {
          _color = Colors.green.shade300;
        });
      }
    } else {
      if (widget.row % 2 != 0) {
        setState(() {
          _color = Colors.grey.shade200;
        });
      } else {
        setState(() {
          _color = Colors.green.shade300;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorSet();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              widget.btnPress1(widget.row, widget.column, widget.figura);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: widget.selected ? Colors.grey.shade300 : _color),
                child: Center(
                    child: widget.figura != ""
                        ? Image.asset("figure_pics/${widget.figura}.png")
                        : const Text("")))));
  }
}
