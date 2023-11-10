import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: Scaffold(
            body: Body(),
          )
      )
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ExampleStateless(),
          ExampleStateful(),
        ]
    );
  }
}

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          color: Colors.red
      ),
    );
  }
}

class ExampleStateful extends StatefulWidget {
  const ExampleStateful({super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  // 모든 변수 상태변수 객체 안에 넣어줘야 함
  late int index;
  late TextEditingController textController;

  // ctrl + O
  @override
  // 초기값 조정 가능
  void initState() {
    super.initState(); // 상속의 개념이기 때문에
    index = 5;
    textController = TextEditingController();
  }

  // 할당자원 반환
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector( // 터치 시 감지가능한 위젯
          onTap: () {
            setState(() {
              if (index == 5) {
                index = 0;
                return;
              }
            });

            index++;
          },
          child: Container(
            color: Colors.blue.withOpacity(index/5), // 클릭할수록 투명도 증가
            child: Center(
            child: Text('$index') // $쓰면 해당 문자열이 text로 바뀜
          ),
        ),
      ),
    );
  }
}

