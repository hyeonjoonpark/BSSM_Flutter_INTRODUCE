import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/components/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) => Scaffold(
        appBar: navBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/image/hyunjun2.png"),
                SizedBox(
                  height: 0.01.sh,
                ),
                Container(
                  width: 0.9.sw,
                  child: const Text(
                    "안녕하세요.\n끊임없이 생각하는 개발자 박현준입니다. \n" +
                        "저는 Spring Boot를 이용한 서버 개발을 주로 하고 있습니다. " +
                        "한가지 분야만 몰두하는 것이 아닌 여러분야를 경험하면서 T자형 인재가 되기 위해 노력하고 있습니다. ",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
