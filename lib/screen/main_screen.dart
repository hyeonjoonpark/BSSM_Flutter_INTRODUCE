import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  List<String> letterList = [];
  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // 눌렀을 때 Drawer 열리게
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                )
              ],
            ),
          ),
        ),
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Color(0xFFBAC9FF),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  '메인페이지',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                onTap: () {
                  Get.offAndToNamed("/");
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: const Text(
                  '나의 기술스텍',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                onTap: () {
                  Get.offAndToNamed("/stack");
                },
              ),
              ListTile(
                leading: const Icon(Icons.laptop_mac),
                title: const Text(
                  '프로젝트',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                onTap: () {
                  Get.offAndToNamed("/portfolio");
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Expanded 위젯 제거 및 이미지에 고정 크기 제공
                Image.asset(
                  "assets/image/hyunjun2.png",
                  height: 200.h, // 예시로 200의 높이 값을 주었습니다.
                  width: double.infinity,
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                Container(
                  width: 0.8.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            // 입력한값 letterList에 추가
                            letterList.add(value);
                            setState(() {});
                            _controller.clear();
                          },
                          decoration: const InputDecoration(
                            labelText: "박현준에게 편지쓰기",
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          letterList.add(_controller.text);
                          setState(() {});
                          _controller.clear();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blue; // 버튼이 눌렸을 때의 배경색
                              }
                              return Color(0xFFBAC9FF); // 기본 배경색
                            },
                          ), // 배경색
                          elevation: MaterialStateProperty.all(5.0), // 그림자 깊이
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            // 모서리 둥글기
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)), // 내부 패딩
                        ),
                        child: const Text(
                          "확인",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                ListView.separated(
                  shrinkWrap: true, // 여기에 추가
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: letterList.length,
                  separatorBuilder: (context, idx) {
                    return Container(
                      width: 0.8.sw,
                      child: Divider(
                        indent: 0.1.sw,
                        endIndent: 0.1.sw,
                      ),
                    );
                  },
                  itemBuilder: (context, idx) {
                    return Container(
                      width: 0.8.sw,
                      padding: const EdgeInsets.only(left: 45, top: 5),
                      child: Text(
                        _controller.text != "" ? letterList[idx] : "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
