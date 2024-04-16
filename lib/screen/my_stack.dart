import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Stack {
  final String title;
  final String subtitle;
  final Widget image;

  const Stack(this.title, this.subtitle, this.image);
}

class StackScreen extends StatefulWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  _MyStackScreen createState() => _MyStackScreen();
}

class _MyStackScreen extends State<StackScreen> {
  final List<Stack> customListTiles = [
    Stack(
      "Back-End",
      "Java, Spring Boot, JPA",
      Image.asset("assets/image/springboot.png"),
    ),
    Stack(
      "Front-End",
      "HTML, CSS, JavaScript, React.js, Flutter",
      Image.asset("assets/image/flutter.png"),
    ),
    Stack(
      "Database",
      "MySQL, Oracle",
      Image.asset("assets/image/mysql.png"),
    ),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) => Scaffold(
        key: _scaffoldKey,
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
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
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
              children: customListTiles
                  .map((tile) => Card(
                        child: ListTile(
                          title: Text(
                            tile.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            tile.subtitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: tile.image,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
