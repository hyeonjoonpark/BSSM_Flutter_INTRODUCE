import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/components/nav_bar.dart';

class MyPortfolio {
  final String title;
  final String subtitle;
  final Widget image;

  const MyPortfolio(this.title, this.subtitle, this.image);
}

class PortfoliioScreen extends StatefulWidget {
  PortfoliioScreen({super.key});

  @override
  State createState() => _PortfoliioScreen();
}

class _PortfoliioScreen extends State<PortfoliioScreen> {
  final List<MyPortfolio> customListTiles = [
    MyPortfolio(
      "AriPay",
      "부산소마고(장려상)\n교내 매점 결제 시스템",
      Image.asset("assets/image/AriPay.png"),
    ),
    MyPortfolio(
      "BSSM 키오스크",
      "부산소프트웨어마이스터고등학교\n교내 매점 셀프계산대",
      Image.asset("assets/image/self.png"),
    ),
    MyPortfolio(
      "어데고",
      "친구 매칭 서비스",
      Image.asset("assets/image/adego.png"),
    ),
    MyPortfolio(
      "최병준 선생님 팬카페",
      "부산소마고 최고 미남\n최병준 선생님 팬카페",
      Image.asset("assets/image/bbam.png"),
    ),
    MyPortfolio(
      "별꿈",
      "하이톤 해커톤(마루상)\n인공지능 해몽 서비스",
      Image.asset("assets/image/stardream.png"),
    ),
    MyPortfolio(
      "HealthUp",
      "임팩톤 해커톤(최우수상)\n인공지능 로드맵 추천서비스",
      Image.asset("assets/image/health.png"),
    ),
    MyPortfolio(
      "EyesUp",
      "앱잼 해커톤(장려상)\n인공지능 졸음운전 예방 서비스",
      Image.asset("assets/image/eyesup.png"),
    ),
    MyPortfolio(
      "Lace",
      "4개 소마고 해커톤\n인공지능 상담사 매칭 서비스",
      Image.asset("assets/image/lace.png"),
    ),
  ];

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
                          leading: Container(
                            width: 100.0, // 원하는 가로 크기
                            height: 100.0, // 원하는 세로 크기
                            child: tile.image,
                          ),
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
