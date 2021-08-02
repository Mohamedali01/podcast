import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/providers/auth_provider.dart';
import 'package:podcast_app/app/auth/control/providers/sign_up_provider.dart';
import 'package:podcast_app/app/control_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SignUpProvider(),
          ),

        ],
        child: GetMaterialApp(
          theme:
              ThemeData(canvasColor: Color(0xff2D2C3C), fontFamily: 'circular'),
          debugShowCheckedModeBanner: false,
          home: ControlScreen(),
        ),
      ),
    );
  }
}
