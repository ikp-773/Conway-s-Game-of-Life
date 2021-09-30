import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LifeCycle extends StatefulWidget {
  final List<List<bool>> cell;
  final int row, column;

  const LifeCycle(
      {Key? key, required this.cell, required this.row, required this.column})
      : super(key: key);

  @override
  _LifeCycleState createState() => _LifeCycleState(cell, row, column);
}

class _LifeCycleState extends State<LifeCycle> {
  late double canvasHeight, canvasWidth;

  final int row, column;
  List<List<bool>> cell;
  late Timer timer;

  _LifeCycleState(this.cell, this.row, this.column);

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 300), (Timer t) => start());
    super.initState();
  }

  start() {
    int i, j;
    List<List<bool>> k = List<List<bool>>.generate(
        row, (_) => List<bool>.generate(column, (_) => false));
    i = -1;
    j = -1;

    while (++i < row) {
      j = -1;
      while (++j < column) {
        k[i][j] = game(i, j);
      }
    }

    setState(() {
      cell = k;
    });
  }

  bool game(int i, int j) {
    int f, g;
    int sum = 0;

    for (f = -1; f < 2; ++f) {
      for (g = -1; g < 2; ++g) {
        if (f != 0 || g != 0) {
          int x = cell[(f + i + row) % row][(g + j + column) % column] ? 1 : 0;
          sum = sum + x;
        }
      }
    }

    if (sum > 3 || sum < 2) return false;

    if (sum == 3) return true;

    return cell[i][j];
  }

  @override
  Widget build(BuildContext context) {
    canvasHeight = Get.height / row;
    canvasWidth = Get.width / column;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: column,
            childAspectRatio: 1,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0.5),
        itemCount: row * column,
        itemBuilder: (context, index) {
          return Container(
            color: cell[index ~/ column][index % column]
                ? Colors.white
                : Colors.black,
          );
        },
      )),
    );
  }
}
