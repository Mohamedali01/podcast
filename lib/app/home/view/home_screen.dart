import 'package:flutter/material.dart';
import 'package:podcast_app/app/auth/control/providers/logout_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LogoutProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await provider.logout();
        },
      ),
    );
  }
}
