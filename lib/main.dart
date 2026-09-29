import 'package:flutter/material.dart';

import 'dart:ui'; // 화면 사이즈용 추가

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  /**
  현재 실행한 담말기의 화면크기 출력. print()를 통해 출력한 내용은 디버그콘솔에서 확인할 수 있다. 
   */
  void getWindowSize() {
    // 앱화면의 논리적 크기 
    print(MediaQuery.of(context).size);
    // 화면배율 -> 에뮬레이터 픽셀4의 경우 2.75 
    print(MediaQuery.of(context).devicePixelRatio);
    // print(MediaQuery.of(context).padding.top);
    // 앱 화면의 물리적 크기 
    print(window.physicalSize);
  }

  @override
  Widget build(BuildContext context) {

    // 메서드 호출 
    getWindowSize();

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        //정렬 관련 속성 정의 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // 이미지 위젯을 여러개 배치하기 위해 List를 사용 
        children: [
          /**
          현재 배율에 맞는 이미지가 없으므로 기본이미지를 사용한다. 즉 녹색이 출력된다. 300a는 하나밖에 없는 상태이다. 
           */
          // 해당 배율에 이미지가 없으므로 기본 이미지를 사용
          Image.asset('assets/images/300x300a.png'),
          /**
          해당 배율(3.0x)에 이미지가 있으므로 분홍색 이미지를 사용한다. 만약 이미지가 하나밖에 없다면 노란색 이미지가 출력된다. 이와같이 자기 배율에 맞는 동일한 이름의 이미지가 있다면 자동으로 선택해서 사용하게된다. 크기를 지정하지 않으면 노란이미지 크기만큼 자동으로 줄어든다.  
           */
          // 해당 배율에 이미지가 있으므로 해당 배율의 분홍 이미지를 사용
          // 기본 폴더의 같은 이름의 이미지는 노랑색 이미지
          // 크기를 지정하지 않으면 배율만큼 자동으로 줄어듬
          Image.asset('assets/images/300x300b.png'),
          // 해당 배율의 이미지라도 크기를 지정하면 지정한 크기가 적용됨
          // Image.asset 의 크기가 지정된 것이지
          // 내부의 이미지 크기가 지정된 것은 아니다.
          Image.asset(
            'assets/images/300x300b.png',
            // fit: BoxFit.fill,
            width: 150,
          ),
          // 기본 폴더의 이미지에 크기 지정하기
          Image.asset('assets/images/300x300a.png', width: 100),
        ],
      ),
    );
  }
}
