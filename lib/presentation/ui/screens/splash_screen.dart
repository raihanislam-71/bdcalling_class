
import 'package:bdcalling_class/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const MainBottomNavScreen());
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Spacer(),
              Text("Welcome...",style: TextStyle(fontSize: 42,fontWeight: FontWeight.w600,),),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height:  16,),
              Text("Version 1.0.0",style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
