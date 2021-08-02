import 'package:flutter/material.dart';
import 'package:podcast_app/app/auth/view/login_screen.dart';
import 'package:provider/provider.dart';

import '../control/providers/auth_provider.dart';
import '../../home/view/home_screen.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    return !prov.isLogin
        ? LoginScreen()
        : FutureBuilder(
            future: prov.autoLogin(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffF11775),
                    ),
                  ),
                );
              return HomeScreen();
            },
          );
  }
}
