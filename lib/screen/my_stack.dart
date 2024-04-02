import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/components/nav_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) => Scaffold(
        appBar: navBar(),
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
