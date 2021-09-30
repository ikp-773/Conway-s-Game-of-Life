import 'package:flutter/material.dart';
import 'package:game_of_life/screens/life_cycle.dart';
import 'package:get/get.dart';

class InitialLife extends StatefulWidget {
  const InitialLife({Key? key}) : super(key: key);
  @override
  _InitialLifeState createState() => _InitialLifeState();
}

class _InitialLifeState extends State<InitialLife> {
  late List<List<bool>> cell;
  late int row = 44, column = 20;
  late double canvasHeight, canvasWidth;

  @override
  void initState() {
    cell = List<List<bool>>.generate(
        row, (_) => List<bool>.generate(column, (_) => false));
    print("l= $cell");

    super.initState();
  }

  Widget build(BuildContext context) {
    canvasHeight = Get.height / row;
    canvasWidth = Get.width / column;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: column,
          childAspectRatio: 1,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
        ),
        itemCount: row * column,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                cell[index ~/ column][index % column] =
                    !cell[index ~/ column][index % column];
              });
            },
            child: Container(
              color: cell[index ~/ column][index % column]
                  ? Colors.white
                  : Colors.black,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        child: Icon(Icons.play_arrow_rounded),
        onPressed: () {
          Get.to(
            LifeCycle(column: column, cell: cell, row: row),
          );
        },
      ),
    );
  }
}
