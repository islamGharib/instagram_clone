import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_flutter/layout/mobile_screen_layout.dart';
import 'package:instagram_flutter/layout/responsive_screen_layout.dart';
import 'package:instagram_flutter/layout/web_screen_layout.dart';
import 'package:instagram_flutter/modules/login/login_screen.dart';
import 'package:instagram_flutter/modules/signup/signup_screen.dart';
import 'package:instagram_flutter/shared/bloc/instagram_bloc.dart';
import 'package:instagram_flutter/shared/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCRIo9J3AdfL3fpQd4n4RsutVqNUanQEQs',
          appId: '1:13800069125:web:9e9ab5cbd57f0c6127e46c',
          messagingSenderId: '13800069125',
          projectId: 'instagram-clone-7b992',
          storageBucket: 'instagram-clone-7b992.appspot.com'
      ),
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InstagramBloc>(
      create: (context) => InstagramBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: mobileTheme,
        // home:  const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),),
        home: LoginScreen(),
      ),
    );
  }
}

