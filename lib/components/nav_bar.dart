import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget? navBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.black87,
              size: 40,
            ),
            onPressed: () {
              Get.offAndToNamed("/");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.laptop_mac,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Get.offAndToNamed("/stack");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notification_add,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Get.offAndToNamed("/portfolio");
            },
          ),
        ],
      ),
    ),
  );
}
