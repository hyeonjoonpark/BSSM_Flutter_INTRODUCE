import 'package:get/get.dart';
import 'package:test1/screen/main_screen.dart';
import 'package:test1/screen/my_stack.dart';
import 'package:test1/screen/portfolio.dart';

List<GetPage> appRoute = [
  GetPage(name: "/", page: () => const HomeScreen()),
  GetPage(name: "/stack", page: () => const StackScreen()),
  GetPage(name: "/portfolio", page: () => PortfoliioScreen())
];
