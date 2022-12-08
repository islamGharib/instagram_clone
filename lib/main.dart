import 'package:flutter/material.dart';
import 'package:instagram_flutter/layout/mobile_screen_layout.dart';
import 'package:instagram_flutter/layout/responsive_screen_layout.dart';
import 'package:instagram_flutter/layout/web_screen_layout.dart';
import 'package:instagram_flutter/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: mobileTheme,
      home:  const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),),
    );
  }
}

