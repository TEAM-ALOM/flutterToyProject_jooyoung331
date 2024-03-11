import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toyproject/screens/towritescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 237, 129),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check),
                Text(
                  "ToDoList",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ToWriteScreen()));
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ExpansionTile(
                      title: Text(
                        "오늘의 할 일",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Text("asd"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ExpansionTile(
                      title: Text(
                        "일주일 간 해야할 일",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Text("asd"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ExpansionTile(
                      title: Text(
                        "이번 달의 할 일",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Text("asd"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ExpansionTile(
                      title: Text(
                        "지금 할 일",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Text("asd"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
