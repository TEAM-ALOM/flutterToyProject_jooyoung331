import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToWriteScreen extends StatefulWidget {
  const ToWriteScreen({super.key});

  @override
  State<ToWriteScreen> createState() => _ToWriteScreenState();
}

class _ToWriteScreenState extends State<ToWriteScreen> {
  DateTime? _selectedDate;
  var value = "";
  TimeOfDay initialTime = TimeOfDay.now();
  TimeOfDay lateTime = TimeOfDay.now();
  String textContent = "";
  String textContentMemo = "";
  final _controllerTodo = TextEditingController();
  final _controllerTomemo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 제스처디텍터
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 232, 237, 129),
          title: const Text("오늘의 할일은 무엇인가요?"),
          leading: TextButton(
            //왼쪽에 아이콘 만들려면 leading
            child: const Text(
              "취소",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                size: 25,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 232, 237, 129),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "할 일",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextField(
                  controller: _controllerTodo,
                  onChanged: (value) {
                    textContent = value;
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "날짜",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                        _selectedDate != null
                            ? _selectedDate.toString().split(" ")[0]
                            : "",
                        style: const TextStyle(fontSize: 22)),
                    ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2030),
                        ).then((selectedDate) {
                          setState(() {
                            _selectedDate = selectedDate;
                          });
                        });
                      },
                      child: const Text("날짜 선택"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "시간",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '시작시간', //초기 시간은 현재시간
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '종료시간', //초기 시간은 현재시간
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: initialTime,
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            initialTime = timeOfDay;
                          });
                        }
                      },
                      child: Text(
                        '${initialTime.hour}:${initialTime.minute}', //초기 시간은 현재시간
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay2 = await showTimePicker(
                          context: context,
                          initialTime: lateTime,
                        );
                        if (timeOfDay2 != null) {
                          setState(() {
                            lateTime = timeOfDay2;
                          });
                        }
                      },
                      child: Text(
                        '${lateTime.hour}:${lateTime.minute}', //초기 시간은 현재시간
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "메모",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextField(
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 120),
                  ),
                  controller: _controllerTomemo,
                  onChanged: (value) {
                    textContentMemo = value;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
