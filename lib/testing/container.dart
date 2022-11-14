import 'package:flutter/material.dart';

class SelectablContainer extends StatefulWidget {
  const SelectablContainer({super.key});

  @override
  State<SelectablContainer> createState() => _SelectablContainerState();
}

class _SelectablContainerState extends State<SelectablContainer> {
  @override
  int selected_inx = 0; // set it -1 if you want by default all unselected.
  @override
  Widget build(BuildContext context) {
    var n = 1;
    var listOfContainers = <Padding>[];
    var list = List<int>.generate(n, (i) => i + 1);
    list.forEach((i) {
      Color borderColor = (i == selected_inx) ? Colors.white : Colors.black;
      return listOfContainers.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.brown,
              border: Border.all(width: 3, color: borderColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selected_inx = i;
                  (i);
                });
              },
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('test app'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfContainers)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
