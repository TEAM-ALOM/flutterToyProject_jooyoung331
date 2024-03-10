import 'package:flutter/material.dart';

class ToWriteScreen extends StatefulWidget {
  const ToWriteScreen({super.key});

  @override
  State<ToWriteScreen> createState() => _ToWriteScreenState();
}

class _ToWriteScreenState extends State<ToWriteScreen> {
  DateTime? _selectedDate;
  //DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 237, 129),
        title: const Text("오늘의 할일은 무엇인가요?"),
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
              const TextField(
                decoration: InputDecoration(),
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
                  fontSize: 25,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
